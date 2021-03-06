module Pixiebox
  module DockerCompose
    class Config
      def initialize(filename)
        @config = YAML.load_file(filename)
        @filename = filename
      rescue SystemCallError
        raise Pixiebox::Errors::FileNotFoundError, "could not open #{filename}"
      end


      def check!(type)
        unless config['services'].keys.include? type
          raise Pixiebox::Errors::ServiceNotInstalled
        end
      end


      def add_service(service, links)
        service_name = service.keys.first

        services = config['services'].merge! service

        links.each do |link|
          existing_service = services[link]
          if existing_service
            existing_service['links'] = (existing_service['links'] || Array.new).push service_name
            existing_service['links'].uniq!
          end
        end
      end


      def remove_service(service)
        service_name = service.keys.first
        services = config['services']

        services.delete(service_name)

        services.each_value do |service|
          if service['links']
            service['links'].delete(service_name)
            service.delete('links') if service['links'].empty?
          end
        end
      end


      def save
        File.open(filename,'w') do |h|
          h.write config.to_yaml
        end
      end

      private
      attr_accessor :config, :filename, :package
    end
  end
end