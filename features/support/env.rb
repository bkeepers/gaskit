ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, 'test'
require 'gaskit'

require 'factories'
require 'factory_girl/step_definitions'

require 'capybara/cucumber'
Capybara.default_selector = :css
Capybara.app = Rack::Builder.new do
  map('/assets')  { run Gaskit::App.sprockets }
  map('/')        { run Gaskit::App }
end
Capybara.asset_root = Gaskit.root.join('public')
Capybara.save_and_open_page_path = Gaskit.root.join('tmp/capybara')
Capybara.javascript_driver = ENV['SELENIUM'] ? :selenium : :webkit

Before do
  Gaskit::Story.store.clear
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
