require 'spec_helper'

describe SlackMessenger do
  it 'has a version number' do
    expect(SlackMessenger::VERSION).not_to be nil
  end

  it 'has a default API endpoint' do
    SlackMessenger.configure{|sm|}
    expect(SlackMessenger.default_api).not_to be nil
  end
end

describe SlackMessenger::Api do
  it 'has an endpoint' do
    api = SlackMessenger::Api.new ENV['SLACK_API_ENDPOINT']
    expect(api.endpoint).not_to be nil
  end

  it 'can send a message via default' do
    SlackMessenger.configure{|sm|}
    message = SlackMessenger::Message.new text: 'Test Message'

    expect(SlackMessenger::Api.send(message)).to be true
  end

  it 'can send a message via override' do
    api = SlackMessenger::Api.new ENV['SLACK_API_ENDPOINT']
    message = SlackMessenger::Message.new text: 'Test Message'

    expect(SlackMessenger::Api.send(message, api)).to be true
  end
end

describe SlackMessenger::Message do
  it 'can be sent via default_api' do
    message = SlackMessenger::Message.new text: 'Test Message'
    expect(message.send!).to be true
  end

  it 'can be sent via override' do
    api = SlackMessenger::Api.new ENV['SLACK_API_ENDPOINT']
    message = SlackMessenger::Message.new text: 'Test Message'
    expect(message.send!(api)).to be true
  end

  it 'is sent as json' do
    message = SlackMessenger::Message.new text: 'Test Message'

    expect(message.as_json).to eq({text: 'Test Message'})
  end
end
