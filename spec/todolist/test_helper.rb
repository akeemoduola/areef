RACK_ROOT = __dir__
$:.unshift File.dirname(__FILE__)
require "config/application.rb"
TodoApplication = Todolist::Application.new
require "config/routes.rb"

APP = Rack::Builder.new do
  use Rack::MethodOverride
  run TodoApplication
end
