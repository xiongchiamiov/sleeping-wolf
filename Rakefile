require "mg"
MG.new("sleeping-wolf.gemspec")

require 'rake/testtask'

task :default => :test

Rake::TestTask.new("test") do |t|
	t.pattern = 'test/*.rb'
end
