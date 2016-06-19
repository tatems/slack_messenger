# SlackMessenger
[![Gem Version](https://badge.fury.io/rb/slack_messenger.svg)](https://badge.fury.io/rb/slack_messenger)

SlackMessenger is an easy-to-use gem to build and send messages via Slack's Incoming Webhooks API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack_messenger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack_messenger

## Usage

### Basic Usage

First, setup a default API endpoint. You can create an Incoming Webhook integration on your Slack account. Use the Webhook URL provided by the integration.

```ruby
SlackMessenger.configure do |config|
  config.default_api = SlackMessenger::Api.new ENV['SLACK_ENDPOINT']
  config.attachment_color = '#eeeeee' # Color of sidebar on attachments. Set to a hex value.
end
```

Sending a message is easy once you have an endpoint:

```ruby
message = SlackMessenger::Message.new "Message Text"
message.send! # Your message is sent!
```

If you need further customization, you can add attachments and attachment fields to provide more information.

```ruby
# Attachment Field
field = SlackMessenger::AttachmentField.new title: "New Field", value: "Field Text", short: false

# Message Attachment
attachment = SlackMessenger::Attachment.new text: "Attachment text", color: '#000000', fields: field

# Create and sent message
message = SlackMessenger::Message.new text: "Message Text", attachments: attachment
message.send!
```

Attachments and fields can be passed as an array or as single objects.

### Multiple  Endpoints

At this stage, SlackMessenger only supports one default endpoint. Optionally, when sending message, you may create and pass another Api object when sending a message. This will override the default.

```ruby
message = SlackMessenger::Message.new text: "Message Text"
second_api = SlackMessenger::Api.new ENV['SECOND_ENDPOINT']

message.send! second_api # Overrides the configured default_api
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jt-platterz/slack_messenger.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
