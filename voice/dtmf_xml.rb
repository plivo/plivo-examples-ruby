require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/dtmf' do
	content_type 'text/xml'
	begin
		response = Response.new
		speak_body = 'Sending Digits'
		response.addSpeak(speak_body, params)
		dtmf = "12345"
		response.addDTMF(dtmf)
		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample DTMF XML
<Response>
    <Speak>Sending Digits</Speak>
    <DTMF>12345</DTMF>
</Response>
=end
