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
    
    api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
  response = api.calls.update(
    'eba53b9e-8fbd-45c1-9444-696d2172fbc8', # ID of the call
    legs: 'aleg', # leg to be transferred
    aleg_url: 'http://aleg.url' # URL to transfer for aleg
    aleg_method: 'GET' # method to invoke the aleg_url
  )
  return response
rescue PlivoRESTError => e
  puts 'Exception: ' + e.message
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
{
    "api_id"=>"224060b0-b055-11e4-ac1f-22000ac51de6", 
    "call_uuids"=>["1d970618-b055-11e4-9f23-2b70f7e6a9a7"], 
    "message"=>"transfer executed"
}

Sample Connect XML
<Response>
    <Speak>Connecting your call..</Speak>
    <Dial>
        <Number>1111111111</Number>
    </Dial>
</Response>

=end    



