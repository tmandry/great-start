require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'

  # Dependencies
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'email_spec'
  require 'warden'

  require 'capybara/rspec'
  require 'capybara-screenshot/rspec'
  require 'capybara/poltergeist'
  require 'database_cleaner'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    # Configure Warden to allow quick logins for feature specs.
    config.include Warden::Test::Helpers
    config.after(:each) { Warden.test_reset! }

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end
    config.before(:each) do
      DatabaseCleaner.start
    end
    config.after(:each) do
      DatabaseCleaner.clean
    end
  end

  # Preload some heavier modules that we depend on to speed up testing further.
  require 'rspec/mocks'
  require 'rspec/core/mocking/with_rspec'
  require 'rspec/mocks/framework'
end

# Headless JS tests with Capybara.
# Using :selenium is slower, but you get to watch the test in an actual browser.
Capybara.javascript_driver = :poltergeist

# Use a faster password encryption in specs.
Devise.stretches = 1

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  DatabaseCleaner.clean_with :truncation
  Warden.test_mode!
end
