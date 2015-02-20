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
  @c= Client.new
  @barbers = Barber.order "created_at DESC"
  erb :visit
end

post '/visit' do
  @barbers = Barber.order "created_at DESC"
  
  @c = Client.new params[:client]
  if @c.save
    erb "<h2>Вы записались</h2>"
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
end

get '/barber/:barber_id' do
  @barber = Barber.find params[:barber_id]
  erb :barber
end