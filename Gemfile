# encoding: utf-8

source 'https://rubygems.org'

# Specify your gem's dependencies in knight.gemspec
gemspec

group :development, :test do
  gem 'rontgen'
  eval_gemfile('Gemfile.dev') if File.exists?('Gemfile.dev')
end
