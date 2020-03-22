module Pixiebox
  module Errors
    class PixieboxError < StandardError; end
    class UnknownError < PixieboxError; end
    class BoxNotImplemented < PixieboxError; end
    class ServiceNotImplemented < PixieboxError; end
    class ServiceNotInstalled < PixieboxError; end
    class ShellNotSupported < PixieboxError; end
    class ProjectNotInitialized < PixieboxError; end
    class SystemDownError < PixieboxError; end
    class UnsupportedOsError < PixieboxError; end
    class FileNotFoundError < PixieboxError; end
    class PixieboxNotInstalled < PixieboxError; end
    class DistroNotSupported < PixieboxError; end
    class DockerError < PixieboxError; end
  end
end