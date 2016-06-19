module SlackMessenger
  class Message
    def initialize(options = {})
      @text = options[:text] || ""

      if options.has_key? :attachments
        @attachments = options[:attachments].is_a?(Array) ? options[:attachments] : [options[:attachments]]
      end
    end

    def send! override_api = nil
      Api.send(self, override_api)
    end

    def as_json
      hash = {text: @text}
      hash[:attachments] = @attachments.map(&:as_json) unless @attachments.nil? || @attachments.empty?
      hash
    end
  end
end
