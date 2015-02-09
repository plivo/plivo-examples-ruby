# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'to' => '2222222222<3333333333', # The phone numer to which the call has to be placed separated by "<" delimiter
    'from' => '1111111111', # The phone number to be used as the caller id
    'answer_url' => 'https://enigmatic-cove-3140.herokuapp.com/speak', # The URL invoked by Plivo when the outbound call is answered
    'answer_method' => 'GET', # The method used to call the answer_url
}

response = p.make_call(params)
print response

=begin
Sample Output
[201, 
    {
        "api_id"=>"1c5f9406-b030-11e4-a2d1-22000ac5040c", 
        "message"=>"calls fired", 
        "request_uuid"=>[
            "70020dfb-4b5c-42cf-b5c4-c242cf0da2c8", 
            "2f0c6eb1-9182-40ca-be9a-77d0637093a1"
        ]
    }
]
=end