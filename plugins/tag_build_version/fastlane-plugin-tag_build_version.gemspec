# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/tag_build_version/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-tag_build_version'
  spec.version       = Fastlane::TagBuildVersion::VERSION
  spec.author        = %q{Bruno Mazzo}
  spec.email         = %q{mazzo.bruno@gmail.com}

  spec.summary       = %q{Defining git tags to manage build numbers}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-tag_build_version"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'git'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.110.0'
end
