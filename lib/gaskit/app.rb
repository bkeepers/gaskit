module Gaskit
  class App < Sinatra::Base
    set :root, Gaskit.root
    set :sprockets, Sprockets::Environment.new(root) { |env|
      env.static_root = root.join('public', 'assets')
    }

    configure do
      sprockets.append_path(root.join('app', 'assets', 'stylesheets'))
      sprockets.append_path(root.join('app', 'assets', 'javascripts'))
      sprockets.append_path(root.join('app', 'assets', 'images'))
    end

    helpers do
      def asset_path(source)
        settings.sprockets.path(source, true, "assets")
      end
    end

    before do
      if request.media_type == 'application/json'
        request.body.rewind
        body = request.body.read
        params.merge!(ActiveSupport::JSON.decode(body)) unless body.blank?
      end
    end

    get '/' do
      erb :dashboard
    end

    get '/tasks' do
      json Task.all
    end

    post '/tasks' do
      task = Task.new(params)
      task.save
      json task
    end

    put '/tasks/:id' do
      task = Task.get!(params['id'])
      task.attributes = params
      task.save!
      json task
    end

    delete '/tasks/:id' do
      task = Task.get!(params['id'])
      task.destroy
      :ok
    end

  private

    def json(data)
      content_type :js
      data.to_json
    end

  end
end