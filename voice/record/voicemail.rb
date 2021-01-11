require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

# Generate a Record XML and ask the caller to leave a message
get '/voicemail' do
	content_type 'text/xml'
	begin
		response = Response.new
		first_speak_body = 'Leave your message after the tone.'
		response.addSpeak(first_speak_body)
		params = {
			action: 'https://www.foo.com/record_action/', # Submit the result of the record to this URL
			method: 'GET', # HTTP method to submit the action URL
			maxLength:'30', # Maximum number of seconds to record
			transcriptionType:'auto', # The type of transcription required
			transcriptionUrl:'https://www.foo.com/transcription/', # The URL where the transcription while be sent from Plivo
			transcriptionMethod:'GET' # The method used to invoke transcriptionUrl 
		}
		response.addRecord(params)
		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

# Action URL Example
get '/record_action' do
    url = params[:RecordUrl]
    duration = params[:RecordingDuration]
    id = params[:RecordingID]

    print "Record URL : #{url}, Recording Duration : #{duration}, Recording ID : #{id}"
end

# Transcription URL Example
get '/transcription' do
    transcription = params[:transcription]
    print "Transcription : #{transcription}"
end

=begin
<Response>
    <Speak>Leave your message after the tone</Speak>
    <Record action="https://enigmatic-cove-3140.herokuapp.com/record_action" maxLength="30" method="GET" transcriptionMethod="GET" transcriptionType="auto" transcriptionUrl="https://enigmatic-cove-3140.herokuapp.com/transcription"/>
</Response>


Record URL : https://s3.amazonaws.com/recordings_2013/4cc6dafe-bc0c-11e4-9dc1-842b2b096c5d.mp3, Recording Duration : 4, Recording ID : 4cc6dafe-bc0c-11e4-9dc1-842b2b096c5d

Transcription is : Hello

=end