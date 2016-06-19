require 'httparty'
require 'json'

module SlackMessenger
  class Api
    def initialize(endpoint)
      @endpoint = endpoint
    end

    def endpoint
      @endpoint
    end

    def self.send(message, api = nil)
      if api.nil?
        api = SlackMessenger.default_api
      end

      raise ApiNotSetError.new if api.nil?
      raise EndpointNotSetError.new if api.endpoint.nil? || api.endpoint == ""

      result = HTTParty.post(api.endpoint, body: message.as_json.to_json)

      case result.code
      when 200
        true
      else
        raise SendError.new result.code
      end
    end
  end
end
