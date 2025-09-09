import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "icon"]

  connect() {
    this.openIcon = ""
    this.closedIcon = ""

    this.iconTarget.textContent = this.openIcon
  }

  toggle() {
    this.contentTarget.classList.toggle("hidden")

    if (this.contentTarget.classList.contains("hidden")) {
      this.iconTarget.textContent = this.closedIcon
    } else {
      this.iconTarget.textContent = this.openIcon
    }
  }
}
