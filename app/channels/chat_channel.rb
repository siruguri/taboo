class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'main_room'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    b = data['body']

    m = Message.create body: b, author: current_user

    ActionCable.server.broadcast 'main_room', message: {body: m.body, author: current_user.name}
  end

end
