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
    # Example for Asynchrnous request
    #'callback_url' => "https://enigmatic-cove-3140.herokuapp.com/callback", # The URL notified by the API response is available and to which the response is sent.
    #'callback_method' => "GET" # The method used to notify the callback_url.
}

response = p.make_call(params)
print response

=begin
Sample Output
[201, 
    {
        "api_id"=>"af863204-b02f-11e4-96e3-22000abcb9af", 
        "message"=>"call fired", 
        "request_uuid"=>"09c12b5d-d8df-4488-a5fa-4cf604ff526d"
    }
]

Async
[200, 
    {
        "api_id"=>"af1d4aae-b02b-11e4-b932-22000ac50fac", 
        "message"=>"async api spawned"
    }
]
=end