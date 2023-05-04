import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static values= {
        modalId: String
    }

    reset() {
        if(event.detail.formSubmission.result.fetchResponse.statusCode === 200) {
            document.getElementById(this.modalIdValue).checked = false
        }
        this.element.reset()
    }
}