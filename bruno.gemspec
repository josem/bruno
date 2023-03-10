
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bruno/version"

Gem::Specification.new do |spec|
  spec.name        = 'bruno'
  spec.version     = Bruno::VERSION
  spec.author      = 'José M. Gilgado'
  spec.email       = 'jm.gilgado@gmail.com'
  spec.homepage    = 'https://github.com/josem/bruno'
  spec.platform    = Gem::Platform::RUBY
  spec.license     = 'MIT'
  spec.summary     = "Convert your i18n files between Android and iOS"
  spec.description = 'Bruno is a small tool to convert your Localizable.strings (iOS) files into strings.xml (Android) and viceversa.'
  spec.files = Dir['bin/'] + Dir['lib/**/*'] + Dir['README.md']
  spec.require_paths = ['lib']
  spec.bindir = 'bin'
  spec.executables << 'bruno'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0.3"
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_runtime_dependency 'gli','2.5.4'
  spec.add_runtime_dependency 'nokogiri','1.14.2'

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
end
