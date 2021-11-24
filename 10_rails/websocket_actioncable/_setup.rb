#========= WEBSOCKET ACTIONCABLE =========

https://kitt.lewagon.com/camps/730/lectures/06-Projects%2F01-Pundit#source


# Start from a template
rails new \
  --database postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/bootstrap-5/devise.rb \
  rails-action-cable-chat
cd rails-action-cable-chat

rails g migration AddNicknameToUsers nickname
rails g model Chatroom name
rails g model Message content chatroom:references user:references
rails db:migrate


# Chatroom model
class Chatroom < ApplicationRecord
  has_many :messages
end
rails c
> Chatroom.create(name: "general")
> User.create(email: "seb@lewagon.org", nickname: "ssaunier", password: "123456")
> User.create(email: "boris@lewagon.org", nickname: "Papillard", password: "123456")


# Chatrooms route and controller
# config/routes.rb
# [...]
resources :chatrooms, only: :show

rails g controller chatrooms

# app/controllers/chatrooms_controller.rb
class ChatroomsController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
    end
end


# Chatrooms show view
<!-- app/views/chatrooms/show.html.erb -->
<div class="container chatroom">
  <h1>#<%= @chatroom.name %></h1>

  <div class="messages">
    <% @chatroom.messages.each do |message| % >  #***
      <div id="message-<%= message.id %>">
        <small>
          <strong><%= message.user.nickname %></strong>
          <i><%= message.created_at.strftime("%a %b %e at %l:%M %p") %></i>
        </small>
        <p><%= message.content %></p>
      </div>
    <% end %>
  </div>
</div>


# Update the navbar
# Replace the avatar by current_user.nickname to see the context:
<!-- app/views/shared/_navbar.html.erb -->
<!-- [...] -->
<% if user_signed_in? %>
  <li class="nav-item d-flex align-items-center">
    <strong><%= current_user.nickname %></strong>
  </li>
<% else % >


# Add some style
curl https://raw.githubusercontent.com/lewagon/rails-action-cable-chat/stimulus/app/assets/stylesheets/components/_chatroom.scss \
  > app/assets/stylesheets/components/_chatroom.scss
Don’t forget to @import "chatroom"; in components/_index.scss


# Testing
rails s
Sign in with 2 different users using 2 browsers (or one private window)

Go to localhost:3000/chatrooms/1


# Messages route and controller
# config/routes.rb
# [...]
resources :chatrooms, only: :show do
  resources :messages, only: :create
end

rails g controller messages


# Chatrooms show view
Define @message in ChatroomsController#show

<!-- app/views/chatrooms/show.html.erb -->
<!-- [...] -->
<%= simple_form_for [@chatroom, @message], remote: true do |f| %>
  <%= f.input :content, label: false, placeholder: "Message ##{@chatroom.name}" %>
<% end % > #***


# Messages create action
# app/controllers/messages_controller.rb
# [...]
def create
  @chatroom = Chatroom.find(params[:chatroom_id])
  @message = Message.new(message_params)
  @message.chatroom = @chatroom
  @message.user = current_user
  if @message.save
    redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
  else
    render "chatrooms/show"
  end
end
Don’t forget the strong params!

# Testing
# Create a message with Seb in a window.
# Problem: Boris has to refresh to see it

==> Action Cable