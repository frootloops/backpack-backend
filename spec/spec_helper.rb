if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails"
end

require "webmock/rspec"
Dir[Rails.root.join("spec/lib/**/*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random

  config.before :each do
    stub_const("Twilio::REST::Client", FakeSMS)
    FakeSMS.messages = []
  end
end

WebMock.disable_net_connect!(allow_localhost: true)
