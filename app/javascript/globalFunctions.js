export function removeBgGrayClassOfChatsContainer(){
    const container = document.getElementById('chats-container')
    if(container.hasChildNodes()){
        container.querySelectorAll('.bg-gray-100').forEach(element => { element.classList.remove('bg-gray-100') })
    }
}