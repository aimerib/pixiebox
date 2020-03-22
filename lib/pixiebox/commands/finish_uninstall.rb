module Pixiebox
  module Commands
    class FinishUninstall < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :uninstall_complete
      end


      def visit_linux subject
      	publish_event :uninstall_complete
      end
    end
  end
end