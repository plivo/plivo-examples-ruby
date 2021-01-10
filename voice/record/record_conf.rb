require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/conference' do
	content_type 'text/xml'
	begin
		response = Response.new
				speak_body = 'You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com'
		response.addSpeak(speak_body)
		params = {
			'enterSound' => 'beep:1', # Used to play a sound when a member enters the conference
			'callbackUrl' => 'https://www.foo.com/conf_callback', # If specified, information is sent back to this URL
			'callbackMethod' => 'GET' # Method used to notify callbackUrl
		}
				conference_name = "demo"
		response.addConference(conference_name, params)

		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

# Record API is called in the callback URL to record the conference
get '/conf_callback' do
	event = params[:Event]
	conf_name = params[:ConferenceName]

	print ("Event : #{event}, Conference Name : #{conf_name}")

	# The recording starts when the user enters the conference room 
	if(event=="ConferenceEnter")
		api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

		begin
			response = api.conferences.record(
				conf_name # Name of the conference
			)
			puts response
		rescue PlivoRESTError => e
			puts 'Exception: ' + e.message
		end
	else
		print "Wrong Input"
	end
end

=begin
<Response>
    <Speak>
        You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com
    </Speak>
    <Conference callbackMethod="GET" callbackUrl="https://www.foo.com/conf_callback" enterSound="beep=>1">demo</Conference>
</Response>

{
        "api_id"=>"37155fe-bc10-11e4-ac1f-22000ac51de6", 
        "url"=>"https://s3.amazonaws.com/recordings_2013/c37e5efc-bc12-11e4-81a4-0026b93d8e7c.mp3",
        "recording_id"=>"c37e5efc-bc10-11e4-81a4-0026b93d8e7c"
        "message"=>"conference recording started", 
}
=end