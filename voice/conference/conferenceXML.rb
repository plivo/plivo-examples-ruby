require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/response/conference' do

	content_type 'text/xml'
	begin
		response = Response.new
		response.addSpeak('You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com')
		params = {
			'enterSound' => "beep:2", # Used to play a sound when a member enters the conference
			'record' => "true", # Option to record the call
			'action' => "https://enigmatic-cove-3140.herokuapp.com/response/conf_action", # URL to which the API can send back parameters
			'method' => "GET", # method to invoke the action Url
			'record' => "true", # Option to record the call 
			'callbackUrl' => "https://enigmatic-cove-3140.herokuapp.com/response/conf_callback", # If specified, information is sent back to this URL
			'callbackMethod' => "GET" # Method used to notify callbackUrl
			# For moderated conference
			# 'startConferenceOnEnter' => "true", # When a member joins the conference with this attribute set to true, the conference is started.
			# If a member joins a conference that has not yet started, with this attribute value set to false, 
			# the member is muted and hears background music until another member joins the conference
			# 'endConferenceOnExit' => "true" # If a member with this attribute set to true leaves the conference, the conference ends and all 
			# other members are automatically removed from the conference. 
		}
		conference_name = "demo"
		response.addConference(conference_name, params)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

get '/response/conf_action' do
	conf_name = params[:ConferenceName]
	conf_uuid = params[:ConferenceUUID]
	conf_mem_id = params[:ConferenceMemberID]
	record_url = params[:RecordUrl]
	record_id = params[:RecordingID]

	puts ("Conference Name : #{conf_name}, Conference UUID : #{conf_uuid}, Member ID : #{conf_mem_id}, Record URL : #{record_url}, Record ID : #{record_id}")

end

get 'response/conf_callback' do
	conf_action = params[:ConferenceAction]
	conf_name = params[:ConferenceName]
	conf_uuid = params[:ConferenceUUID]
	conf_mem_id = params[:ConferenceMemberID]
	call_uuid = params[:CallUUID]
	record_url = params[:RecordUrl]
	record_id = params[:RecordingID]

	puts ("Conference Action : #{conf_action}, Conference Name : #{conf_name}, Conference UUID : #{conf_uuid}, Member ID : #{conf_mem_id}, Call UUID : #{call_uuid}, Record URL : #{record_url}, Record ID : #{record_id}")

end

=begin
Sample Output
<Response>
    <Speak>
        You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com
    </Speak>
<Conference action="https://enigmatic-cove-3140.herokuapp.com/response/conf_action" callbackMethod="GET" 
callbackUrl="https://enigmatic-cove-3140.herokuapp.com/response/conf_callback" enterSound="beep:2" method="GET" record="true">demo</Conference>
</Response>    

Conference Action : record, Conference Name : demo, Conference UUID : 2cb2b614-b042-11e4-8bc6-1da51d64770b, Member ID : 83858, Call UUID : 269c233c-b042-11e4-8b74-1da51d64770b , 
Record URL : http://s3.amazonaws.com/recordings_2013/2c8a5390-b042-11e4-a1f8-0026b958a9e2.mp3, Record ID : 2c8a5390-b042-11e4-a1f8-0026b958a9e   

Conference Name : demo, Conference UUID : 2cb2b614-b042-11e4-8bc6-1da51d64770b, Member ID : 83858, 
Record URL : http://s3.amazonaws.com/recordings_2013/2c8a5390-b042-11e4-a1f8-0026b958a9e2.mp3, Record ID : 2c8a5390-b042-11e4-a1f8-0026b958a9e2

=end

