require 'plivo'
include Plivo

AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Send SMS
params = {'src' => '1212XXXXXXX', 
           'dst' => '1212XXXXXXX', 
           'text' => 'Hi, message from Plivo',
           'type' => 'sms',
        }
response = p.send_message(params)

