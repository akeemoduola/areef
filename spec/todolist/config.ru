require "./config/application.rb"
require "./config/routes.rb"
TodoApplication = Todolist::Application.new

run TodoApplication
