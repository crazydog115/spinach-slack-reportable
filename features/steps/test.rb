module Spinach
  module Features
    class Test < Spinach::FeatureSteps
      step 'true must equal true' do
        (1 + 1).must_equal 3
      end
    end
  end
end
