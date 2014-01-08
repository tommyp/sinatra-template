require 'sinatra'
require 'bundler'
require 'sinatra/assetpack'
require 'sinatra/partial'

class Application < Sinatra::Base

  register Sinatra::AssetPack
  register Sinatra::Partial

  set :static, true
  set :root, File.dirname(__FILE__)
  set :public_folder, File.dirname(__FILE__) + '/public'

  configure do
    enable :partial_underscores
  end

  assets {
    serve '/js',     from: 'assets/js'        # Default
    serve '/css',    from: 'assets/css'       # Default
    serve '/images', from: 'assets/images'    # Default

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    js :app, '/js/app.js', [
      '/js/*',
    ]

    css :application, '/css/application.css', [
      '/css/*'
    ]

    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
    css_compression :sass   # :simple | :sass | :yui | :sqwish
  }
    
  get '/' do
    haml :index
  end

end