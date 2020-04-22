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
    console.log('receiving')
  },

  send_message(message) {
    this.perform('send_message', message)
  }
});

$(document).on('turbolinks:load', function() {
  $('#message-submit').click(function() {
    var message_body = $('#message-body').val()

    if($.trim(message_body).length > 0) {
      channel.send_message({body: message_body})
    }
  })}
)

