import { Controller } from 'stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static classes = ["active"]
  static targets = ["link"]
  activate(e) {
    e.preventDefault();
    this.clear();
    console.log("activated");
    event.currentTarget.classList.add("active");
  }

  clear() {
    let links = this.element.getElementsByTagName('a')
    for(var i = 0; i < links.length; i++) {
      links[i].classList.remove("active")
    }
  }
}