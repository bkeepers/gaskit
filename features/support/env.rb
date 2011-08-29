ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, 'test'
require 'gaskit'
require 'factories'

require 'capybara/cucumber'
Capybara.default_selector = :css
Capybara.app = Gaskit::App.new
Capybara.javascript_driver = :webkit

Before do
  Gaskit::Story.store.clear
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
