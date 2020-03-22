module Pixiebox
  module Commands
    class StartUninstall < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PixieboxNotInstalled unless os.pixiebox_installed?

        publish_event :uninstall_started
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end