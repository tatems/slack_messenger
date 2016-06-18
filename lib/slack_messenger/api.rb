require 'httparty'
require 'json'

module SlackMessenger
  class Api
    def initialize(endpoint)
      @endpoint = endpoint
    end

    def send(message)
      raise "No slack endpoint set" if @endpoint.nil?
      raise "Invalid slack message" unless message.valid?

      HTTParty.post(endpoint, body: message.to_json)
    end
  end
end
