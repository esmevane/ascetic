require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |test_task|
  test_task.libs << 'spec'
  test_task.pattern = "spec/**/*_spec.rb"
end

task default: [:test]
