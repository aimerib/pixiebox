module Pixiebox
  class ServiceSubCommands < Thor
    desc 'build [SERVICE] optional', 'builds the pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def build(service = nil)
      Pixiebox.set_verbosity !options[:silent]

      Service.new(Os::CurrentOs.get).build service
    rescue SignalException
      exit 1
    end


    desc 'add [SERVICE]', 'adds a service to your box'
    long_desc <<-LONGDESC
    LONGDESC
    def add(*services)
      Pixiebox.set_verbosity !options[:silent]

      Service.new(Os::CurrentOs.get).add services
    rescue SignalException
      exit 1
    end


    desc 'remove [SERVICE]', 'removes a service from your box'
    long_desc <<-LONGDESC
    LONGDESC
    def remove(service)
      Pixiebox.set_verbosity !options[:silent]

      Service.new(Os::CurrentOs.get).remove service
    rescue SignalException
      exit 1
    end


    desc 'list', 'list available services'
    long_desc <<-LONGDESC
    LONGDESC
    def list()
      Service.new(Os::CurrentOs.get).list
    rescue SignalException
      exit 1
    end
  end

  class DnsSubCommands < Thor
    desc 'add', 'add entry to DNS'
    long_desc <<-LONGDESC
    LONGDESC
    method_option :port, default: '3000'
    def add(entry)
      puts "coming soon"
    end
  end

  class CLI < Thor
    include Utils::Output

    def self.exit_on_failure?
      true
    end

    class_option :silent, desc: 'Silence output', type: :boolean

    #desc 'dns SUBCOMMAND', 'do things with the DNS'
    #long_desc <<-LONGDESC
    #LONGDESC
    #subcommand 'dns', Pixiebox::DnsSubCommands


    desc 'service SUBCOMMAND', 'do things with the SERVICES'
    long_desc <<-LONGDESC
    LONGDESC
    subcommand 'service', Pixiebox::ServiceSubCommands


    desc 'version', 'displays current version'
    def version
      say "Pixiebox:  #{Pixiebox::VERSION}"
      say "Packages: #{Pixiebox::Utils::Packages.new(Os::CurrentOs.get).installed_version[1..-1]}"
    rescue SignalException
      exit 1
    end


    desc 'install', 'installs pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def install
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).install
    rescue SignalException
      exit 1
    end


    desc 'update', 'udpates pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def update
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).install
    rescue SignalException
      exit 1
    end


    desc 'uninstall', 'removes pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def uninstall
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).uninstall
    rescue SignalException
      exit 1
    end


    desc 'init [BOX]', 'initialize directory for use with pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box)
      Pixiebox.set_verbosity !options[:silent]

      os = Os::CurrentOs.get

      Project.new(os).init
      Box.new(os).install box
      Service.new(os).build
      System.new(os).start
    rescue SignalException
      exit 1
    end


    desc 'start', 'start pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def start()
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).start
    rescue SignalException
      exit 1
    end


    desc 'stop', 'stop pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def stop()
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).stop
    rescue SignalException
      exit 1
    end


    desc 'restart', 'restart pixiebox'
    long_desc <<-LONGDESC
    LONGDESC
    def restart()
      Pixiebox.set_verbosity !options[:silent]
      System.new(Os::CurrentOs.get).restart
    rescue SignalException
      exit 1
    end


    desc 'ssh [SERVICE]', 'open shell to service'
    long_desc <<-LONGDESC
    LONGDESC
    def ssh(service)
      System.new(Os::CurrentOs.get).ssh service
    rescue SignalException
      exit 1
    end


    desc 'boxes', 'list of available boxes'
    long_desc <<-LONGDESC
    LONGDESC
    def boxes()
      Box.new(Os::CurrentOs.get).list
    rescue SignalException
      exit 1
    end


    desc 'status', 'current status of containers'
    long_desc <<-LONGDESC
    LONGDESC
    def status()
      system "docker-compose ps"
    rescue SignalException
      exit 1
    end


    desc 'reset', 'reset pixiebox containers'
    long_desc <<-LONGDESC
    LONGDESC
    def reset()
      display_info('Cleaning stopped containers', :green)
      display_status('execute', 'container prune')
      system "docker container prune"
      system "docker volume prune"
    rescue SignalException
      exit 1
    end
  end
end
