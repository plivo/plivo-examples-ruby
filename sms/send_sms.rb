# -*- coding: utf-8 -*-
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Send SMS
params = {
	'src' => '1111111111', # Sender's phone number with country code
	'dst' => '2222222222', # Receiver's phone Number with country code
	'text' => 'Hi, from Plivo', # Your SMS Text Message - English
#	'text' => 'こんにちは、元気ですか？' # Your SMS Text Message - Japanese
#	'text' => 'Ce est texte généré aléatoirement' # Your SMS Text Message - French
	'url' => 'https://enigmatic-cove-3140.herokuapp.com/report/', # The URL to which with the status of the message is sent
	'method' => 'POST' # The method used to call the url
}
response = p.send_message(params)
print response

# Sample Output
# [202,
#	{
#		"api_id"=>"492f5288-9f27-11e4-b153-22000abcaa64", 
#		"message"=>"message(s) queued", 
#		"message_uuid"=>["494b5c4e-9f27-11e4-b1a4-22000ac693b1"]
#	}
# ]

# Print the message message_uuid
print response[1]['message_uuid']

# Sample successful output
# ["f58113a2-9fca-11e4-b1a4-22000ac693b1"]

# Print the api_id
print response[1]['api_id']

# Sample successful output
# f566addc-9fca-11e4-ac1f-22000ac51de6