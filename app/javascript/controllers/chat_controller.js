import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static values= {
        modalId: String
    }

    reset(event) {
        if(event.detail.success) {
            document.getElementById(this.modalIdValue).checked = false
        }

        this.element.reset()
    }
}