# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-cortex/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-cortex'
  spec.version       = OmniAuth::Cortex::VERSION
  spec.authors       = ['Alex Tharp']
  spec.email         = ['alex.tharp@careerbuilder.com']
  spec.summary       = %q{OmniAuth strategy for Cortex's OAuth 2.0 implementation}
  spec.homepage      = 'https://github.com/cb-talent-development/omniauth-cortex'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'
end
