require "plivo"
include Plivo

api = RestClient.new("auth_id", "auth_token")

# Send Bulk SMS
response = api.messages.create(
	'+15671234567', # Sender's phone number with country code
	["+14151112222<+14151113333"], # Receiver's phone Number with country code
	"Hello, this is a sample text", # Your SMS Text Message - English
	{ 	url: "http://foo.com/sms_status/", # The URL to which with the status of the message is sent
		method: 'POST' # The method used to call the url
	},
)
puts response

# Sample output
# {
#     "api_id"=>"fa4c5b6c-5329-11eb-82a1-0242ac110005", 
#     "message"=>"message(s) queued", 
#     "message_uuid"=>["fa50861a-5329-11eb-82a1-0242ac110005", "fa565aea-5329-11eb-82a1-0242ac110005"]
# }


# Print the message uuid
print response.message_uuid

# Sample Output
#["fa50861a-5329-11eb-82a1-0242ac110005", "fa565aea-5329-11eb-82a1-0242ac110005"]

# Loop through the message uuids

for uuid in response.message_uuid
print uuid
end

# Sample Output
# fa50861a-5329-11eb-82a1-0242ac110005
# fa565aea-5329-11eb-82a1-0242ac110005

# When an invalid number is given as dst parameter, an error will be thrown and the message will not be sent

response = api.messages.create(
	'+15671234567', # Sender's phone number with country code
	["+14151112222<+14151113333"], # Receiver's phone Number with country code
	"Hello, this is a sample text", # Your SMS Text Message - English
	{ 	url: "http://foo.com/sms_status/", # The URL to which with the status of the message is sent
		method: 'POST' # The method used to call the url
	},
)
puts response

# Sample output
# {
#     "api_id"=>"78d52572-532a-11eb-865a-0242ac110003", 
#     "invalid_number"=>["14151113333"], 
#     "message"=>"message(s) queued", 
#     "message_uuid"=>["78d75c02-532a-11eb-865a-0242ac110003"], 
# }