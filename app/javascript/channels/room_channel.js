import consumer from "./consumer"

// showNewMessage();
// const showNewMessage = () => {
//   var nodes = document.querySelectorAll(".message.mb-2")
//   nodes = Array.from(nodes)
//   nodes.pop()
//   .scrollIntoView({
//     behavior: "instant",
//     block: "start"
//   });
// }

document.addEventListener('turbolinks:load', () => {
    const room_element = document.getElementById("room-id");
  const room_id = Number(room_element.getAttribute("data-room-id"));
  // console.log(consumer.subscriptions);
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {

    connected() {
      // console.log("conneted to" + room_id)
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      const user_element = document.getElementById("user-id");
      const user_id = Number(user_element.getAttribute("data-user-id"));
      
      let html;
      
      if (user_id === data.message.user_id) {
        html = data.mine
      } else {
        html = data.theirs
      }
      
      const messageContainer = document.getElementById("messages");
      messageContainer.innerHTML = messageContainer.innerHTML + html
      console.log(data)
    }
  });
})
//helper
const isSubscribed = (channel, room_id, user_id) => {

}
