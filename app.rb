require 'sinatra/base'
require 'sinatra/reloader'
require './app/routes/web'
require './app/routes/api'
require 'eventmachine'

#
# Public: Front end UI and API
#
module Placeholder
  EventMachine.run do
    class PlaceholderApplication < Sinatra::Application

      configure { set :server, 'thin' }
      use Rack::Deflater
      use Placeholder::Routes::API
      use Placeholder::Routes::Web

       get '/status' do
        "alive"
      end

      run!
    end
  end
end