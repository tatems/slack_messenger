module SlackMessenger
  class AttachmentField
    def initialize(options = {})
      @title = options[:title]
      @value = options[:value] || "Attachment Text"
      @short = options[:short]
    end

    def as_json
      hash = {value: @value}
      hash[:title] = @title unless @title.nil?
      hash[:short] = @title unless @short.nil?
      hash
    end
  end
end
