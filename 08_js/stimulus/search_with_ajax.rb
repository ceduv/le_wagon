#========== STIMULUS AJAX ==============

https://kitt.lewagon.com/camps/730/lectures/06-Projects%2F02-i18n#source

# Controller and targets

<!-- index.html.erb -->
<div data-controller="search-movies">
  <%= form_with url: movies_path, method: :get, html: { class:
    'mb-4', data: { search_movies_target: 'form' } } do |f| %>
    <%= f.text_field :query,
                     class: "form-control",
                     placeholder: 'Type a movie title',
                     value: params[:query],
                     data: { search_movies_target: 'input' } %>
  <!-- [...] -->

<!-- list.html.erb -->
<div data-search-movies-target="list">
<!-- [...] -->

#---

# Stimulus controller
touch app/javascript/controllers/search_movies_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'list'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
  }
}

#---

# Action and callback

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'list'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
  }
}

#---

# AJAX request

update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }

#---

# Unobtrusive Javascript

# app/controllers/movies_controller.rb
def index
    # ...
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'movies/list', locals: { movies: @movies }, formats: [:html] }
    end
end

#---

# Inline update of a movie

Reveal the form
<div class="movie-card" data-controller="edit-movie">
  <%= image_tag movie.image_url %>

  <div class="movie-infos" data-edit-movie-target="infos">
    <h2><%= movie.title %> <small>(<%= movie.year %>)</small></h2>
    <i class="fas fa-pen fa-xs ms-2" data-action="click->edit-movie#displayForm"></i>
  </div>

  <%= simple_form_for movie, html: { class: 'd-none', data: { edit_movie_target: 'form' } } do |f| %>
<!-- ... -->

#---

# Stimulus controller

touch app/javascript/controllers/edit_movie_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['infos', 'form'];

  displayForm() {
    this.infosTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}

#---

# Listen to form submission

<%= simple_form_for movie, html: { class: 'd-none',
    data: { edit_movie_target: 'form', action: 'submit->edit-movie#update' }
    } do |f| % > #***

#---

# Ajax request

# app/javascript/controllers/edit_movie.js
update(event) {
  event.preventDefault();
  const url = this.formTarget.action
  fetch(url, {
    method: 'PATCH',
    headers: { 'Accept': 'text/plain' },
    body: new FormData(this.formTarget)
  })
    .then(response => response.text())
    .then((data) => {
      console.log(data);
    })
}

#---

# Rails route and action

# config/routes.rb
resources :movies, only: [:index, :update]
# app/controllers/movies_controller.rb
def update
  @movie = Movie.find(params[:id])
  @movie.update(movie_params)

  respond_to do |format|
    format.html { redirect_to movies_path }
    format.text { render partial: 'movies/movie_infos', locals: { movie: @movie }, formats: [:html] }
  end
end

private

def movie_params
  params.require(:movie).permit(:title, :year)
end

#---

# Replace the card

<!-- movies_infos.html.erb -->
<div class="movie-card" data-controller="edit-movie" data-edit-movie-target="card">

# app/javascript/controllers/edit_movie.js
// ...
static targets = ['infos', 'form', 'card']; // Add the new target

update(event) {
  // ...
  .then((data) => {
    this.cardTarget.outerHTML = data;
  })
}

#---

# Display the form with errors

<!-- movie_infos.html.erb -->
<!-- ... -->
<div class="movie-infos <%= 'd-none' if movie.errors.any? %>" data-edit-movie-target="infos">
<!-- ... -->
<%= simple_form_for movie, html: { class: movie.errors.any? ? '' : 'd-none',
  data: { edit_movie_target: 'form', action: 'submit->edit-movie#update' } }
  do |f| %>