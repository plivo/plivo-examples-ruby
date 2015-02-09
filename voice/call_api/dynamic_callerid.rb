# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

# Set te caller ID using Dial XML

get '/dial' do
    number = '2222222222'
    r = Response.new()
    params = {
        'callerId' => '1111111111'
    }
    d = r.addDial(params)
    d.addNumber(number)
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Dial callerId="1111111111">
        <Number>2222222222</Number>
    </Dial>
</Response>
    
=end

# Set the caller ID using Call API

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
=end