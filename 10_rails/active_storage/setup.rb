#============= setup ===============

rails active_storage:install
rails db:migrate
# This creates two tables in the database
# to handle the associations between our
# pictures uploaded on Cloudinary and any Model in our app.