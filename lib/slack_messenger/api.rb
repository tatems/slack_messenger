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

    def self.send(message, api = SlackMessenger.default_api)
      raise "default_api not set" if api.nil?
      raise "No slack endpoint set" if api.endpoint.nil?

      HTTParty.post(api.endpoint, body: message.as_json.to_json)
    end
  end
end
