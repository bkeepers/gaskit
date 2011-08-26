module Gaskit
  class App < Sinatra::Base
    get '/' do
      "Hello World"
    end

    post '/tasks' do
      task = Task.new(params['task'])
      task.save
      {'task' => task}.to_json
    end
  end
end