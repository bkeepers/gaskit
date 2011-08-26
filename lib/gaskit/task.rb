module Gaskit
  class Task
    include Toy::Store
    self.include_root_in_json = false

    store :git, Gaskit.repo, :branch => 'gaskit'

    attribute :description, String

    def self.count
      contents.length
    end

    def self.all
      contents.map do |entry|
        get(entry.name)
      end
    end

  private

    def self.contents
      head = store.client.get_head('gaskit')
      head ? head.commit.tree.contents : []
    end

  end
end