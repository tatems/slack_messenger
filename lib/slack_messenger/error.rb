module SlackMessenger
  class Error < StandardError
    def initialize(msg="An unknown error occurred")
      super(msg)
    end
  end

  class ApiNotSetError < Error
    def initialize
      super "Default API not set, please set it via SlackMessenger.configure or add to ENV['SLACK_API_ENDPOINT']"
    end
  end

  class EndpointNotSetError < Error
    def initialize
      super "The API's endpoint was not set"
    end
  end

  class SendError < Error
    attr_accessor :status_code
    def initialize(status_code)
      @status_code = status_code
      msg = "Error encountered when sending payload (HTTP Status: #{status_code})"

      super(msg)
    end
  end
end
