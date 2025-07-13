import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["source"]

  copy() {
    console.log(this.sourceTarget.value)
    navigator.clipboard.writeText(this.sourceTarget.value)
  }
}
