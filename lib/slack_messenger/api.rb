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
      api = SlackMessenger.default_api if api.nil?

      raise "default_api not set" if api.nil?
      raise "No slack endpoint set" if api.endpoint.nil?

      result = HTTParty.post(api.endpoint, body: message.as_json.to_json)
      if result.code == 200
        true
      else
        false
      end
    end
  end
end
