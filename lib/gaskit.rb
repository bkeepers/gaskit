require 'bundler'
Bundler.require

module Gaskit
  autoload :App, 'gaskit/app'

  def self.root
    @root ||= Pathname(File.expand_path('../..', __FILE__))
  end

  def self.repo
    @repo ||= Grit::Repo.new(root.join('testrepo'))
  end
end

require 'gaskit/task'
