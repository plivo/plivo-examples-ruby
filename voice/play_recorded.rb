require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/play_recorded' do
	content_type 'text/xml'
	begin
		response = Response.new
				play_body = 'https://s3.amazonaws.com/plivocloud/Trumpet.mp3'
		response.addPlay(play_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end


=begin
Sample Play XML
<Response>
   <Play>https://s3.amazonaws.com/plivocloud/Trumpet.mp3</Play>
</Response>
=end