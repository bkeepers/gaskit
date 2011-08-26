$: << File.expand_path('../lib', __FILE__)

require 'rubygems'
require 'gaskit'

map '/assets' do
  run Gaskit::App.sprockets
end

map '/' do
  run Gaskit::App
end
