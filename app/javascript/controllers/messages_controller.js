import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    static targets = ['container']
    static values= {
        chatId: String,
        currentUserId: String
    }

    containerTargetConnected() {
        document.addEventListener("turbo:before-stream-render", this.handleStreamEvent)
    }

    containerTargetDisconnected() {
        document.removeEventListener("turbo:before-stream-render", this.handleStreamEvent)
    }

    handleStreamEvent = event => {
        if (event.target.target === 'messages'){
            const templateContent = event.detail.newStream.templateElement.content.firstElementChild;
            const chatBubbleElement = templateContent.firstElementChild
            const creatorId = chatBubbleElement.getAttribute('data-message-creator-id')

            if(creatorId === this.currentUserIdValue){
                templateContent.classList.replace('chat-start', 'chat-end')
                templateContent.firstElementChild.classList.add('chat-bubble-success', 'text-base-100')
            }

            this.containerTarget.append(templateContent)
            this.containerTarget.lastElementChild.scrollIntoView()
        }
    }

    load(event) {
        event.preventDefault();
        const chatId = this.chatIdValue
        const messagesDiv = document.getElementById('chat-selected')

        fetch(`/chats/${chatId}/messages`)
            .then(response => response.text())
            .then(html => {
                messagesDiv.innerHTML = html;
                messagesDiv.querySelector('#messages').lastElementChild.scrollIntoView()
                messagesDiv.querySelector('#message_message').focus()
            });
    }

    reset() {
        this.element.reset()
    }
}
