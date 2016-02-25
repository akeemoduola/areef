require "areef/version"
require "areef/utility"
require "areef/dependencies"
require "areef/routing/router"
module Areef
  class Application
    def call(env)
      @req = Rack::Request.new(env)
      path = @req.path_info
      request_method = @req.request_method.downcase
      return [500, {}, []] if path == "/favicon.ico"
      controller_class, action = get_controller_and_action(path, request_method)
      response = controller_class.new.send(action)
      [200, { "Content-Type" => "text/html" }, [response]]
    end

    def get_controller_and_action(path, verb)
      _, controller_name, action = path.split("/")
      require "#{controller_name.downcase}_controller.rb"
      controller_name = Object.const_get(controller_name.
                               capitalize! + "Controller")
      action = action.nil? ? verb : "#{verb}_#{action}"
      [controller_name, action]
    end
  end
end
