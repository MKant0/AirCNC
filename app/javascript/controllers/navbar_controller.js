import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("hello from the nav bar controller")
  }

  // updateNavbar() {
  //   if (window.scrollY >= 0) {
  //     this.element.classList.add("navbar-lewagon-white")
  //   } else {
  //     this.element.classList.remove("navbar-lewagon-white")
  //   }
  // }
}
