require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/record_api' do
    content_type 'text/xml'
    begin
        response = Response.new
      
        params = {
            action: 'https://www.foo.com/record_api_action/' # The URL to which the digits are sent.
            method: 'GET', # Submit to action URL using GET or POST.
            timeout:'7', # Time in seconds to wait to receive the first digit.
            numDigits:'1', # Maximum number of digits to be processed in the current operation. 
            retries:'1', # Indicates the number of retries the user is allowed to input the digits
            redirect:false # Redirect to action URL if true. If false,only request the URL and continue to next element.
        }
      
        get_digits = response.addGetDigits(params)
        input_received_speak = 'Press 1 to record this call'
        get_digits.addSpeak(input_received_speak)
      
        xml = PlivoXML.new(response)
        puts xml.to_xml
      return PlivoXMLError => e
        puts 'Exception: ' + e.message
      end
end

get '/record_api_action' do
    digit = params[:Digits]
    call_uuid = params[:CallUUID]
    
    api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")
    
    if (digit == "1")
        begin
            response = api.calls.record(
                call_uuid  # ID of the call
            ) 
            puts response
        rescue PlivoRESTError => e
            puts 'Exception: ' + e.message
    else
        puts "Wrong Input"
    end
end

=begin
<Response>
    <GetDigits action="https://www.foo.com/record_api_action/" method="GET" numDigits="1" redirect="false" retries="1" timeout="7">
        <Speak>Press 1 to record this call</Speak>
    </GetDigits>
</Response>

{
        "api_id"=>"16847e54-9594-11e4-b423-22000ac8a2f8", 
        "url"=>"http://s3.amazonaws.com/recordings_2013/67673232-9594-11e4-baad-842b2b17453e.mp3",
        "recording_id"=>"16963644-9594-11e4-baad-842b2b17453e"
        "message"=>"call recording started", 
}
=end