require 'rubygems'
require 'plivo'

include Plivo

AUTH_ID = "<your auth_id>"
AUTH_TOKEN = "<your auth_token>"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

call_uuid = # get the live call's uuid
response = p.record({'call_uuid' => call_uuid, 'transcription_url' => 'http://some.server/url/', 'transcription_method' => 'GET', 'transcription_type': 'auto'})

