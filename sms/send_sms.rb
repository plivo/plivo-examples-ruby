require "plivo"
include Plivo

api = RestClient.new("auth_id", "auth_token")

# Send SMS
response = api.messages.create(
	'+15671234567', # Sender's phone number with country code
	["+14151112222"], # Receiver's phone Number with country code
	"Hello, this is a sample text", # Your SMS Text Message - English
	# "こんにちは、元気ですか？" # Your SMS Text Message - Japanese
	# "Ce est texte généré aléatoirement" # Your SMS Text Message - French
	{ 	url: "http://foo.com/sms_status/", # The URL to which with the status of the message is sent
		method: 'POST' # The method used to call the url
	},
  )
  puts response

# Sample Output
# {
# 	"api_id"=>"948dc17e-529a-11eb-a4f5-0242ac110006", 
# 	"message"=>"message(s) queued", 
# 	"message_uuid"=>["948effc6-529a-11eb-a4f5-0242ac110006"], 
# }

# Print the message message_uuid
print response.message_uuid

# Sample successful output
# ["f58113a2-9fca-11e4-b1a4-22000ac693b1"]

# Print the api_id
print response.api_id

# Sample successful output
# f566addc-9fca-11e4-ac1f-22000ac51de6