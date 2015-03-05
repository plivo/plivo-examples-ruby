require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/play' do
    r = Response.new()
    r.addPlay("https://s3.amazonaws.com/plivocloud/Trumpet.mp3")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Play XML
<Response>
   <Play>https://s3.amazonaws.com/plivocloud/Trumpet.mp3</Play>
</Response>
=end