import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  //部屋に入ると同時に入力フォームをフォーカス
  document.querySelector("#message_content").focus();
  
  const room_element = document.getElementById("room-id");
  const room_id = room_element.getAttribute("data-room-id");

  //最新のメッセージへスクロール
  scrollToNewMessage();
  function scrollToNewMessage() {
    var nodes = document.querySelectorAll(".message.mb-2")
    nodes = Array.from(nodes)
    nodes.pop().scrollIntoView({
      behavior: "instant",
      block: "start"
    });
  }

  //全部屋に同時に送信しないように部屋を移動するたびにサブスクを全削除
  //応急処置
  consumer.subscriptions.subscriptions.forEach((sub) => {
    consumer.subscriptions.remove(sub)
  })

  //チャンネルがサブスクされてる数を取得
  function countSpecificChannel(channel, room) {
    var i = 0;
    var subscriptions = consumer.subscriptions.subscriptions;
    subscriptions.forEach(function (subscription) {
      var identifier = subscription.identifier;
      var obj = JSON.parse(identifier);
      if (channel == obj.channel && room == obj.room_id) {
        i += 1;
      }
    });
    return i;
  }

  //そのチャンネルがすでにサブスクされてたら新たに作成しない
  //重複防止
  if (countSpecificChannel("RoomChannel", room_id) === 1) {
    return;
  } else {

    consumer.subscriptions.create({
      channel: "RoomChannel",
      room_id: room_id
    }, {

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
        // console.log(data)
      }
    });
  }
})