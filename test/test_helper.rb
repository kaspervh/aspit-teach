ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

#Set your Capybara Javascript driver to webkit:
Capybara.javascript_driver = :webkit
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

include Warden::Test::Helpers
	Warden.test_mode!

#include Capybara::DSL

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end


#include Capybara::DSL
#Set your Capybara Javascript driver to webkit:
Capybara.javascript_driver = :webkit
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# def signin_as(user)
#  include Devise::TestHelpers
#	 login_as(user, scope:  :user)
# end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection


class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end

class ActionDispatch::IntegrationTest

  def signin_as(user)
    logout(:user)
  	login_as(user, scope:  :user)
  end
end

@users = [:employee, :admin, :organization_admin]