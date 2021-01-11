require "plivo"
include Plivo

api = RestClient.new("auth_id", "auth_token")

# Send SMS
response = api.messages.create(
	'ALPHA-ID', # Sender's Alphanumeric sender ID
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