# Includes our Application for testing, this should be the same starting point as the config.ru file.
require File.join(File.dirname(__FILE__), '..', 'app')

require 'rack/test'
require 'rspec'

# Set the Sinatra environment
set :environment, :test

# Add an app method for RSpec
def app
  Sinatra::Application
end