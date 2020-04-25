import * as $ from 'jquery'

document.addEventListener('turbolinks:load', function(){
  var body = $('body')
  var chat = $('.newbox')

  if(chat.length > 0) {
    chat.detach()
    var existing_chat = $('#existing')

    if(existing_chat.length == 0) {
      chat.attr('id', 'existing')
      chat.removeClass('newbox')
      body.after(chat)
    }
  }
})
