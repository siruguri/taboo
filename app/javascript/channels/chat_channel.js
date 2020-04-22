import * as $ from 'jquery';
import consumer from "./consumer"

var channel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var m = data.message
    var body = m.body
    var name = m.author

    var parent = $('.chat-box')
    var child
    child = $('<div/>').addClass('name').text(name)
    parent.append(child)

    child = $('<div/>').addClass('message').text(body)
    parent.append(child)

    var objDiv = document.getElementById("chat-box")
    objDiv.scrollTop = objDiv.scrollHeight
  },

  send_message(message) {
    this.perform('send_message', message)
  }
});

$(document).on('turbolinks:load', function() {
  $('#message-submit').click(function() {
    var box = $('#message-body')
    var message_body = box.val()

    if($.trim(message_body).length > 0) {
      box.val('')
      channel.send_message({body: message_body})
    }
  })}
)

