# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'spinach-slack-reportable'
  spec.version       = '0.0.1'
  spec.authors       = ['Jonah Hirsch']
  spec.email         = ['jonahwh@gmail.com']
  spec.summary       = 'Reporter and module for Spinach that sends message to Slack'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'spinach', '~> 0.8'
  spec.add_development_dependency 'rubocop', '~> 0.33'
  spec.add_development_dependency 'overcommit', '~> 0.27'
  spec.add_development_dependency 'slack-notifier', '~> 1.2'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'pry'
end
