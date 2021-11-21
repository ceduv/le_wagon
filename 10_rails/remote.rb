#============ REMOTE =============

# AJAX
# turbolink

<%= simple_form_for([ restaurant, review ], remote: true) do |form| %>
    <%= form.input :content %>
    <%= form.button :submit %>
  <% end %>

<%= link_to "Delete", restaurant_path(@restaurant), method: :delete, remote: true %>
