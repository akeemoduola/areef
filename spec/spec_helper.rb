require "coveralls"
Coveralls.wear!

require 'rspec'
require 'rack/test'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'areef'
require "todolist/config/application.rb"
require_relative "todolist/test_helper.rb"
ENV['RACK_ENV'] = 'test'
