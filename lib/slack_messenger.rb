require "slack_messenger/error"
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
    configuration.default_api rescue nil
  end

  def self.attachment_color
    configuration.attachment_color
  end

  class Configuration
    attr_accessor :default_api
    attr_accessor :attachment_color

    def initialize
      self.default_api = SlackMessenger::Api.new ENV['SLACK_API_ENDPOINT']
      self.attachment_color = '#000000'
    end
  end
end
