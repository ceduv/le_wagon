#============== BOOTSTRAP ===================

https://github.com/lewagon/rails-stylesheets/blob/master/README.md

#
yarn add bootstrap
# remplacer le file application.css
rm app/assets/stylesheets/application.css
touch app/assets/stylesheets/application.scss
code .
# ds application.scss
@import "bootstrap/scss/bootstrap";
# picks it up in node_modules!