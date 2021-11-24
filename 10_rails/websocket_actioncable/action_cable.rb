#========= ACTION CABLE ============

1. Generate the channel
2. Subscribe each client
3. Broadcast data in the channel

#---
# Generate the channel
rails g channel Chatroom

# Make the channel specific to 1 chatroom:

class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
end


#---
# Create a Stimulus controller
touch app/javascript/controllers/chatroom_subscription_controller.js
# // app/javascript/controllers/chatroom_subscription_controller.js
import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
  }
}

# consumer is a file created during rails new to implement ActionCable.
# chatroomIdValue is the id of the chatroom we are going to subscribe to.


#---
# Connect it to your message list
<!-- app/views/chatrooms/show.html.erb -->
<!-- [...] -->
<div class="messages"
  data-controller="chatroom-subscription"
  data-chatroom-subscription-chatroom-id-value="<%= @chatroom.id %>"
>
  <% @chatroom.messages.each do |message| %>
<!-- [...] -->


#---
# Subscribe each client
// app/javascript/controllers/chatroom_subscriptions_controller.js
//[...]
  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }
# received stores the function which is called when data is broadcasted in the channel.


#---
# Refactor the message into a partial
<!-- app/views/chatrooms/show.html.erb -->
<!-- [...] -->
<div class="messages"
  data-controller="chatroom-subscription"
  data-chatroom-subscription-chatroom-id-value="<%= @chatroom.id %>"
>
  <% @chatroom.messages.each do |message| %>
    <%= render "messages/message", message: message %>
  <% end %>
</div>

<!-- app/views/messages/_message.html.erb -->
<div id="message-<%= message.id %>">
  <small>
    <strong><%= message.user.nickname %></strong>
    <i><%= message.created_at.strftime("%a %b %e at %l:%M %p") %></i>
  </small>
  <p><%= message.content %></p>
</div>


#---
# Broadcast each new message
# In the create action, after @message.save, add:

# app/controllers/messages_controller.rb
# [...]
ChatroomChannel.broadcast_to(
  @chatroom,
  render_to_string(partial: "message", locals: {message: @message})
)


#---
# Testing
# Open the console in Seb’s tab and post a message from Boris

# Update the callback
# In the received callback, insert the new message in the DOM:

// app/javascript/controllers/chatroom_subscriptions_controller.js
// [...]
received: data => this.element.insertAdjacentHTML("beforeend", data)


#---
# Unsubscribe from the channel
// app/javascript/controllers/chatroom_subscriptions_controller.js
//[...]
disconnect () {
  console.log("Unsubscribed from the chatroom")
  this.channel.unsubscribe()
}

# The disconnect() method is called when the controller disappears from the DOM
# At this moment, we unsubscribe from the channel.
# Have a look at the logs!


#---
# Production
# Redis
# ActionCable needs Redis to work in production.
https://redis.io/
# Read more about the global state introduced by WebSocket in a Web App.
https://devcenter.heroku.com/articles/websockets#application-architecture


# Configure Redis Cloud and deploy
# Install Redis Cloud Heroku add-on:
https://elements.heroku.com/addons/rediscloud

heroku addons:create rediscloud:30

# Replace REDIS_URL by REDISCLOUD_URL:
# config/cable.yml
  # [...]
  url: <%= ENV.fetch("REDISCLOUD_URL") { "redis://localhost:6379/1" } % > #***
  # [...]

# Commit your work and deploy it to production:
git push heroku master


#---
# Extra Resources
# Action Cable documentation
https://guides.rubyonrails.org/action_cable_overview.html
# Action Cable Cheatsheet
https://kitt.lewagon.com/knowledge/cheatsheets/actioncable
# The full source code of the lecture is available on GitHub
https://github.com/lewagon/rails-action-cable-chat/tree/stimulus