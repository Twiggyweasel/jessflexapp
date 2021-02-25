import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "number", "label" ]  
  label() {
    this.labelTarget.value = this.numberTarget.value
  }
}