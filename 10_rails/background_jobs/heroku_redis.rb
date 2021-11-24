#========= HEROKU REDIS ============

https://elements.heroku.com/addons/rediscloud

# We’ll use Redis Cloud
heroku addons:create rediscloud

# config/initializers/redis.rb
$redis = Redis.new

url = ENV["REDISCLOUD_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end


# Update your Procfile file
# Procfile
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml

# Then you must:
# 1 - Commit
# 2 - Deploy
# 3 - Go to Heroku Dashboard to set dynos. Or your cli:
heroku ps:scale worker=1
heroku ps # Check worker dyno is running

# Heroku Cron jobs
Use the Heroku Scheduler