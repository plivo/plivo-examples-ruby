require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/call_transfer' do

    r = Response.new()
    getdigits_action_url = "https://enigmatic-cove-3140.herokuapp.com/transfer_action"
    params = {
        'action' => getdigits_action_url,
        'method' => 'GET',
        'timeout' => '7',
        'numDigits' => '1',
        'retries' => '1',
        'redirect' => 'false'
    }
    getDigits = r.GetDigits(params)
    getDigits.addSpeak("Press 1 to transfer this call")

    params = {
        'length' => "10" # Time to wait in seconds
    } 
    r.addWait(params)

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

# The Transfer API is invoked by the Get Digits action URL

get '/transfer_action' do

    r = Response.new()
    digit = params[:Digits]
    call_uuid = params[:CallUUID]
    print "Digit pressed #{digit}"
    print "Call UUID #{call_uuid}"

    AUTH_ID = "MAYMFHYZJKMJG0NJG4OG"
    AUTH_TOKEN = "ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx"

    p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

    if (digit == "1")
        params = {
            'call_uuid' => call_uuid, # ID of the call
            'aleg_url' => "https://enigmatic-cove-3140.herokuapp.com/connect", # URL to transfer for aleg
            'aleg_method' => "GET" # ethod to invoke the aleg_url
        }
        response = p.transfer_call(params)
        print response
    else
        print "Wrong Input"
    end
end

=begin
Sample XML

<Response>
    <GetDigits action="https://enigmatic-cove-3140.herokuapp.com/transfer_action" method="GET" numDigits="1" redirect="false" retries="1" timeout="7">
        <Speak>Press 1 to transfer this call</Speak>
    </GetDigits>
    <Wait length="10"/>
</Response>

Digit pressed 1
Call UUID 1d970618-b055-11e4-9f23-2b70f7e6a9a7

Transfer API Outpt
[202, 
    {
        "api_id"=>"224060b0-b055-11e4-ac1f-22000ac51de6", 
        "call_uuids"=>["1d970618-b055-11e4-9f23-2b70f7e6a9a7"], 
        "message"=>"transfer executed"
    }
]

Sample Connect XML
<Response>
    <Speak>Connecting your call..</Speak>
    <Dial>
        <Number>1111111111</Number>
    </Dial>
</Response>

=end    



