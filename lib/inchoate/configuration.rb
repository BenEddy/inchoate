module Inchoate
  class Configuration
    def initialize(path = Rails.root.join("config/inchoate.yml"))
      @path = path
      load
    end

    def find(*nesting)
      return unless @configuration

      nesting.inject(@configuration) { |config, key| config.try(:[], key) }
    end

    private

    def load
      @configuration = File.file?(@path) && parse_configuration
    end

    def parse_configuration
      HashWithIndifferentAccess.new(YAML.load_file(@path))
    end
  end
end