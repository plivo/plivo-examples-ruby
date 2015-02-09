# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'record_id' => '93c513fe-b03a-11e4-990a-251344c8aa1a' # The ID of the call
}

response = p.get_cdr(params)
print response

=begin
Sample Output    
[200, 
    {
        "api_id"=>"f7a12de2-b03d-11e4-a2d1-22000ac5040c", 
        "bill_duration"=>18, 
        "billed_duration"=>60, 
        "call_direction"=>"inbound", 
        "call_duration"=>18, 
        "call_uuid"=>"93c513fe-b03a-11e4-990a-251344c8aa1a", 
        "end_time"=>"2015-02-09 14:34:14+05:30", 
        "from_number"=>"+1111111111", 
        "parent_call_uuid"=>nil, 
        "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/93c513fe-b03a-11e4-990a-251344c8aa1a/", 
        "to_number"=>"2222222222", 
        "total_amount"=>"0.00850", 
        "total_rate"=>"0.00850"
    }
]
    
=end