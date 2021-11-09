#=============== FORM ====================

<!-- app/views/restaurants/_form.html.erb -->
<%= form_for(restaurant) do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %>
  <%= f.label :address %>
  <%= f.text_field :address %>
  <%= f.submit %>
<% end %>
<!-- app/views/restaurants/new.html.erb -->
<%= render 'form', restaurant: @restaurant %>
<!-- app/views/restaurants/edit.html.erb -->
<%= render 'form', restaurant: @restaurant %>

<%= form_for(@restaurant) do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %>

  <%= f.label :address %>
  <%= f.text_field :address %>

  <%= f.label :stars %>
  <%= f.number_field :stars %>

  <%= f.submit %>
<% end %>