require "plivo"
include Plivo

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")
response = api.messages.list(
	limit: 5,
	offset: 0,
)
# Prints the details of all messages
puts response

# Sample Output
# {
#     "api_id"=> "88415194-6df0-11e6-b608-06a72a185e87",
#     "meta"=> {
#     "limit"=> 2,
#     "next"=> "/v1/Account/{auth_id}/Message/?limit=20&error_code=200&offset=20",
#     "offset"=> 0,
#     "previous"=> null,
#     "total_count"=> 22
#     },
#     "objects"=> [
#     {
#       "error_code"=> "200",
#       "from_number"=> "18552828641",
#       "message_direction"=> "outbound",
#       "message_state"=> "failed",
#       "message_time"=> "2016-08-17 21:26:44+05:30",
#       "message_type"=> "sms",
#       "message_uuid"=> "85ce8068-6fab-4f0a-9dc7-d6c852cdde91",
#       "resource_uri"=> "/v1/Account/{auth_id}/Message/85ce8068-6fab-4f0a-9dc7-d6c852cdde91/",
#       "to_number"=> "19352326448",
#       "total_amount"=> "0.00000",
#       "total_rate"=> "0.00350",
#       "units"=> 1
#     },
#     {
#       "error_code"=> "200",
#       "from_number"=> "18552828641",
#       "message_direction"=> "outbound",
#       "message_state"=> "failed",
#       "message_time"=> "2016-08-17 21:22:36+05:30",
#       "message_type"=> "sms",
#       "message_uuid"=> "2a340179-e8a9-4b1d-ae2c-9f346e7b6d7d",
#       "resource_uri"=> "/v1/Account/{auth_id}/Message/2a340179-e8a9-4b1d-ae2c-9f346e7b6d7d/",
#       "to_number"=> "19352326448",
#       "total_amount"=> "0.00000",
#       "total_rate"=> "0.00350",
#       "units"=> 1
#     }
#     ]
# }

# Filtering the records
response = api.messages.list(
	limit: 5, # The number of results per page
	offset: 0, # The number of value items by which the results should be offset
	subaccount: "subaccount_auth_id", # The id of the subaccount, if SMS details of the subaccount is needed.
	message_direction:'inbound', # The direction of te message to be fltered
	message_state:'delivered' # The state of the message to be filtered
)
puts response

# Sample Output
# {
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
#}

# Prints only the From-Number, To-Number and Message-State

for message in response.objects
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