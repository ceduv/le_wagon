#================ SIMPLE FORM ===============

<%= form_for [@restaurant, @review] do |f| %>
    <%= f.text_field :content %>
    <%= f.submit "add a review" %>
<% end %>

# or with simple_form_for helper:
  
<%= simple_form_for [@restaurant, @review] do |f| %>
    <%= f.input :content %>
    <%= f.submit "add a review" %>
<% end %>

# which builds the following HTML:
  
  <form id="new_review" class="simple_form new_review" novalidate="novalidate" method="post" enctype="multipart/form-data" action="/restaurants/4/reviews" accept-charset="UTF-8">
    <div style="display:none">
      <input type="hidden" value="✓" name="utf8">
      <input type="hidden" value="9f1vEU0ehfjdq7CSN9Lk5s8lXOQKiBPoabl78NcTfik=" name="authenticity_token">
    </div>
    <div class="mb-3 content required review_content">
      <label class="content required form-label" for="review_content">
      <input id="review_content" class="string content required form-control" type="text" name="review[content]">
    </div>
    <input class="btn btn-default" type="submit" value="add a review" name="commit">
  </form>