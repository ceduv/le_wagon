#================== RAILS SETUP ======================

yarn -v
# You should see your yarn version here

# Note: You should now be able to run these steps without this cheat sheet!
# Don’t forget the --database=postgresql (we will talk about this tomorrow). 😉

cd ~/code/ceduv

rails new rails-watch-list --database=postgresql --skip-action-mailbox -T

cd rails-watch-list

# We then need to create the postgresql database for this new rails app.
rails db:create

# Let’s set up git, create a repo on GitHub and push our skeleton.
git add .
git commit -m "rails new"
gh repo create
git push origin master

# Let’s import the teacher’s spec to be able to rake our progress.

echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
rails db:migrate
rails db:test:prepare
git submodule add https://github.com/lewagon/fullstack-challenges-04-Rails-watch-list-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"

# You’ll be able to test your code with:

rails db:migrate RAILS_ENV=test  # If you added a migration
rspec spec/models                # Launch tests

# Before starting to code, don’t forget to setup your Rails app for Front-end,
# like in this morning’s lecture let’s add Bootstrap and its JavaScript dependencies

yarn add bootstrap @popperjs/core

# And add the gems we’re going to need:
# Gemfile
gem "autoprefixer-rails", "10.2.5"
gem "font-awesome-sass", "~> 5.12.0"
gem "simple_form"

bundle install

rails generate simple_form:install --bootstrap

# Replace all the content of your config/initializers/simple_form_bootstrap.rb file with this.
https://github.com/heartcombo/simple_form-bootstrap/blob/main/config/initializers/simple_form_bootstrap.rb

# Then let’s download the Le Wagon’s stylesheets:
rm -rf app/assets/stylesheets
curl -L https://github.com/lewagon/stylesheets/archive/master.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets

# Finally let’s import the Boostrap JS library using Webpack:
# app/javascript/packs/application.js
import "bootstrap";