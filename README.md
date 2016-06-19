# SlackMessenger

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

By default, the API endpoint is set to use `ENV['SLACK_API_ENDPOINT']`, but you can customize this in your initializers.

Additionally, you may customize the default colour of your attachments here.

```ruby
# initializers/slack_messenger.rb
SlackMessenger.configure do |config|
  config.default_api = SlackMessenger::Api.new ENV['SOME_OTHER_VARIABLE']
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

#### `Api` Options
Api objects only take a single `endpoint` argument

#### `Message` Options
Messages can take 2 options
```ruby
:text        # Main body of message
:attachments # An array or single instance of Attachment objects
```

#### `Attachment` Options
Attachments can take a number of options:
```ruby
:fallback    # Required plain-text summary of the attachment
:color       # A hex value. Overrides the default attachment_color
:pretext     # Optional text that appears above the attachment block
:author_name # Optional text that appears at the head of attachment block
:author_link # A URL for the author_namee (turns author_name into a link if set)
:author_icon # A URL pointing to an image for the author_name
:title       # Bolded text that appears at head of attachment block (below author if set)
:title_link  # A URL for title (turns title into a link if set)
:text        # Text that appears in attachment
:fields      # An array or single instance of AttachmentField objects
:image_url   # URL pointing to an image. Appears at bottom of attachment block
:thumb_url   # URL pointing to an image. Appears at bottom of attachment block (smaller)
:footer      # Text that appears at bottom of attachment block
:footer_icon # URL of icon that appears in footer
:ts          # Optional timestamp (in seconds eg Time.now.to_i)
```

#### `AttachmentField` Options
AttachmentFields can take 3 options
```ruby
:title      # Bolded text at the top of field
:value      # Unformatted text that appears in body of field
:short      # Boolean value that sets width of field to 50% if true, otherwise is 100% of message width
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jt-platterz/slack_messenger.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
