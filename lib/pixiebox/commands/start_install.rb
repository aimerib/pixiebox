module Pixiebox
  module Commands
    class StartInstall < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :install_started
      end


      def visit_linux subject
        publish_event :install_started
      end
    end
  end
end