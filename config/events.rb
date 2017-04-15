WebsocketRails::EventMap.describe do
  subscribe :send_message, 'messages#new'
end
