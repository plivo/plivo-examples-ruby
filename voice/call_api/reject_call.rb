require 'rubygems'
require 'plivo'
require 'rubygems'
require 'sinatra'

include Plivo::XML
include Plivo::Exceptions

get '/hangup' do
	content_type 'text/xml'
	begin
		response = Response.new
				params = {
			schedule: '60',
			reason: 'rejected'
		}
		response.addHangup(params)
				speak_params = {
			loop: '0'
		}
		speak_body = 'This call will be hung up after a minute'
		response.addSpeak(speak_body, speak_params)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Output
<Response>
    <Hangup schedule="60" reason="rejected" />
    <Speak loop="0">This call will be hung up after a minute</Speak>
</Response>  
=end