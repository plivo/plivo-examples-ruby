# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Send SMS
params = {
	'src' => 'ALPHA-ID', # Sender's Alphanumeric sender ID
	'dst' => '1111111111', # Receiver's phone Number with country code
	'text' => 'Hi, from Plivo' # Your SMS Text Message - English
	}

response = p.send_message(params)
print response

# Sample Output
# [202, {
#		"api_id"=>"45305dca-9f9b-11e4-ac1f-22000ac51de6", 
#		"message"=>"message(s) queued", 
#		"message_uuid"=>["454982a0-9f9b-11e4-9bd8-22000afa12b9"]
#	}
# ]

# Prints only the status code
print response[0]

# Sample successful output
# 202

# Prints the message details
print response[1]

# Sample successful output
# {
#       "api_id"=>"45305dca-9f9b-11e4-ac1f-22000ac51de6", 
#       "message"=>"message(s) queued", 
#       "message_uuid"=>["454982a0-9f9b-11e4-9bd8-22000afa12b9"]
#   }