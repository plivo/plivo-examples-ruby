require "rubygems"
require "plivo"

include Plivo

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")
response = api.messages.get("0936ec98-7c4c-11e4-9bd8-22000afa12b9") # Message UUID for which the details have to be retrieved

# Prints the number of SMS units
puts "Your SMS was split into %s units" % response.units

# Sample successful output
# Your SMS was split into 4 units

# Prints the status of the message
puts response.message_state

# Sample successful output
# delivered

# Prints the details of all messages
puts response

# Sample Output
# {
#     "api_id"=> "035eeada-6df1-11e6-b608-06a72a185e87",
#     "error_code"=> "200",
#     "from_number"=> "18552828641",
#     "message_direction"=> "outbound",
#     "message_state"=> "failed",
#     "message_time"=> "2016-08-17 21:22:36+05:30",
#     "message_type"=> "sms",
#     "message_uuid"=> "2a340179-e8a9-4b1d-ae2c-9f346e7b6d7d",
#     "resource_uri"=> "/v1/Account/{auth_id}/Message/2a340179-e8a9-4b1d-ae2c-9f346e7b6d7d/",
#     "to_number"=> "19352326448",
#     "total_amount"=> "0.00000",
#     "total_rate"=> "0.00350",
#     "units"=> 1
# }
