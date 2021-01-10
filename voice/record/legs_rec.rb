require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

# A call is made to the plivo number. 
# The answer_url returns and XML that starts recording the session and then dials to another number.
# When the user pick up, the B Leg record starts and a music is played.

# The action URL of the Record tag will return the Session recording details

get '/answer_incoming' do
	r = Response.new()
	params = {
		'action' => "https://www.foo.com/record_action", # Submit the result of the record to this URL.
		'method' => 'GET', # Submit to action url using GET or POST
		'redirect' => 'false', # If false, don't redirect to action url, only request the url and continue to next element.
		'recordSession' => 'true' # Record current call session in background 
	}
	r.addRecord(params)

	r.addSpeak('Connecting your call')
	params = {
		'callbackUrl' => "https://www.foo.com/dial_outbound",
		'callbackMethod' => "GET"
	}
	dial = response.addDial(params)
	number = '1111111111'
	dial.addNumber(number)

	puts r.to_xml()
	content_type 'text/xml'
	return r.to_s()    
end

# The Callback URL of Dial will make a request to the Record API which will record only the B Leg
# Play API is invoked which will play a music only on the B Leg.

get '/dial_outbound' do
	event = params[:Event]
	call_uuid = params[:DialBLegUUID]

	print ("Event : #{event}, Conference Name : #{conf_name}")

	if(event=="DialAnswer")
		api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

		begin
			response = api.calls.record(
				call_uuid, # ID of the call 
				callbackUrl:'https://www.foo.com/record_callback', # The URL invoked by the API when the recording ends.
				callbackMethod:'GET' # The method which is used to invoke the callback_url URL. Defaults to POST.
			)
			puts response
		rescue PlivoRESTError => e
			puts 'Exception: ' + e.message
		end
		begin
			response = api.calls.play(
				call_uuid,# ID of the call
				['https://s3.amazonaws.com/plivocloud/Trumpet.mp3'], # A single URL or a list of comma separated URLs pointing to an mp3 or wav file. 
			)
			puts response
		rescue PlivoRESTError => e
			puts 'Exception: ' + e.message
		end
	else
		print "Wrong Input"
	end
end

# The Callback URL of record api will return the B Leg record details.

get '/record_callback' do
	url = params[:RecordUrl]
	duration = params[:RecordingDuration]
	id = params[:RecordingID]

	print "Record URL : #{url}, Recording Duration : #{duration}, Recording ID : #{id}"
end

=begin
<Response>
    <Record action="https://www.foo.com/record_action" method="GET" recordSession="true" redirect="false"/>
    <Speak>Connecting your call</Speak>
    <Dial callbackMethod="GET" callbackUrl="https://www.foo.com/dial_outbound">
        <Number>1111111111</Number>
    </Dial>
</Response>

Reord API
{
    "api_id"=>"e3403906-9585-11e4-b153-22000abcaa64", 
    "message"=>"async api spawned", 
}


Play API
{
    "api_id"=>"e3791dca-9585-11e4-96e3-22000abcb9af", 
    "message"=>"play started"
}

Output of Record API Callback URL
Record URL : http://s3.amazonaws.com/recordings_2013/11112222-4444-11e4-a4c8-782bcb5bb8af.mp3, Recording Duration : 22, Recording ID : 693e61fd-8150-4091-a0f8-561d4a434288 

Output of Record XML Action URL
Record URL : http://s3.amazonaws.com/recordings_2013/55556666-7777-11e4-a4c8-782bcb5bb8af.mp3, Recording Duration : 27, Recording ID : daddbf04-9585-11e4-a4c8-782bcb5bb8af 

=end