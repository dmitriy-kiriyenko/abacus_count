require 'rubygems'
require 'bundler/setup'

require 'appraisal'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => ["appraisal:install"] do
  exec('rake appraisal spec')
end

RSpec::Core::RakeTask.new(:spec) do |t|
end
