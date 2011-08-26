source :rubygems

gem 'sinatra'
gem 'rake'
gem 'toystore'
gem 'adapter-git', :git => 'git://github.com/bkeepers/adapter-git.git'

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

group :development, :test do
  gem 'ruby-debug',   :platform => :mri_18
  gem 'ruby-debug19', :platform => :mri_19, :require => 'ruby-debug'
end