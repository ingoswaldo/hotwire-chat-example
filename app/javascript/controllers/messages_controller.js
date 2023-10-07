import { Controller } from '@hotwired/stimulus'
import { removeBgGrayClassOfChatsContainer } from "../globalFunctions"

export default class extends Controller {
    static targets = ['container']
    static values= {
        chatId: String,
        currentUserId: String,
        currentUserSettings: Object
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
            const sourceLanguage = chatBubbleElement.getAttribute('data-message-source-language')

            if(creatorId === this.currentUserIdValue){
                templateContent.classList.replace('chat-start', 'chat-end')
                templateContent.firstElementChild.classList.add('chat-bubble-success', 'text-base-100')
            }

            if(this.currentUserSettingsValue.live_translation && this.currentUserSettingsValue.translation_language !== sourceLanguage){
                const message= chatBubbleElement.innerHTML
                const data = { message: message, source_language: sourceLanguage }
                const headers = { 'X-CSRF-Token': this.csrfToken(), 'Content-Type': 'application/json' }
                chatBubbleElement.innerHTML = 'translating...'
                fetch('/translate', { method: 'POST', body: JSON.stringify(data), headers: headers })
                    .then(response => response.json())
                    .then(json => { chatBubbleElement.innerHTML = json.message })
                    .catch(error => { chatBubbleElement.innerHTML = message })
            }

            this.containerTarget.append(templateContent)
            this.containerTarget.lastElementChild.scrollIntoView()
        }
    }

    load(event) {
        event.preventDefault();
        this.updateChatContainer(event.target);

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

    updateChatContainer(elementClicked) {
        removeBgGrayClassOfChatsContainer()
        if (elementClicked.tagName.toLowerCase() === 'a') {
            elementClicked.firstElementChild.classList.add('bg-gray-100')
            return
        }

        elementClicked.closest("a > *").classList.add('bg-gray-100')
    }

    reset() {
        this.element.reset()
    }

    csrfToken() {
        const meta = document.querySelector('meta[name=csrf-token]');
        const token = meta && meta.getAttribute('content');

        return token ?? false;
    }
}
