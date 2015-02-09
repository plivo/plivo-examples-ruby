# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'to' => '2222222222', # The phone numer to which the call has to be placed
    'from' => '1111111111', # The phone number to be used as the caller id
    'answer_url' => 'https://enigmatic-cove-3140.herokuapp.com/speak', # The URL invoked by Plivo when the outbound call is answered
    'answer_method' => 'GET', # The method used to call the answer_url
    'sip_headers' => "Test=Sample" # List of SIP headers in the form of 'key=value' pairs, separated by commas.
}

response = p.make_call(params)
print response

=begin
Sample Output
[201, 
    {
        "api_id"=>"01134c96-b031-11e4-b423-22000ac8a2f8", 
        "message"=>"call fired", 
        "request_uuid"=>"353438b9-1675-4d28-a6b9-99257cde450d"
    }
]

The SIP header can be seen as a query parameter in the answer_url
path="/speak?Direction=outbound&From=18583650866&ALegUUID=016d3c2e-b031-11e4-9704-c73b3246dc2a&BillRate=0.03570&To=919663489033&X-PH-Test=Sample&
CallUUID=016d3c2e-b031-11e4-9704-c73b3246dc2a&ALegRequestUUID=353438b9-1675-4d28-a6b9-99257cde450d&RequestUUID=353438b9-1675-4d28-a6b9-99257cde450d&
CallStatus=in-progress&Event=StartApp" host=enigmatic-cove-3140.herokuapp.com request_id=4b017813-032d-4748-9110-62251b70285a 
fwd="54.241.2.243" dyno=web.1 connect=1ms service=6ms status=200 bytes=273
=end