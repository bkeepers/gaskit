source :rubygems

gem 'sinatra'
gem 'rake'
gem 'toystore'
gem 'adapter-git', :git => 'git://github.com/bkeepers/adapter-git.git'
gem 'sprockets', '~> 2.0.0.beta.15'
gem 'sass'

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
  gem 'factory_girl'
end

group :development, :test do
  gem 'ruby-debug',   :platform => :mri_18
  gem 'ruby-debug19', :platform => :mri_19, :require => 'ruby-debug'
end