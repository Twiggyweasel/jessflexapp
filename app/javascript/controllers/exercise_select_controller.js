import { Controller } from 'stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ["exercise", "series", "variations"]

  initialize() {

  }

  get exercise() {
    return this.exerciseTarget.value;
  }

  get series() {
    return this.seriesTarget;
  }

  get variation() {
    return this.variationsTarget;
  }

  getSeries() {
    Rails.ajax({
      type: "GET",
      url: '/admin/exercises/' + this.exercise + '/series.json',
      success: (data) => {
        this.updateSeriesDropdown(data)
      },
      error: this.errorSelect(this.series)
    })
  }

  getVariations() {
    Rails.ajax({
      type: "GET",
      url: '/admin/exercises/' + this.exercise + '/variations.json',
      success: (data) => {
        this.updateVariationsDropdown(data)
      },
      error: this.errorSelect(this.variation)
    })
  }
  updateSeriesDropdown(data) {
    let seriesSelect = this.series

    for(var i = 0; i < data.length; i++) {
      var opt = data[i]
      var id = opt.data.id
      var sets = opt.data.attributes.set
      var reps = opt.data.attributes.rep
      seriesSelect.innerHTML += "<option value=\"" + id + "\">" + sets + " sets with " + reps + " reps </option"
    }
    if(data.length = 1 ) {
      seriesSelect.value = data[0].data.id
    }
    seriesSelect.removeChild(seriesSelect.options[0]);
    seriesSelect.removeAttribute("disabled")
  }

  updateVariationsDropdown(data) {
    let variationsSelect = this.variation

    for(var i = 0; i < data.length; i++) {
      var opt = data[i]
      var id = opt.data.id
      var description = opt.data.attributes.description
      variationsSelect.innerHTML += "<option value=\"" + id + "\">" + description + "</option"
    }
    if(data.length = 1 ) {
      variationsSelect.value = data[0].data.id
    }
    variationsSelect.removeChild(variationsSelect.options[0]);
    variationsSelect.removeAttribute("disabled")
  }

  clearDropdowns() {
    this.variation.innerHTML = "<option>Loading options...</option>"
    this.variation.setAttribute("disabled", "true")
    this.series.innerHTML = "<option>Loading options...</option>"
    this.series.setAttribute("disabled", "true")
  }

  errorSelect(select) {
    select.innerHTML = "<option>Unable to get items</option>"
  }
}