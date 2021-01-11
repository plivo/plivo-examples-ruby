require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
	response = api.calls.create(
		'14151234567',  # The phone number to be used as the caller id
		['14151112222'], # The phone number to which the call has to be placed
		'http://s3.amazonaws.com/static.plivo.com/answer.xml', # The URL invoked by Plivo when the outbound call is answered
		sip_headers: 'Test=Sample', # List of SIP headers in the form of 'key=value' pairs, separated by commas.
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
    "request_uuid"=>["8180f5f2-848e-4055-916a-e30b2eba009e",]
}
=end

=begin
The SIP header can be seen as a query parameter in the answer_url
path="/speak?Direction=outbound&From=14151234567&ALegUUID=016d3c2e-b031-11e4-9704-c73b3246dc2a&BillRate=0.03570&To=919663489033&X-PH-Test=Sample&
CallUUID=8180f5f2-848e-4055-916a-e30b2eba009e&ALegRequestUUID=8180f5f2-848e-4055-916a-e30b2eba009e&RequestUUID=8180f5f2-848e-4055-916a-e30b2eba009e
CallStatus=in-progress&Event=StartApp" host=s3.amazonaws.com request_id=8180f5f2-848e-4055-916a-e30b2eba009e
fwd="54.241.2.243" dyno=web.1 connect=1ms service=6ms status=200 bytes=273
=end