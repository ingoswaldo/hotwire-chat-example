import { Controller } from '@hotwired/stimulus'
import { removeBgGrayClassOfChatsContainer } from "../globalFunctions"

export default class extends Controller {
    static values= {
        modalId: String
    }

    initialize() {
        this.observeContainer();
    }

    loadChatMessages(addedLink){
        addedLink.click()
    }

    observeContainer() {
        const observer = new MutationObserver((mutationsList, observer) => {
            for (const mutation of mutationsList) {
                if (mutation.type === "childList") {
                    const addedLinks = Array.from(mutation.addedNodes).filter(node => {
                        return node instanceof HTMLElement && node.tagName.toLowerCase() === "a";
                    });

                    if (addedLinks.length === 1) this.loadChatMessages(addedLinks.at(0))
                }
            }
        })

        observer.observe(document.getElementById("chats_channel"), { childList: true });
    }

    reset(event) {
        if(event.detail.success) {
            document.getElementById(this.modalIdValue).checked = false
        }

        this.element.reset()
    }
}