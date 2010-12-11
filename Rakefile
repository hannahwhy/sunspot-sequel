require 'ci/reporter/rake/rspec'
require 'cucumber/rake/task'
require 'rake/gempackagetask'
require 'rspec/core/rake_task'
require 'yard'

gemspec = eval(File.read('sunspot-sequel.gemspec'), binding, 'sunspot-sequel.gemspec')

Rake::GemPackageTask.new(gemspec).define
RSpec::Core::RakeTask.new

Cucumber::Rake::Task.new('cucumber:ok')
Cucumber::Rake::Task.new('cucumber:wip') do |t|
  t.profile = 'wip'
end
Cucumber::Rake::Task.new('cucumber:ci') do |t|
  t.profile = 'ci'
end

desc 'Run all features'
task 'cucumber:all' => ['cucumber:ok', 'cucumber:wip']

YARD::Rake::YardocTask.new

desc 'Run CI build'
task :ci => ['ci:setup:rspec', 'spec', 'cucumber:ci']
