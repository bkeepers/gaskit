module Gaskit
  class User
    attr_accessor :name, :email, :initials

    def initialize(attrs = {})
      attrs.each {|key, value| self.send("#{key}=", value) }
      set_default_initials
    end

    def self.adapter
      Adapter[:git].new(Gaskit.repo, :branch => 'gaskit')
    end

    def self.all
      adapter.get('users') || []
    end

    def self.me
      new(:name => Gaskit.repo.config['user.name'], :email => Gaskit.repo.config['user.email'])
    end

    def self.ensure_i_exist
      me.save unless all.include?(me)
    end

    def save
      set_default_initials
      self.class.adapter.set('users', self.class.all.push(self).uniq.sort)
    end
    alias save! save

    def <=>(other)
      name <=> other.name
    end

    def ==(other)
      other.is_a?(self.class) && email == other.email
    end

    def eql?(other)
      self == other
    end

    def hash
      email.hash
    end

  private

    def set_default_initials
      self.initials ||= name.split(' ').map {|word| word[0, 1] }.join if name.present?
    end

  end
end