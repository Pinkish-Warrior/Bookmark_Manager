require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/bookmark'
require_relative './database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
    # "Hello World"
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    # p params
    # p "Form data submitted to the /bookmarks route!"
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], 
        title: params[:title])
    end
    # url = params[:bookmak_url]
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
    # "Helo from post bookmarks"
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [params[:id]])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec_params(
    #  "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3",
    #  [ params[:url], params[:title], params[:id] ]
    # )
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
