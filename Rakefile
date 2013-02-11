require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'



spec = eval(File.read('bruno.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end
CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS



require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
end

task :default => [:test]
