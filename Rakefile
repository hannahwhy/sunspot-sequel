require 'rake/gempackagetask'
require 'rspec/core/rake_task'

gemspec = eval(File.read('sunspot-sequel.gemspec'), binding, 'sunspot-sequel.gemspec')

Rake::GemPackageTask.new(gemspec).define
RSpec::Core::RakeTask.new
