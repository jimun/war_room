# config.ru
# run with `thin start -p 9292`
require 'rack-stream'

class Firehose
  include Rack::Stream::DSL

  def call(env)
    EM.add_periodic_timer(0.1) {
      chunk "\nChunky Monkey"
    }
    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
  end
end

use Rack::Stream
run Firehose