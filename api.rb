require 'grape'
require 'rack/stream'
#require 'sqlite3'
#require 'redis/connection/synchrony'

class API < Grape::API

  include ActionHelper

  default_format :txt

  helpers do
    include Rack::Stream::DSL

    def action_helper
      @ah = ActionHelper.new
    end
  end
  resources :get_actions do
    get do
      status 200
      header 'Content-Type', 'application/json'
      chunk action_helper.draw_three
      ""
    end
  end

  resources :messages do
    get do
      #after_open do
      #  # subscribe after_open b/c this runs until the connection is closed
      #  redis.subscribe 'messages' do |on|
      #    on.message do |channel, msg|
      #      chunk msg
      #    end
      #  end
      #end

      status 200
      header 'Content-Type', 'application/json'
      chunk @ah.draw_three
      ""
    end

    #post do
    #  status 201
    #  build_message(params[:text])
    #end
  end
end