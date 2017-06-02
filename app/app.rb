ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
   "YO"
  end

  get '/links' do
    @links = Link.all
    # p @links
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag_name: params[:tag_name])
    # p tag
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:tag_name' do
    @links = Link.all.select do |link|
      link.tags.first.tag_name == params[:tag_name]
    end
    p @links
    erb :links
  end


  run! if app_file == $0
end
