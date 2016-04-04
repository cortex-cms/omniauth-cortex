# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-cortex/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-cortex'
  spec.version       = OmniAuth::Cortex::VERSION
  spec.authors       = ['CB Content Enablement']
  spec.email         = 'ContentEnablementProductTeam@careerbuilder.com'
  spec.summary       = "OmniAuth strategy for Cortex's OAuth 2.0 implementation"
  spec.homepage      = 'https://github.com/cortex-cms/omniauth-cortex'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 11.1'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'simplecov', '~> 0.11'
  spec.add_development_dependency 'webmock', '~> 1.24'

  spec.add_dependency 'omniauth', '~> 1.3'
  spec.add_dependency 'omniauth-oauth2', '~> 1.4'
end
