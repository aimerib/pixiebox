require 'thor'
require 'ruby-progressbar'
require 'wisper'
require 'open-uri'
require 'uri'
require 'tty-file'
require 'tty-command'
require 'tty-platform'
require 'tty-which'
require 'tty-spinner'
require 'ostruct'
require 'yaml'
require 'inifile'
require 'pathname'
require 'json'

require 'pixiebox/utils/progress_bar'
require 'pixiebox/utils/spinner'
require 'pixiebox/utils/project'
require 'pixiebox/utils/visitable'
require 'pixiebox/utils/domain_event_publisher'
require 'pixiebox/utils/visitor_by_os'
require 'pixiebox/utils/output'
require 'pixiebox/utils/shell'
require 'pixiebox/utils/packages'

require 'pixiebox/docker_compose/config'

require 'pixiebox/errors/pixiebox_error'

require 'pixiebox/handlers/stdout_handler'

require 'pixiebox/commands/download_docker'
require 'pixiebox/commands/install_docker'
require 'pixiebox/commands/setup_shell'
require 'pixiebox/commands/remove_setup_shell'
require 'pixiebox/commands/start_install'
require 'pixiebox/commands/build_service'
require 'pixiebox/commands/start_uninstall'
require 'pixiebox/commands/finish_install'
require 'pixiebox/commands/finish_uninstall'
require 'pixiebox/commands/initialize_project'
require 'pixiebox/commands/add_box'
require 'pixiebox/commands/list_boxes'
require 'pixiebox/commands/list_services'
require 'pixiebox/commands/add_service'
require 'pixiebox/commands/remove_service'
require 'pixiebox/commands/start'
require 'pixiebox/commands/stop'
require 'pixiebox/commands/restart'
require 'pixiebox/commands/ssh_instance'
require 'pixiebox/commands/reload_shell'
require 'pixiebox/commands/get_root_permission'
require 'pixiebox/commands/update_packages'
require 'pixiebox/commands/install_config'

require 'pixiebox/boxes/manifest'
require 'pixiebox/boxes/installer'

require 'pixiebox/services/manifest'
require 'pixiebox/services/installer'

require 'pixiebox/os/abstract'
require 'pixiebox/os/darwin'
require 'pixiebox/os/linux'
require 'pixiebox/os/unsupported_os'
require 'pixiebox/os/current_os'
require 'pixiebox/os/distro'

require 'pixiebox/shell/startup_script'
require 'pixiebox/shell/zsh'
require 'pixiebox/shell/bash'
require 'pixiebox/shell/ini_file'

require 'pixiebox/constants'
require 'pixiebox/cli'
require 'pixiebox/system'
require 'pixiebox/project'
require 'pixiebox/box'
require 'pixiebox/service'

Wisper.subscribe(
  Pixiebox::Handlers::StdoutHandler.new,
  scope: Pixiebox::Utils::DomainEventPublisher
)

Pixiebox.set_verbosity(true)

