# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

response = p.get_messages()

# Prints the details of all messages
print response

# Sample Output
# [200, {
#	"api_id"=>"4679d898-9fc1-11e4-b423-22000ac8a2f8", 
#	"meta"=>{
#		"limit"=>20, 
#		"next"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/?limit=20&offset=20", 
#		"offset"=>0, 
#		"previous"=>nil, 
#		"total_count"=>293
#	}, "objects"=>[
#			{
#				"from_number"=>"1111111111", 
#				"message_direction"=>"outbound", 
#				"message_state"=>"delivered", 
#				"message_time"=>"2015-01-19 13:43:23+04:00", 
#				"message_type"=>"sms", 
#				"message_uuid"=>"9c16413a-9fbf-11e4-89de-22000ae885b8", 
#				"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/9c16413a-9fbf-11e4-89de-22000ae885b8/", 
#				"to_number"=>"2222222222", 
#				"total_amount"=>"0.00650", 
#				"total_rate"=>"0.00650", 
#				"units"=>1
#			}, 
#			{
#				"from_number"=>"1111111111", 
#				"message_direction"=>"outbound", 
#				"message_state"=>"delivered", 
#				"message_time"=>"2015-01-19 13:40:01+04:00", 
#				"message_type"=>"sms", 
#				"message_uuid"=>"237ad222-9fbf-11e4-a77d-22000ae383ea", 
#				"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/237ad222-9fbf-11e4-a77d-22000ae383ea/", 
#				"to_number"=>"3333333333", 
#				"total_amount"=>"0.00650", 
#				"total_rate"=>"0.00650", 
#				"units"=>1
#			}
#		]
#	}
# ]

# Filtering the records

params = {
    'limit' => '2', # The number of results per page
    'offset' => '0', # The number of value items by which the results should be offset
    'message_state' => "delivered", # The state of the message to be filtered
    'message_direction' => "inbound", # The direction of te message to be fltered
    'subaccount' => "SubAccount_AUTH_ID" # The id of the subaccount, if SMS details of the subaccount is needed.
    }

response = p.get_messages(params)

print response

# Sample Output
# [200, {
#	"api_id"=>"6ec7190a-9fc1-11e4-b932-22000ac50fac", 
#	"meta"=>{	
#		"limit"=>2, 
#		"next"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/?message_state=delivered&limit=2&offset=2&message_direction=inbound", 
#		"offset"=>0, 
#		"previous"=>nil, 
#		"total_count"=>39
#	}, "objects"=>[
#			{
#				"from_number"=>"2222222222", 
#				"message_direction"=>"inbound", 
#				"message_state"=>"delivered", 
#				"message_time"=>"2015-01-19 13:28:36+04:00", 
#				"message_type"=>"sms", 
#				"message_uuid"=>"8b9f7972-9fbd-11e4-a77d-22000ae383ea", 
#				"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/8b9f7972-9fbd-11e4-a77d-22000ae383ea/", 
#				"to_number"=>"1111111111", 
#				"total_amount"=>"0.00000", 
#				"total_rate"=>"0.00000", "units"=>1
#			}, 
#			{
#				"from_number"=>"2222222222", 
#				"message_direction"=>"inbound", 
#				"message_state"=>"delivered", 
#				"message_time"=>"2015-01-19 13:18:05+04:00", 
#				"message_type"=>"sms", 
#				"message_uuid"=>"138bc7ca-9fbc-11e4-a77d-22000ae383ea", 
#				"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Message/138bc7ca-9fbc-11e4-a77d-22000ae383ea/", 
#				"to_number"=>"1111111111", 
#				"total_amount"=>"0.00000", 
#				"total_rate"=>"0.00000", 
#				"units"=>1
#			}
#		]
#	}
# ]

# Prints only the From-Number, To-Number and Message-State

for message in response[1]['objects']
    puts "From : #{message['from_number']}, TO : #{message['to_number']}, State : #{message['message_state']}"
end

# Sample Output
# From : 1111111111, TO : 2222222222, State : delivered
# From : 1111111111, TO : 3333333333, State : delivered
# From : 1111111111, TO : 2222222222, State : delivered
# From : 1111111111, TO : 2222222222, State : delivered
# From : 2222222222, TO : 3333333333, State : delivered
# From : 1111111111, TO : 3333333333, State : delivered
# From : 3333333333, TO : 1111111111, State : delivered
