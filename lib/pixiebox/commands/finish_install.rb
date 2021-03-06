module Pixiebox
  module Commands
    class FinishInstall < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :add_post_install_message, 'You should reload open shells to pick up shell changes'
        publish_event :install_complete
        publish_event :post_install_messages
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end