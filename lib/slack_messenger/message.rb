module SlackMessenger
  class Message
    def initialize(text, attachments={})
      @text         = text
      @attachments  = attachments
    end

    def send!
      Api.send self
    end

    def as_json
      hash = {text: @text}
      hash[:attachments] = @attachments.map(&:as_json) unless @attachments.nil? || @attachments.empty?
      hash
    end
  end
end
