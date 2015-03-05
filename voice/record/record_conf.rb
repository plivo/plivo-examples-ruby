require 'rubygems'
require 'plivo'
include Plivo

get '/conference' do
    r = Response.new()
    r.addSpeak("You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com")
    params = {
        'enterSound' => "beep=>1", # Used to play a sound when a member enters the conference
        'callbackUrl' => "https://enigmatic-cove-3140.herokuapp.com/conf_callback", # If specified, information is sent back to this URL
        'callbackMethod' => "GET" # Method used to notify callbackUrl
    }
    
    conference_name = "demo"
    r.addConference(conference_name,params)
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

# Record API is called in the callback URL to record the conference
get '/conf_callback' do
    event = params[:Event]
    conf_name = params[:ConferenceName]

    print ("Event : #{event}, Conference Name : #{conf_name}")

    # The recording starts when the user enters the conference room 
    if(event=="ConferenceEnter")
        AUTH_ID = "Your AUTH_ID"
        AUTH_TOKEN = "YOur AUTH_TOKEN"

        p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

        params = {
           'conference_name' => conf_name # Name of the conference
        }
        response = p.record_conference(params)
        print response
    else
        print "Wrong Input"
    end
end

=begin
<Response>
    <Speak>
        You will now be placed into a demo conference. This is brought to you by Plivo. To know more visit us at plivo.com
    </Speak>
    <Conference callbackMethod="GET" callbackUrl="https://enigmatic-cove-3140.herokuapp.com/conf_callback" enterSound="beep=>1">demo</Conference>
</Response>

[201, 
    {
        "api_id"=>"37155fe-bc10-11e4-ac1f-22000ac51de6", 
        "url"=>"https://s3.amazonaws.com/recordings_2013/c37e5efc-bc12-11e4-81a4-0026b93d8e7c.mp3",
        "recording_id"=>"c37e5efc-bc10-11e4-81a4-0026b93d8e7c"
        "message"=>"conference recording started", 
    }
]

=end