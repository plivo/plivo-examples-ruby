require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# To record a call

params = {
    'call_uuid' => "xxxxxxxxxxx", # ID of the call
    'time_limit'=> '40', # Max recording duration in seconds
    'callback_url' => "https://morning-ocean-4669.herokuapp.com/save_record_url/", # The URL invoked by the API when the recording ends
    'callback_method' => "GET", # The method which is used to invoke the callback_url
    'transcriptionType' => 'auto', # The type of transcription required
    'transcriptionUrl' => "https://morning-ocean-4669.herokuapp.com/transcription/", # The URL where the transcription while be sent from Plivo
    'transcriptionMethod' => 'GET' # The method used to invoke transcriptionUrl 
}

response = p.record(params)
print response

# To stop recording a call

params = {
    'call_uuid' => "xxxxxxxxxxx", # ID of the call
}

response = p.stop_record(params)
print response

# To record a conference call

params = {
    'conference_name' => "demo", # The conference name
    'callback_url' => "https://morning-ocean-4669.herokuapp.com/save_record_url/", # The URL invoked by the API when the recording ends  
    'callback_method' => "GET" # The method which is used to invoke the callback_url
}

response = p.record_conference(params)
print response

# To stop recording a conference call

params = {
    'conference_name' => "demo" # The conference name
}

response = p.stop_record_conference(params)
print response
