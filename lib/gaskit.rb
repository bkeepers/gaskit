require 'bundler'
Bundler.require

module Gaskit
  def self.repo
    @repo ||= Grit::Repo.new(File.expand_path('../../testrepo', __FILE__))
  end

  autoload :App, 'gaskit/app'
end

require 'gaskit/task'
