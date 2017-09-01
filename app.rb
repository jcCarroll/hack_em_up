require 'sinatra'

get '/' do
    erb :index
end

post '/add_book' do
    fname = params[:fname]
    lname = params[:lname]
    street = params[:street]
    city = params[:city]
    state = params[:state]
    zipcode = params[:zipcode]
end