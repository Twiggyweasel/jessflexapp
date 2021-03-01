import { Controller } from 'stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ["container", "selection"]
  static values = { show: String, form: String }

  fetch(e) {
    e.preventDefault();
    this.reset()
    
    var record = event.currentTarget.dataset.record
    var final = this.showValue + record
    console.log("record: " + record)
    console.log(record)
    if(record == 0) {
      final = this.formValue
    }
    console.log("final Url: " + final);
    Rails.ajax({
      type: "GET",
      url: final,
      success: (data) => {
        this.add_content(data);
      },
      error: { }
    })
  }

  add_content(data) {
    this.containerTarget.innerHTML = data.html
  }

  reset() {
    this.containerTarget.innerHTML = ""
  }
}