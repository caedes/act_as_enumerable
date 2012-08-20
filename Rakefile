#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test

desc 'Build gem packages'
task :build do
  `gem build enum_plus.gemspec`
end

desc 'Push gem packages'
task :push => :build do
  `gem push enum_plus-*.gem`
end
