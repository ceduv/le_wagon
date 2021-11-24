#=========== SETUP ==============

# Gemfile
gem 'sidekiq'
gem 'sidekiq-failures', '~> 1.0'
bundle install
bundle binstub sidekiq

# config/application.rb
class Application < Rails::Application
    # [...]
    config.active_job.queue_adapter = :sidekiq
end

# config/routes.rb
Rails.application.routes.draw do
    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
end

# config/sidekiq.yml
:concurrency: 3
:timeout: 60
:verbose: true
:queues:
  # Queue priority:
  # https://github.com/mperham/sidekiq/wiki/Advanced-Options
  # https://mikerogers.io/2019/06/06/rails-6-sidekiq-queues
  - default
  - mailers
  - active_storage_analysis
  - active_storage_purge

#---

# Using ActiveJob

Let’s start Sidekiq
Open a new terminal tab and run:
sidekiq

Enqueue our first job
Open a rails console with rails c and run:
FakeJob.perform_later

#---

# Arguments
You can pass arguments to the perform_later method.

# app/jobs/update_user_job.rb
class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Calling Clearbit API for #{user.email}..."
    # TODO: perform a time consuming task like Clearbit's Enrichment API.
    sleep 2
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end

#---

# Global ID (1/2)
When a Job is enqueued, the arguments are serialized.
ActiveJob uses Global ID to convert user into a String:

user = User.find(1)
user.to_global_id #=> #<GlobalID:0x000055988bc4dd20 [...] gid://background-jobs-demo/User/1>>
user.to_global_id.to_s #=> "gid://background-jobs-demo/User/1"

# Global ID (2/2)
Before performing the job, ActiveJob deserializes the user in the background:
user = GlobalID.find(serialized_user) #=>  #<User id: 1 [...]>
BEWARE if you use another framework for background jobs (e.g. Sidekiq::Worker), pass ids or strings as arguments, not full objects.

#---

# Enqueue from a model

# app/models/user.rb
class User < ApplicationRecord
  # [...]

  after_commit :async_update # Run on create & update

  private

  def async_update
    UpdateUserJob.perform_later(self)
  end
end


# Enqueue from a controller

# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  def update
    if current_user.update(user_params)
      UpdateUserJob.perform_later(current_user)  # <- The job is queued
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    # Some strong params of your choice
  end
end


# Enqueue from a rake task (1)
rails g task user update_all

# lib/tasks/user.rake
namespace :user do
  desc "Enriching all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
# Look, there's a new task!
rails -T | grep user

# We can run it with
rails user:update_all


# Enqueue from a rake task (2)
# lib/tasks/user.rake
namespace :user do
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end
end
# Update user of id 42 with this command
noglob rails user:update[42]

#---

# Mailers
No need to write a job, just call deliver_later.

# UserMailer.welcome(user).deliver_now
UserMailer.welcome(user_id).deliver_later

# (Enqueued to the mailers queue)
# More about Mailers in Rails

# Delay the job
FakeJob.set(wait: 1.minute).perform_later
FakeJob.set(wait_until: Date.tomorrow.noon).perform_later
# By default, Sidekiq checks for scheduled job every 5 seconds