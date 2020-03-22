module Pixiebox
  # names for files / directories
  VERSION           = '0.1.0'
  HOMEPAGE          = 'https://github.com/aimerib/pixiebox'
  PACKAGES_INFO_URL = 'https://api.github.com/repos/aimerib/packages/releases/latest'
  CONFIG_DIR        = '.pixiebox'
  PROJECT_INI       = 'project.ini'
  PIXIEBOX_INI       = 'pixiebox.ini'
  SHELL_EXTENSIONS  = 'extensions.bash'


  module_function
  def root() File.expand_path('../../..', __FILE__) end

  def output()   @output end
  def verbose?() @verbose end

  def set_verbosity(value)
    @verbose = value
    if @verbose
      @output = '2>&1'
    else
      @output = '> /dev/null 2>&1'
    end
  end
end
