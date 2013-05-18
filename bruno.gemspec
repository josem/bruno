# encoding:utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'bruno/version'

spec = Gem::Specification.new do |s|
  s.name        = 'bruno'
  s.version     = Bruno::VERSION
  s.author      = 'José M. Gilgado'
  s.email       = 'jm.gilgado@gmail.com'
  s.homepage    = 'http://github.com/josem/bruno'
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Convert your i18n files between Android and iOS"
  s.description = 'Bruno is a small tool to convert your Localizable.strings (iOS) files into strings.xml (Android) and viceversa.'
  s.files = %w(
    bin/bruno
    lib/bruno/version.rb
    lib/bruno/strings_file.rb
    lib/bruno/main.rb
    lib/bruno.rb
  )
  s.require_paths << 'lib'
  #s.has_rdoc = true
  #s.extra_rdoc_files = ['README.rdoc','bruno.rdoc']
  #s.rdoc_options << '--title' << 'bruno' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'bruno'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('gli','2.5.4')
  s.add_runtime_dependency('nokogiri','1.5.9')
end
