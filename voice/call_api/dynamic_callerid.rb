require 'rubygems'
require 'plivo'
require 'sinatra'

include Plivo::XML
include Plivo::Exceptions

# Set te caller ID using Dial XML

get '/dial' do
	begin
		response = Response.new
				params = {
			'callerId' => '14151234567'
		}
				dial = response.addDial(params)
		first_number = '14151112222'
		dial.addNumber(first_number)
				xml = PlivoXML.new(response)
		puts xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Output
<Response>
    <Dial callerId="14151234567">
        <Number>14151112222</Number>
    </Dial>
</Response>
    
=end

# Set the caller ID using Call API
api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
	response = api.calls.create(
		'+14151234567', # The phone number to be used as the caller id
		['+14151112222'], # The phone number to which the call has to be placed.
		'http://s3.amazonaws.com/static.plivo.com/answer.xml' # The URL invoked by Plivo when the outbound call is answered
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
    "api_id"=>"b7248e74-5338-11eb-b110-0242ac110008", 
    "message"=>"calls fired", 
    "request_uuid"=>["8180f5f2-848e-4055-916a-e30b2eba009e"]
}
=end