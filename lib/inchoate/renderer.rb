require "inchoate/configuration"

module Inchoate
  class Renderer
    def initialize(options)
      @context       = options[:context]
      @uri           = options[:uri] || URI(requested_path)
      @configuration = options[:configuration] || Configuration.new
    end

    def render
      @context.render(render_options)
    end

    private

    def render_options
      {:template => template}.tap do |options|
        options.merge!(:layout => layout) if layout
      end
    end

    def template
      directory? ? path + "index" : path
    end

    def layout
      template_layout || directory_layout || default_layout
    end

    def default_layout
      @configuration.find(:layouts, :default)
    end

    def directory_layout
      @configuration.find(:layouts, :directories, directory)
    end

    def template_layout
      @configuration.find(:layouts, :templates, template)
    end

    def path
      @uri.path
    end

    def directory?
      path[/\/$/]
    end

    def directory
      directory? ? path[0..-2] : path.split("/")[0..-2].join("/")
    end

    def request
      @context.request
    end

    def requested_path
      request.env["REQUEST_PATH"]
    end
  end
end