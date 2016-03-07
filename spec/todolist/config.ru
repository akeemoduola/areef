require "./config/application.rb"
RACK_ROOT = __dir__

use Rack::Reloader, 0
use Rack::MethodOverride

TodoApplication = Todolist::Application.new
require "./config/routes.rb"

run TodoApplication
