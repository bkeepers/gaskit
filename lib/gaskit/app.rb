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