module Pixiebox
  module Commands
    class ListServices < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        services = Services::Manifest.new(os).list

        publish_event :list_services, services
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end