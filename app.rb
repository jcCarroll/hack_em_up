require 'sinatra'
require 'pg'

load "./local_env.rb" if File.exists?("./local_env.rb")

db_params = {
    host: ENV['dbhost'],
    port: ENV['dbport'],
    dbname: ENV['dbname'],
    user: ENV['dbuser'],
    password: ENV['dbpassword']
	}

db = PG::Connection.new(db_params)

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

    db.exec ("INSERT INTO data (fname, lname, street, city, state, zipcode) VALUES ('#{fname}', '#{lname}', '#{address}','#{city}', '#{state}', '#{zipcode}')" )
    db.close

    erb :index
end