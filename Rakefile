# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "joyent"
  gem.homepage = "http://github.com/mongohq/joyent"
  gem.license = "MIT"
  gem.summary = %Q{Ruby interface to the joyent cloud API}
  gem.description = %Q{Ruby interface to the joyent cloud API}
  gem.email = "ben.wyrosdick@gmail.com"
  gem.authors = ["Ben Wyrosdick"]
  # files defined in Gemfile
  gem.files.include Dir.glob('lib/**/*.rb')
  # dependencies defined in Gemfile
  gem.add_dependency 'thor'
  gem.add_dependency 'json'
  # executables defined in Gemfile
  gem.executables = ['joyent']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
