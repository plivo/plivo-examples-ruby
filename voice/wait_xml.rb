require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

# Example for Basic Wait
get '/basic_wait' do
	content_type 'text/xml'
	begin
		response = Response.new
				first_speak_body = 'I will wait 10 seconds starting now!'
		response.addSpeak(first_speak_body)
				params = {
			length: '10' # Time to wait in seconds
		}
		response.addWait(params)
				second_speak_body = 'I just waited 10 seconds.'
		response.addSpeak(second_speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end


=begin
<Response>
    <Speak>I will wait for 10 seconds</Speak>
    <Wait length="10" />
    <Speak>I just waited 10 seconds</Speak>
</Response>
=end

# Example for Delayed Call Answer
get '/delayed_wait' do
	content_type 'text/xml'
	begin
		response = Response.new

		params = {
			length: '10' # Time to wait in seconds
		}
		response.addWait(params)
				second_speak_body = 'Hello'
		response.addSpeak(second_speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
<Response>
    <Wait length="10" />
    <Speak>Hello</Speak>
</Response>
=end

# Example for Beep Detection
get '/beep_detect' do
	content_type 'text/xml'
	begin
		response = Response.new

		params = {
			length: '10', # Time to wait in seconds
			beep: "true"
		}
		response.addWait(params)
				second_speak_body = 'Hello'
		response.addSpeak(second_speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
<Response>
    <Wait length="10" beep="true" />
    <Speak>Hello</Speak>
</Response>
=end



