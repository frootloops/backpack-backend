module ApplicationCable
  class ConversationChannel < ActionCable::Channel::Base
    def subscribed
      stream_from channel_name
    end

    def receive(data)
      ActionCable.server.broadcast channel_name, data
    end

    def channel_name
      "conversations/#{current_traveler.id}"
    end
  end
end
