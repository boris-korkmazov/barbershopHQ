require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib'

set :database, "sqlite3:barbershop.db"


class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end


get '/' do
	@barbers = Barber.order "created_at DESC"
  erb :index
end

get '/visit' do
  @barbers = Barber.order "created_at DESC"
  erb :visit
end

post '/visit' do
  @barbers = Barber.order "created_at DESC"
  @client = Client.create(params)
  erb :visit
end