# frozen_string_literal: true

RSpec.configure do |config|
  RoutingFilter.active = false

  config.before(:context, type: :routing) do
    RoutingFilter.active = true
  end

  config.after(:context, type: :routing) do
    RoutingFilter.active = false
  end
end
