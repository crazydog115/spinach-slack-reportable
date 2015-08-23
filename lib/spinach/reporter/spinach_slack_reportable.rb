require 'slack-notifier'
require 'pry'
module Spinach
  class Reporter
    module SpinachSlackReportable
      attr_reader :notifier

      def initialize(*args)
        super
        @notifier = Slack::Notifier.new(
          ENV['SPINACH_SLACK_WEBHOOK_URL'],
          channel: ENV['SPINACH_SLACK_CHANNEL'],
          username: ENV['SPINACH_SLACK_USERNAME']
        )
      end

      def before_run(*args)
        super
        message = 'Starting Test Run'
        msg = {
          fallback: message,
          text: message,
          color: 'good'
        }
        notifier.ping '', attachments: [msg]
      end

      def after_run(*args)
        super
        message = 'Test Run Complete!'
        msg = {
          fallback: message,
          text: message,
          color: 'good'
        }
        notifier.ping '', attachments: [msg]
      end

      def on_undefined_step(*args)
        super
        step = args[0]
        msg = {
          fallback: "#{step_string(step)}\nis not defined.",
          title: 'Step Not Defined',
          text: step_string(step),
          color: 'warning',
          mrkdwn_in: ['text']
        }
        notifier.ping '', attachments: [msg]
      end

      def on_failed_step(*args)
        super
        step, error = args
        msg = {
          fallback: "#{step_string(step)}\nfailed.\n```\n#{error.message}\n\n#{error.backtrace[0]}```",
          title: 'Step Failed',
          text: "#{step_string(step)}\n```\n#{error.message}\n\n#{error.backtrace.join("\n")}\n```",
          color: 'danger',
          mrkdwn_in: ['text']
        }
        notifier.ping '', attachments: [msg]
      end

      private

      def step_string(step)
        "`#{current_feature.name} :: #{current_scenario.name} :: #{step.name}`"
      end
    end
  end
end
