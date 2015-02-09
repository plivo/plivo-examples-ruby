# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

# Set te caller ID using Dial XML

get '/speak_api' do

    r = Response.new()
    getdigits_action_url = "https://enigmatic-cove-3140.herokuapp.com/speak_action"
    params = {
        'action' => getdigits_action_url,
        'method' => 'GET',
        'timeout' => '7',
        'numDigits' => '1',
        'retries' => '1',
        'redirect' => 'false'
    }
    getDigits = r.GetDigits(params)
    getDigits.addSpeak("Press 1 to listen to a message")
    wait_params = {
        'length' => "10"
    } 
    r.addWait(wait_params)
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

get '/speak_action' do
    
    digit = params[:Digits]
    call_uuid = params[:CallUUID]

    AUTH_ID = "Your AUTH_ID"
    AUTH_TOKEN = "Your AUTH_TOKEN"
    
    print "Digit pressed : #{digit}"
    print "Call UUID : #{call_uuid}"

    p = RestAPI.new(AUTH_ID, AUTH_TOKEN)
    
    if (digit == "1")
        params = {
            'call_uuid'=> call_uuid, # ID of the call
            'text' => "Hello from Speak API", # Text to be played.
            'voice' => "WOMAN", # The voice to be used, can be MAN,WOMAN. Defaults to WOMAN.
            'language' => "en-GB" # The language to be used
        }
        response = p.speak(params)
    else
        print "Wrong Input"
    end
end

=begin
<Response>
    <GetDigits action="https://enigmatic-cove-3140.herokuapp.com/speak_action" method="GET" numDigits="1" redirect="false" retries="1" timeout="7">
        <Speak>Press 1 to listen to a message</Speak>
    </GetDigits>
    <Wait length="10"/>
</Response>   

[202, 
    {
        "api_id"=>"98e27232-b03a-11e4-b153-22000abcaa64", 
        "message"=>"speak started"
    }
]

    
=end