#=========== LINK TO ===============

# simple link_to
<td><%= link_to 'Show', garden %></td>

<td><%= link_to 'Edit', edit_garden_path(garden) %></td>

# whith method
<%= link_to 'Destroy', garden, method: :delete, data: { confirm: 'Are you sure?' } %>
