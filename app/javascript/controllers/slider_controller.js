import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "field", "range" ]  
  label() {
    this.fieldTarget.value = this.rangeTarget.value
  }

  slider() {
    if (this.rangeTarget.value != this.fieldTarget.value) {
      this.rangeTarget.value = this.fieldTarget.value
    }
  }
}