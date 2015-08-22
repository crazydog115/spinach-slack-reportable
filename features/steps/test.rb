module Spinach
  module Features
    class Test < Spinach::FeatureSteps
      step 'true must equal true' do
        true.must_equal true
      end
    end
  end
end
