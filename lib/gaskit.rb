require 'bundler'
Bundler.require

module Gaskit
  autoload :App, 'gaskit/app'

  def self.root
    @root ||= Pathname(File.expand_path('../..', __FILE__))
  end

  def self.env
    @env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || 'development')
  end

  def self.repo
    @repo ||= env.test? ? Grit::Repo.init(root.join('testrepo').to_s) : Grit::Repo.new(root.to_s)
  end
end

require 'gaskit/task'
