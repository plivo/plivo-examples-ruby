# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'status'=> "live" # The status of the call
}

# Get all live calls
response = p.get_live_calls(params)
print response

=begin
Sample Output    
[200, 
    {
        "api_id"=>"c38b4e42-b03e-11e4-b153-22000abcaa64", 
        "calls"=>["c19c370e-b03e-11e4-97b6-f5504e456438"]
    }
]    
=end

# Looping through the call uuids

for uuid in response[1]['calls']
    print uuid
end

=begin
Sample Output    
c19c370e-b03e-11e4-97b6-f5504e456438
=end