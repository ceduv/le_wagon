#=============== VIEW CONTROLLER ==============

# <!-- app/views/articles/_form.html.erb -->

<%= simple_form_for(article) do |f| %>
  <%= f.input :photo, as: :file %>
<% end %>

# app/controllers/articles_controller.rb

def article_params
  params.require(:article).permit(:title, :body, :photo)
end

# Displaying the image
# <!-- app/views/articles/show.html.erb -->
<%= cl_image_tag @article.photo.key, height: 300, width: 400, crop: :fill %>