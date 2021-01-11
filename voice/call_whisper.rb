require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/call_whisper' do
	begin
		response = Response.new
		params = {
			'confirmSound' => "https://www.foo.com/confirm_sound/",
			'confirmKey' => "5"
		}
				dial = response.addDial(params)
		first_number = "1111111111"
		dial.addNumber(first_number)
				second_number = "2222222222"
		dial.addNumber(second_number)
				third_number = "3333333333"
		dial.addNumber(third_number)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

get '/confirm_sound' do
	begin
		response = Response.new
		speak_body = "Enter the digit 5 to connect the call"
		response.addSpeak(speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Output
<Response>
    <Dial confirmKey="5" confirmSound="https://www.foo.com/confirm_sound/">
        <Number>1111111111</Number>
        <Number>2222222222</Number>
        <Number>3333333333</Number>
    </Dial>
</Response>

<Response>
    <Speak>Press 5 to answer the call</Speak>
</Response>
=end