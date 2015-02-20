require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib'

set :database, "sqlite3:barbershop.db"


class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :barber, presence: true
  validates :color, presence: true
end

class Barber < ActiveRecord::Base
end


get '/' do
	@barbers = Barber.order "created_at DESC"
  erb :index
end

get '/visit' do
  @client = Client.find(3)
  @barbers = Barber.order "created_at DESC"
  erb :visit
end

post '/visit' do
  @barbers = Barber.order "created_at DESC"
  
  @client = Client.new params[:client]
  @client.save

  erb :visit
end