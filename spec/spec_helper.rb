require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :development)

# Establishes database connection
require File.join(File.dirname(__FILE__), 'database')

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), "support", "**", "*.rb")].each {|f| require f}

RSpec.configure do |config|
  # some (optional) config here
end
