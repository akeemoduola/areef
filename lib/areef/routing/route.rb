module Areef
  module Routing
    class Route
      attr_reader :klass_name, :request, :method_name
      def initialize(request, klass_and_method)
        @klass_name, @method_name = klass_and_method
        @request = request
      end

      def klass
        klass_name.constantize
      end

      def dispatch
        controller = klass.new(request)
        controller_response = controller.send(method_name)
        controller_response_saved = controller.get_response
        controller_response_saved ? controller_response_saved : controller.render(method_name)
      end
    end
  end
end
