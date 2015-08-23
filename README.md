# Spinach::Slack::Reportable

Adds support for sending Spinach test failure to Slack

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spinach-slack-reportable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spinach-slack-reportable

## Usage

First, set the following environment variables
```
SPINACH_SLACK_WEBHOOK_URL=https://hooks.slack.com/services/your/slack/webhook
SPINACH_SLACK_CHANNEL=your-slack-channel
SPINACH_SLACK_USERNAME=user-to-post-to-slack-as
```

Use the built in `SpinachSlackReporter` with `spinach -r spinach_slack_reporter`,
or use in your own spinach reporter by adding `prepend SpinachSlackReportable`.

For example:

```
# If not using rails,
# require 'spinach/reporter/spinach_slack_reportable'

module Spinach
  class Reporter
    class MySpinachReporter < Reporter
      include Reporting
      prepend SpinachSlackReportable
      ...
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/crazydog115/spinach-slack-reportable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
