class MessagesController < WebsocketRails::BaseController
  def new
    # data = { msg: 'msg recieved.' }
    # send_message :spread_message, message
    broadcast_message :spread_message,  message
  end
end