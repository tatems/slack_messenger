module SlackMessenger
  class Message
    def initialize(text, channel='#general', user=nil, attachments={})
      @text         = text
      @channel      = channel
      @user         = user
      @attachments  = attachments
    end

    def send!
      Api.send self
    end

    def as_json
      {
        text: @text,
        channel: @channel,
        user: @user,
        attachments: @attachments.map(&:as_json)
      }
    end

    def valid
      true # TODO: check validity
    end
  end
end
