require 'vcr'

VCR.configure do |config|
  config.hook_into :faraday
  config.cassette_library_dir = 'spec/support/cassettes'
  config.configure_rspec_metadata!

  record_mode = ENV['VCR'] ? ENV['VCR'].to_sym : :once
  config.default_cassette_options = {
    record: record_mode,
    allow_playback_repeats: true
  }

  config.ignore_localhost = true
end
