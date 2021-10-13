require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmak.all
    erb :'bookmarks/index'
    # "Hello World"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks/bookmarks' do
    p params
    p "Form data submitted to the /bookmarks route!"
    Bookmark.create(url: params[:url])
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
