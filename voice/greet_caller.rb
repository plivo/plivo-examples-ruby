require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/greet_caller/' do
	content_type 'text/xml'

	people = {
		'1111111111' => 'ACDEF',
		'2222222222' => 'WVXYZ',
		'3333333333' => 'QWERTY'
	}

	from_number = params[:From] 
	response = Response.new

	if people.include? from_number
		body = "Hello " + people[from_number]
	else
		body = 'Hello Stranger!' 
	end

	response.addSpeak(body)
	xml = PlivoXML.new(response)
	return xml.to_xml
end

=begin
Sample Output
<Response>
    <Speak>Hello,ABCDEF</Speak>
</Response>
=end
