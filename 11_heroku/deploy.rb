#======== deploy ===============

# Install on OS X
brew tap heroku/brew && brew install heroku

# Install on Ubuntu
curl https://cli-assets.heroku.com/install.sh | sh

# Help
heroku
Usage: heroku COMMAND [--app APP] [command-specific-options]
Primary help topics, type "heroku help TOPIC" for more details:
  addons     # manage addon resources
  apps       # manage apps (create, destroy)
  auth       # authentication (login, logout)
  config     # manage app config vars
  domains    # manage custom domains
  logs       # display logs for an app
  ps         # manage dynos (dynos, workers)
  releases   # manage app releases
  run        # run one-off commands (console, rake)
  sharing    # manage collaborators on an app

# Login
heroku login -i
# ⚠️ If you have 2FA enabled, do not use the -i flag.

# Create an Heroku app
heroku create $YOUR_APP_NAME --region eu
# opt your app name

# What happened?
git remote -v

# Let’s deploy!
git push heroku master

# Run a command on heroku
heroku run <command>         # Syntax
heroku run rails db:migrate  # Run pending migrations in prod
heroku run rails c           # Run the production console

# Useful commands
heroku open         # open in your browser
heroku logs --tail  # show the app logs and keep listening

#==================================
# api key

heroku config:set CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-*******************

#==================================
# si pb au deploiement sur mac
# conf les gems pour linux
bundle lock --add-platform ruby
bundle lock --add-platform x86_64-linux
bundle install
git add . ; git commit -m "Bundler fix"
git push origin master
git push heroku master