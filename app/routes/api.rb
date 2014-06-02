require 'sinatra/base'
require 'eventmachine'
require 'em-websocket'
require 'sinatra/reloader'
require 'sinatra/param'
require 'placeholder/version'
require "sinatra/json"
require "json"
require "sinatra-websocket"

#
# Public: API for the Application
#
module Placeholder
  module Routes
      class API < Sinatra::Application
        include Logging
        helpers Sinatra::Param

        configure do
          set :json_encoder, :to_json
          set :sockets, []
        end

        before do
          content_type :json

          # CORS ACLs
          headers 'Access-Control-Allow-Origin' => '*',
                  'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
        end

        # CORS pre-flight
        options '/*' do
          200
        end

        # Public: Main API entry point to run the Placeholder service
        #
        #
        get '/api/placeholder/:uri' do

        end


        get '/socket' do
          if !request.websocket?
            JSON::generate({'data' => {}, 'error' => 'Invalid WebSocket request'})
          else
            request.websocket do |ws|
              ws.onopen do
                warn("socket opened")
                settings.sockets << ws
              end
              ws.onmessage do |msg|
                EM.next_tick {
                  json_msg = JSON.parse(msg)

                  # Do not remove the 'pong' response
                  pong = checkPong(msg)
                  if (!pong.nil?)
                    return pong
                  end

                  # Play with request/responses
                  if (json_msg['message'] == 'foo')
                    response_obj = {'message' => 'bar'}
                  else
                    # Do something with json_msg
                    response_obj = {'message' => json_msg['message']}
                  end

                  # Send a response
                  settings.sockets.each{|s| s.send(JSON::generate(response_obj)) }
                }
              end
              ws.onclose do
                warn("websocket closed")
                settings.sockets.delete(ws)
              end
            end
          end
        end

        # Public: Keep-alive check.
        #
        # Defaults to look for for a 'ping' message, responds with a 'pong'
        # Override this for custom behaviour.
        #
        def checkPong(msg)
          puts "Checking ping pong for: " + msg
          if (msg['message'] == 'ping')
            response_obj = {'message' => 'pong'}
          end
        end
    end
  end
end