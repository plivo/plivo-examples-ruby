# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Send SMS
params = {
	'src' => '1111111111', # Sender's phone number with country code
	'dst' => '2222222222<3333333333', # Receivers' phone numbers with country code. The numbers are separated by "<" delimiter.
	'text' => 'Hi, from Plivo' # Your SMS Text Message - English
}
response = p.send_message(params)
print response

# Sample Output
# [202, {
#		"api_id"=>"30bff606-9f97-11e4-b423-22000ac8a2f8", 
#		"message"=>"message(s) queued", 
#		"message_uuid"=>[
#			"30ea0cd4-9f97-11e4-b1a4-22000ac693b1", 
#			"30e974ae-9f97-11e4-9bd8-22000afa12b9"
#		]
#	}
# ]

# Print the message uuid
print response[1]['message_uuid']

# Sample Output
#["a31c2166-9f97-11e4-a77d-22000ae383ea", "a31bfd58-9f97-11e4-9bd8-22000afa12b9"]

# Loop through the message uuids

for uuid in response[1]['message_uuid']
    print uuid
end

# Sample Output
# a31c2166-9f97-11e4-a77d-22000ae383ea
# a31bfd58-9f97-11e4-9bd8-22000afa12b9

# When an invalid number is given as dst parameter, an error will be thrown and the message will not be sent

params1 = {
    'src' => '1111111111', # Sender's phone number with country code
    'dst' => '2222222222<333333', # Receivers' phone numbers with country code. The numbers are separated by "<" delimiter.
    'text' => "Hi, from Plivo" # Your SMS Text Message
}

response = p.send_message(params1)

# Print the entire response
print str(response)

# Sample output
# (400, {
#   u'api_id': u'6b07a5de-8f7f-11e4-b932-22000ac50fac', 
#   u'error': u'333333 is not a valid phone number'
#   }
# )