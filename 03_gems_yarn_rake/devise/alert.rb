#=================== flashes ====================

You can create a partial _flashes.html.erb in app/views/shared,
and include them in your layout.

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
<!-- app/views/layouts/application.html.erb -->
<%= render 'shared/flashes' %>