#======= ACTIVE JOB =========

# rails guide
https://edgeguides.rubyonrails.org/active_job_basics.html

# le wagon guide
https://kitt.lewagon.com/camps/730/lectures/06-Projects%2F03-Advanced-Admin#source

# Starting from a template

rails new \
  --database postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb \
  background-jobs-demo

# We need admins to protect the jobs dashboard.
rails g migration AddAdminToUsers

def change
  add_column :users, :admin, :boolean, null: false, default: false
end

rails db:migrate

#---

# Our first job

rails generate job fake

# app/jobs/fake_job.rb
class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end

# Run the job

It will get run synchronously. Open a rails c and run:

FakeJob.perform_now

#---

# Dependency over Redis
Redis is a key-value store. Think of it as a PostgreSQL database storing hashes in memory.
Sidekiq needs it.

# On OSX
brew update
brew install redis
brew services start redis
# Ubuntu
sudo apt-get install redis-serve