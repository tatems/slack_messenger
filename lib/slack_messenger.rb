require "slack_messenger/version"
require "slack_messenger/api"
require "slack_messenger/message"
require "slack_messenger/attachment"
require "slack_messenger/attachment_field"

module SlackMessenger
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.default_api
    configuration.default_api
  end

  class Configuration
    attr_accessor :default_api

    def initialize
      @default_api = nil
    end
  end
end
