require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/receive_calls' do
	content_type 'text/xml'
	begin
		response = Response.new
				speak_body = 'Hello, Welcome to Plivo.'
		response.addSpeak(speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Speak XML
<Response>
    <Speak>Hello, Welcome to Plivo.</Speak>
</Response>
=end