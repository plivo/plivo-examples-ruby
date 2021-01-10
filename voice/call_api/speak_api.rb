require 'rubygems'
require 'plivo'
require 'sinatra'

include Plivo::XML
include Plivo::Exceptions

# Set te caller ID using Dial XML

get '/speak_api' do
    content_type 'text/xml'

    begin
        response = Response.new
      
        params = {
            action: 'https://www.foo.com/speak_action/',
            method: 'POST',
            timeout:'7',
            numDigits:'1',
            retries:'1',
            redirect:false
        }
      
        get_digits = response.addGetDigits(params)
        input_received_speak = 'Press 1 to listen to a message'
        get_digits.addSpeak(input_received_speak)
    
  
        xml = PlivoXML.new(response)
        return xml.to_xml
      rescue PlivoXMLError => e
        puts 'Exception: ' + e.message
      end
end

get '/speak_action' do
    
    digit = params[:Digits]
    call_uuid = params[:CallUUID]

    api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")
    if (digit == "1")
        begin
            response = api.calls.speak(
                'eba53b9e-8fbd-45c1-9444-696d2172fbc8', # ID of the call
                'Hello from Speak API' # Text to be played.
                voice:'WOMAN', # The voice to be used, can be MAN,WOMAN. Defaults to WOMAN.
                language:'en-GB' # The language to be used
            )
            puts respons
        rescue PlivoRESTError => e
            puts 'Exception: ' + e.message
    else
        print "Wrong Input"
    end
end

=begin
<Response>
    <GetDigits action="https://www.foo.com/speak_action/" method="POST" numDigits="1" redirect="false" retries="1" timeout="7">
        <Speak>Press 1 to listen to a message</Speak>
    </GetDigits>
</Response>   

{
        "api_id"=>"98e27232-b03a-11e4-b153-22000abcaa64", 
        "message"=>"speak started"
}    
=end