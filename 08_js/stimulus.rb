#============== STIMULUS ====================

# In your view, wrap the HTML within a data-controller.
# Use data-target to select DOM elements and data-action
# to trigger an action on a specific event:

# <!-- app/views/pages/home.html.erb -->
<div data-controller="disable-button">
  <button data-disable-button-target="button" data-action="click->disable-button#disable">
    Click me!
  </button>
  <a data-disable-button-target="link" data-action="click->disable-button#reset">Reset</a>
</div>

# In your disable_button Stimulus controller,
# list the targets in the targets array and code
# the logic of each action:

# app/javascript/controllers/disable_button_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "link"];

  disable() {
    this.buttonTarget.innerText = "Bingo!";
    this.buttonTarget.setAttribute("disabled", "");
    this.linkTarget.classList.remove("d-none");
  }

  reset() {
    this.buttonTarget.innerText = "Click me!";
    this.buttonTarget.removeAttribute("disabled");
    this.linkTarget.classList.add("d-none");
  }
}