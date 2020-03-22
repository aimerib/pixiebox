module Pixiebox
  module Commands
    class InitializeProject < Pixiebox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PixieboxNotInstalled unless os.pixiebox_installed?

        publish_event :project_initialize_start

        # create project config_dir
        TTY::File.create_dir project_config_dir

        # create project ini
        TTY::File.create_file "#{project_config_dir}/#{Pixiebox::PROJECT_INI}" do |content|
          "[project]\nenabled=true\n"
        end

        publish_event :project_initialize_complete
      end


      def visit_linux subject
        visit_darwin subject
      end


      private
      def project_config_dir
        "#{os.current_dir}/#{Pixiebox::CONFIG_DIR}"
      end
    end
  end
end