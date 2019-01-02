require 'simplecov'
SimpleCov.start do
# SimpleCov.start 'rails' do
  add_filter('/admin')
  add_filter('/app/controllers/application_controller.rb')
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
