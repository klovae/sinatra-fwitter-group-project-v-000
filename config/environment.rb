ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

end

configure :production do

 ActiveRecord::Base.establish_connection(
   :adapter  => "postgres",
   :database => "db/production.db"
 )
end

require 'rack-flash'
require_all 'app'
