#============== STIMULUS ===================

# Controllers
# Connect DOM elements to Javascript

<div data-controller="movie-card">
  <!-- ...  -->
</div>

#---

# Targets
# Defined by data-<controller>-target attributes within the data-controller element

<p class="d-none" data-movie-card-target="content">
  <!-- ... -->
</p>

# Select them in your Javascript controller

# app/javascript/controllers/movie_card_controller.js
import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["content"]

  connect() {
    console.log(this.contentTarget);
  }
}

#---

# Actions
# Defined by data-action attributes on the tags listening to events

<i class="caret-down" data-action="click->movie-card#revealContent"></i>

# Implement the callback in your Javascript controller

# app/javascript/controllers/movie_card_controller.js
import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["content"]

  revealContent() {
    this.contentTarget.classList.remove("d-none")
  }
}