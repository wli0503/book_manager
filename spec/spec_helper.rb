ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'simplecov'
require 'rspec/rails'
require 'webmock/rspec'
require 'shoulda/matchers'
require 'vcr'

Dir["./spec/shared/**/*.rb"].sort.each { |f| require f}
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

SimpleCov.start 'rails'

VCR.configure do |vcr|
  vcr.cassette_library_dir = 'spec/vcr_cassettes'
  vcr.hook_into :webmock
  vcr.allow_http_connections_when_no_cassette = true
  vcr.configure_rspec_metadata!
end

RSpec.configure do |config|

  config.warnings = false
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false # This is required for database_cleaner
  config.infer_spec_type_from_file_location!
  # config.order = 'random'

  config.after(:all) do
    FileUtils.rm_rf(Dir["/ensemble/testing/[^.]*"])
  end
end

def days_old(n = 0)
  Time.now - n.days
end