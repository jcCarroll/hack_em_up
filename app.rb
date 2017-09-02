require 'sinatra'
require 'pg'

def connection
    db_params = {
      host: ENV['db'],
      port:ENV['port'],
      dbname:ENV['dbname'],
      user:ENV['dbuser'],
      password:ENV['dbpassword'],
    }
  
    db = PG::Connection.new(db_params)
end

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