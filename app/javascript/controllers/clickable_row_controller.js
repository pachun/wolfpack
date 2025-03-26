// app/javascript/controllers/clickable_row_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    url: String,
  };

  navigate() {
    console.log("Navigating to:", this.urlValue);
    if (this.urlValue) {
      window.location = this.urlValue;
    }
  }
}
