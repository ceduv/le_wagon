#=========== PUNDIT ==============

# Gemfile
gem 'pundit'

bundle install
rails g pundit:install

#-----

class ApplicationController < ActionController::Base
    # [...]
    before_action :authenticate_user!
    include Pundit
  
    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
    # Uncomment when you *really understand* Pundit!
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # def user_not_authorized
    #   flash[:alert] = "You are not authorized to perform this action."
    #   redirect_to(root_path)
    # end
  
    private
  
    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
  end

#-----

# 1
Usage
Protect Restaurant
rails g pundit:policy restaurant
# => generates the file `app/policies/restaurant_policy.rb`

# 2
Anyone
# app/policies/restaurant_policy.rb
class RestaurantPolicy < ApplicationPolicy
  def create?
    return true
  end
end

# 3
And in the controller, use
authorize @restaurant

# 4
Update the views!
<% if policy(Restaurant).create? % >                    # %>
  <%= link_to "New restaurant", new_restaurant_path % > # %>
<% end % >                                              # %>
Passing a class to policy as we don’t have a specific restaurant instance.

# 5
Rinse & repeat for update and destroy
# app/policies/restaurant_policy.rb
class RestaurantPolicy < ApplicationPolicy
  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
In the view we can use policy with an instance.

<% @restaurants.each do |restaurant| % >
  <% if policy(restaurant).edit? % >
    <%= link_to "Update", edit_restaurant_path(restaurant) % >
  <% end % >
<% end % >

# 6
Scope
Special case for index action:
# app/controllers/restaurants_controller.rb
class RestaurantsController < ApplicationController
    def index
      @restaurants = policy_scope(Restaurant).order(created_at: :desc)
    end
end
  
# app/policies/restaurant_policy.rb
class RestaurantPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
  
        # For a multi-tenant SaaS app, you may want to use:
        # scope.where(user: user)
      end
    end
end

# 7
Admin users
rails g migration AddAdminToUsers admin:boolean
rails db:migrate
rails c
pry> user = User.where(email: 'seb@lewagon.org').first
pry> user.admin = true
pry> user.save
You can now use this admin field in your policies!