#============= setup ================

Add gem 'devise' in your Gemfile.
Run bundle install in your terminal.
Run rails g devise:install in your terminal.

Configuration
Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "pages#home"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>


Initializer

# config/initializers/devise.rb

# ==> Mailer Configuration
# Configure the e-mail address which will be shown in Devise::Mailer,
# note that it will be overwritten if you use your own mailer class
# with default "from" parameter.
config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

User Model

rails generate devise User
#      invoke  active_record
#      create    db/migrate/TIMESTAMP_devise_create_users.rb
#      create    app/models/user.rb
#      insert    app/models/user.rb
#       route  devise_for :users
This creates the User model and its migration. So run:

rails db:migrate

Look! (1)
# app/models/user.rb

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
Look! (2)
rails routes
rails routes | grep new_

Views
Helpers
user_signed_in?
# => true / false

current_user
# => User instance / nil
Navbar
You need a Log in / Logout logic.

You can start from this navbar template

mkdir app/views/shared

curl https://raw.githubusercontent.com/lewagon/awesome-navbars/master/templates/_navbar_wagon.html.erb > app/views/shared/_navbar.html.erb

curl https://raw.githubusercontent.com/lewagon/karr-images/master/white_logo_red_circle.png > app/assets/images/logo.png

<!-- app/views/layouts/application.html.erb -->
<%= render 'shared/navbar' %>
Alerts

<!-- app/views/layouts/application.html.erb -->
<%= render 'shared/flashes' %>

<!-- app/views/shared/_flashes.html.erb -->

<% if notice %>
  <div class="alert alert-info alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <%= notice %>
  </div>
<% end %>
<% if alert %>
  <div class="alert alert-warning alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <%= alert %>
  </div>
<% end %>

Customize devise views
Sign in / Sign up / Forget password / […]

rails g devise:views
And look into app/views/devise folder.

Controller
White-list approach
Protect every route by default.

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
Skipping login for some pages
# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
Adding attributes to User
What if we want to add a first_name and last_name at sign up?

Create a migration to add these columns in the users table.
Add new fields in Devise’s sign up and account update forms.
Update the controller:
class ApplicationController < ActionController::Base
  # [...]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end