require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

# Generate a Record XML
get '/record' do
	content_type 'text/xml'
	begin
		response = Response.new
				first_speak_body = 'Please leave a message after the beep. Press the star key when done.'
		response.addSpeak(first_speak_body)
				params = {
			action: 'https://www.foo.com/record_action', # Submit the result of the record to this URL
			method: 'GET', # HTTP method to submit the action URL
			callbackUrl: 'https://www.foo.com/record_callback', # If set, this URL is fired in background when the recorded file is ready to be used.
			callbackMethod:'GET'  # Method used to notify the callbackUrl.
		}
		response.addRecord(params)
				second_speak_body = 'Recording not received.'
		response.addSpeak(second_speak_body)
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

# Callback URL Example
get '/record_callback' do
	url = params[:RecordUrl]
	duration = params[:RecordingDuration]
	id = params[:RecordingID]

	print "Record URL : #{url}, Recording Duration : #{duration}, Recording ID : #{id}"
end

=begin
<Response>
<Record action="https://www.foo.com/record_action" callbackMethod="GET" 
    callbackUrl="https://www.foo.com/record_callback" method="GET"/>
</Response>

Sample output for Action URL
Record URL : http://s3.amazonaws.com/recordings_2013/11111111-5555-6666-2222-999944421718.mp3, Recording Duration : 8, Recording ID : a34d252c-94b1-11e4-ab5e-842b2b021718

Sample output for Callback URL
Record URL : http://s3.amazonaws.com/recordings_2013/11111111-5555-6666-2222-999944421718.mp3, Recording Duration : 8, Recording ID : a34d252c-94b1-11e4-ab5e-842b2b021718

=end