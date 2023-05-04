import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    static values= {
        chatId: String
    }

    load(event) {
        event.preventDefault();
        const chatId = this.chatIdValue;
        const messagesDiv = document.getElementById('messages');

        fetch(`/chats/${chatId}/messages`)
            .then(response => response.text())
            .then(html => {
                messagesDiv.innerHTML = html;
                console.log(html)
            });
    }

    reset() {
        this.element.reset()
    }
}
