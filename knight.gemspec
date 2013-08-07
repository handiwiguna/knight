# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knight/version'

Gem::Specification.new do |gem|
  gem.name          = "knight"
  gem.version       = Knight::VERSION
  gem.authors       = ["Handi Wiguna"]
  gem.email         = ["handi_wiguna@yahoo.com"]
  gem.description   = ""
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('equalizer', '~>0.0.5')
  gem.add_dependency('abstract_type', '~>0.0.5')
end
