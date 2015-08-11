require 'sinatra/base'
require_relative './data_mapper_setup'
# require_relative './models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect to ('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
  	link = Link.new(url: params[:url],
                    title: params[:title])
      tag = Tag.create(name: params[:tag])
      link.tags << tag
      link.save
      redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
