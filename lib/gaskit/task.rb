module Gaskit
  class Task
    include Toy::Store
    self.include_root_in_json = false

    store :git, Gaskit.repo, :branch => 'gaskit'

    attribute :description, String

    def self.count
      head = store.client.get_head('gaskit')
      head ? head.commit.tree.contents.length : 0
    end
  end
end