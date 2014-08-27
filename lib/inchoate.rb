require "inchoate/version"

module Inchoate
  class Engine < Rails::Engine
    isolate_namespace Inchoate
  end
end

require "inchoate/renderer"
