require 'sinatra'
require 'bundler'

set :public_folder, File.dirname(__FILE__) + '/public'
  
get '/' do
  haml :index
end

get '/style.css' do
  scss :style
end

get '/app.js' do
  coffee :js
end