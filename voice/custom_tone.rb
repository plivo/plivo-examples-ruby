require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/dial' do
	# When an outbound call is made and then connected different number using Dial element, 
	# you can play a custom caller tone using the dialMusic attribute
		begin
		response = Response.new
				params = {
			'dialMusic' => "https://www.foo.com/dial_music/"
		}
				dial = response.addDial(params)
		first_number = "1111111111"
		dial.addNumber(first_number)
				xml = PlivoXML.new(response)
		puts xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Dial XML
<Response>
    <Dial dialMusic="https://www.foo.com/dial_music/">
        <Number>1111111111</Number>
    </Dial>
</Response> 
=end

get '/dial_music' do
	begin
		response = Response.new
		speak_body = "Your call is being connected"
		response.addSpeak(speak_body)
		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample output
<Response>
    <Speak>Your call is being connected</Speak>
</Response>
=end
