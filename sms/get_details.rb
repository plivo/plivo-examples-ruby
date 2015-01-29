# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"
    

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'record_id' => '0936ec98-7c4c-11e4-9bd8-22000afa12b9' # Message UUID for which the details have to be retrieved
}

response = p.get_message(params)

# Prints the number of SMS units
print "Your SMS was split into %s units" % response[1]['units']

# Sample successful output
# Your SMS was split into 4 units

# Prints the status of the message
print response[1]['message_state']

# Sample successful output
# delivered

# Prints the details of all messages
print response

# Sample Output
# [200, {
#        "api_id"=>"e27b395c-a0a8-11e4-b423-22000ac8a2f8", 
#        "from_number"=>"1111111111", 
#        "message_direction"=>"outbound", 
#        "message_state"=>"delivered", 
#        "message_time"=>"2014-12-05 10:57:54+04:00", 
#        "message_type"=>"sms", 
#        "message_uuid"=>"0936ec98-7c4c-11e4-9bd8-22000afa12b9", 
#        "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/0936ec98-7c4c-11e4-9bd8-22000afa12b9/", 
#        "to_number"=>"2222222222", 
#        "total_amount"=>"0.02600", 
#        "total_rate"=>"0.00650", 
#        "units"=>4
#    }
# ]