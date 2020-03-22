module Pixiebox
  module Commands
    class GetRootPermission < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject

      end


      def visit_linux subject
        system "#{os.su} 'echo 1 > /dev/null'"
      end
    end
  end
end