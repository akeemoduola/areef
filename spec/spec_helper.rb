require "coveralls"
Coveralls.wear!

require 'rspec'
require 'rack/test'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# require 'areef'
require "todolist/config/application.rb"

# RSpec.configure do |conf|
#   conf.include Rack::Test::Methods
# end

ENV["RACK_ENV"] = "test"
