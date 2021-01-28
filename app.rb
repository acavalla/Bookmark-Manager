require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    #p ENV
    erb :index
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/add-bookmark' do
    Bookmark.create(params['bookmark'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
