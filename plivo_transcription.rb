require 'rubygems'
require 'plivo'
require 'sinatra'

include Plivo

get '/transcription/xml' do
  response = Response.new()
  recording_parameters = {'action'=> 'http=>//some.server/action/',
    'method'=> 'GET',
    'maxLength'=> '30',
    'finishOnKey'=> '*',
    'transcriptionType'=> 'auto',
    'transcriptionUrl'=> 'http://some.server/transcription/receive',
    'transcriptionMethod'=> 'GET',
  }
  response.addRecord(recording_parameters)

  content_type :xml 
  "text/xml"
  response.to_xml()
end
