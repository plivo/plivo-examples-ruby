# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'to' => '2222222222<3333333333', # The phone number to which the call has to be placed separated by "<" delimiter
    'from' => '1111111111', # The phone number to be used as the caller id
    'answer_url' => 'https://enigmatic-cove-3140.herokuapp.com/response/conference', # The URL invoked by Plivo when the outbound call is answered
    'answer_method' => 'GET', # The method used to call the answer_url
}

response = p.make_call(params)
print response

=begin
[201, 
    {
        "api_id"=>"43829214-b043-11e4-ac1f-22000ac51de6", 
        "message"=>"calls fired", 
        "request_uuid"=>[
            "005b78f6-487e-4141-8a2d-6d26d83dade5", 
            "9e9f87cb-e708-4ad2-9158-495d618ca689"
        ]
    }
]    
    
=end