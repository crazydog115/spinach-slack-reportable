require 'spinach/reporter/reporting'

module Spinach
  class Reporter
    class SpinachSlackReporter < Reporter
      include Reporting

      def initialize(*args)
        super(*args)
        @out = options[:output] || $stdout
        @error = options[:error] || $stderr
        @max_step_name_length = 0
      end

      def on_successful_step(step, _, _ = nil)
        self.scenario = [current_feature, current_scenario, step]
        successful_steps << scenario
      end

      def on_failed_step(step, failure, _, _ = nil)
        self.scenario_error = [current_feature, current_scenario, step, failure]
        failed_steps << scenario_error
      end

      def on_error_step(step, failure, _, _ = nil)
        self.scenario_error = [current_feature, current_scenario, step, failure]
        error_steps << scenario_error
      end

      def on_undefined_step(step, failure, _ = nil)
        self.scenario_error = [current_feature, current_scenario, step, failure]
        undefined_steps << scenario_error
      end

      def on_pending_step(step, failure)
        self.scenario_error = [current_feature, current_scenario, step, failure]
        pending_steps << scenario_error
      end

      def on_feature_not_found(feature)
        undefined_features << feature
      end
    end
  end
end
