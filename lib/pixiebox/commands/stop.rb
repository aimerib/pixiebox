module Pixiebox
  module Commands
    class Stop < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :stopping

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        system("docker-compose down #{Pixiebox.output}") or raise Errors::DockerError

        publish_event :stopped
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end