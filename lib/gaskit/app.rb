module Gaskit
  class App < Sinatra::Base
    set :root, Gaskit.root

    get '/' do
      erb :dashboard
    end

    post '/tasks' do
      task = Task.new(params['task'])
      task.save
      {'task' => task}.to_json
    end
  end
end