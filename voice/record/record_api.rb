require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# To record a call
begin
  response = api.calls.record(
    'eba53b9e-8fbd-45c1-9444-696d2172fbc8', # ID of the call
    time_limit:'40', # Max recording duration in seconds
    callback_url:'https://morning-ocean-4669.herokuapp.com/save_record_url/',  # The URL invoked by the API when the recording ends
    callbackMethod:'GET', # The method which is used to invoke the callback_url
    transcriptionType:'auto', # The type of transcription required
    transcriptionMethod:'GET'# The method used to invoke transcriptionUrl 
  )
  puts response
rescue PlivoRESTError => e
  puts 'Exception: ' + e.message
end

# Sample output
# {
#     "url": "http://s3.amazonaws.com/recordings_2013/48dfaf60-3b2a-11e3.mp3",
#     "message": "call recording started",
#     "recording_id": "48dfaf60-3b2a-11e3",
#     "api_id": "c7b69074-58be-11e1-86da-adf28403fe48"
# }

# To stop recording a call

begin
    response = api.calls.stop_record(
      'eba53b9e-8fbd-45c1-9444-696d2172fbc8' # ID of the call
    )
    puts response
  rescue PlivoRESTError => e
    puts 'Exception: ' + e.message
  end

  # Sample output
# No response

# To record a conference call

begin
    response = api.conferences.record(
      'my conf', # The conference name
      callbackUrl:'https://morning-ocean-4669.herokuapp.com/save_record_url/', # The URL invoked by the API when the recording ends  
      callback_method: => 'GET' # The method which is used to invoke the callback_url
    )
    puts response
  rescue PlivoRESTError => e
    puts 'Exception: ' + e.message
end

  # Sample Output
#   {
# 	"api_id": "2867b6e2-58c3-11e1-86da-adf28403fe48",
# 	"message": "conference recording started",
# 	"recording_id": "93bc7c6a-3b2b-11e3",
# 	"url": "http://s3.amazonaws.com/recordings_2013/93bc7c6a-3b2b-11e3.mp3",
# }

# To stop recording a conference call

begin
    response = api.conferences.stop_record(
      'my conf' # The conference name
    )
    puts response
  rescue PlivoRESTError => e
    puts 'Exception: ' + e.message
  end

#Sample output
#No content