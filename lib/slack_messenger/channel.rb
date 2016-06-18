module SlackMessenger
  class Channel
    def initialize(name)
      @name = name
    end

    def send_message(message)
      message.channel = self
      message.send!
    end
  end
end
