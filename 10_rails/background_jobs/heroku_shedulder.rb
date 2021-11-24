#========== HEROKU SHEDULDER =============

https://devcenter.heroku.com/articles/scheduler

# With Heroku Scheduler.

You need to setup a rake task in your project, and specify on Heroku Scheduler which task and its frequency.

# lib/tasks/user.rake
namespace :user do
  desc "Enriching all users"
  task enrich: :environment do
    puts "Rake task starting"
    FakeJob.perform_later
    puts "Rake task done"
  end
end