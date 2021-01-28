require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    #p ENV
    erb :index
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/add-bookmark' do
    @new_bookmark = params[:bookmark]
    Bookmark.create(@new_bookmark)
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
