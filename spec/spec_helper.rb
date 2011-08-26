require 'bundler'
Bundler.require 'test'
require 'gaskit'

Rspec.configure do |config|
  config.before do
    Gaskit.repo.git.fs_delete("refs/heads/gaskit")
  end
end
