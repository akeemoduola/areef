require "./config/application.rb"
RACK_ROOT = __dir__
TodoApplication = Todolist::Application.new
require "./config/routes.rb"

run TodoApplication
