class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'main_room'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    b = data['message']['body']

    Message.create body: b, author: current_user
  end
end
