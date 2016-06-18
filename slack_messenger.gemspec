# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack_messenger/version'

Gem::Specification.new do |spec|
  spec.name          = "slack_messenger"
  spec.version       = SlackMessenger::VERSION
  spec.authors       = ["Josh Tate"]
  spec.email         = ["josh@joshtate.me"]

  spec.summary       = "Easy sending of Slack notifications"
  spec.homepage      = "github.com/jt-platterz/slack_messenger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "httparty", "~> 0.13"
end
