# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inchoate/version'

Gem::Specification.new do |gem|
  gem.name          = "inchoate"
  gem.version       = Inchoate::VERSION
  gem.authors       = ["Ben Eddy"]
  gem.email         = ["bae@foraker.com"]
  gem.description   = %q{Rails Prototyping}
  gem.summary       = %q{Rails Prototyping}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faker"
end
