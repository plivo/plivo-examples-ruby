# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# API ID is returned for every API request. 
# Request UUID is request id of the call. This ID is returned as soon as the call is fired irrespective of whether the call is answered or not

params = {
    'to' => '9199663489033', # The phone numer to which the all has to be placed
    'from' => '2222222222', # The phone number to be used as the caller id
    'answer_url' => "https://enigmatic-cove-3140.herokuapp.com/speak", # The URL invoked by Plivo when the outbound call is answered
    'answer_method' => "GET" # Method used to invoke the answer_url
}

# Make an outbound call
response = p.make_call(params)

print "API ID : #{(response[1]['api_id'])}"
print "Request ID : #{(response[1]['request_uuid'])}"

# Sample successful output
# API ID : a14d2070-9505-11e4-b932-22000ac50fac
# Request ID : 85b1d45d-bc12-47f5-89c7-ae4a2c5d5713

# Call UUID is the id of a live call. This ID is returned only after the call is answered.

params = {
    'status' => "live" # The status of the call
}

# Get the details of all live calls
response = p.get_live_calls(params)
for uuid in response[1]['calls']
    print "Call UUID : #{uuid} "
end

# Sample successful output
# Call UUID : a60f44dc-926f-11e4-82f5-b559cbfe39b9