require 'rubygems'
require 'plivo'
include Plivo

get '/record_api' do
    r = Response.new()
    getdigits_action_url = "https://enigmatic-cove-3140.herokuapp.com/record_api_action"
    params = {
        'action' => getdigits_action_url, # The URL to which the digits are sent.
        'method' => 'GET', # Submit to action URL using GET or POST.
        'timeout' => '7', # Time in seconds to wait to receive the first digit.
        'numDigits' => '1', # Maximum number of digits to be processed in the current operation. 
        'retries' => '1', # Indicates the number of retries the user is allowed to input the digits
        'redirect' => 'false' # Redirect to action URL if true. If false,only request the URL and continue to next element.
    }
    getDigits = r.GetDigits(params)
    getDigits.addSpeak("Press 1 to record this call")

    params = {
        'length' => "10" # Time to wait in seconds
    } 
    r.addWait(params)

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

get '/record_api_action' do
    digit = params[:Digits]
    call_uuid = params[:CallUUID]

    AUTH_ID = "Your AUTH_ID"
    AUTH_TOKEN = "YOur AUTH_TOKEN"  

    p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

    if (digit == "1")
        params = {
            'call_uuid' => call_uuid # ID of the call
        }
        response = p.record(params)
        print response
    else
        print "Wrong Input"
    end
end

=begin
<Response>
    <GetDigits action="https://enigmatic-cove-3140.herokuapp.com/record_api_action" method="GET" numDigits="1" redirect="false" retries="1" timeout="7">
        <Speak>Press 1 to record this call</Speak>
    </GetDigits>
    <Wait length="10"/>
</Response>

[201, 
    {
        "api_id"=>"16847e54-9594-11e4-b423-22000ac8a2f8", 
        "url"=>"http://s3.amazonaws.com/recordings_2013/67673232-9594-11e4-baad-842b2b17453e.mp3",
        "recording_id"=>"16963644-9594-11e4-baad-842b2b17453e"
        "message"=>"call recording started", 
    }
]

=end