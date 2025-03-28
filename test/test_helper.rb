ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
Dir[Rails.root.join("test/helpers/**/*.rb")].sort.each { |f| require f }

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    # https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#minitest-rails
    include FactoryBot::Syntax::Methods
  end
end

class ActionView::TestCase
  include ActionViewTestHelpers
end
