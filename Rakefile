# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rake/testtask'
require 'rubygems/package_task'

task default: %i[rubocop test]

RuboCop::RakeTask.new

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test*.rb']
end

spec = Gem::Specification.load(File.expand_path('geodesics.gemspec', __dir__))
Gem::PackageTask.new(spec).define
