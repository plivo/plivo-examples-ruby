require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/dial' do
	content_type 'text/xml'
	begin
		response = Response.new
		speak_body = 'Connecting your call..'
		response.addSpeak(speak_body)
				params = {
			'action' => 'https://www.foo.com/dial_status/', # Redirect to this URL after leaving Dial.
			'method' => 'GET' # Submit to action URL using GET or POST.
		}
		dial = response.addDial(params)
		first_number = "1111111111"
		dial.addNumber(first_number)
		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

get '/dial_status' do
	status = params[:DialStatus]
	aleg = params[:DialALegUUID]
	bleg = params[:DialBLegUUID]
	puts "Status : #{status}, ALeg UUID : #{aleg}, BLeg UUID : #{bleg}"
end

=begin
# Sample Dial XML
<Response>
   <Speak>Connecting your call..</Speak>
   <Dial action="https://www.foo.com/dial_status/" method="GET">
       <Number>1111111111</Number>
   </Dial>
</Response>

Status : completed, ALeg UUID : 52bb0058-902d-11e4-9681-2d7d49a323a0, BLeg UUID : 54f84290-902d-11e4-96df-2d7d49a323a0
=end