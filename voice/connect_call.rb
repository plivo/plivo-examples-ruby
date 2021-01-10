require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/connect' do
    # Generate a Dial XML with the details of the number to call 
    begin
        response = Response.new
        speak_body = 'Connecting your call..'
        response.addSpeak(speak_body, params)
        dial = response.addDial()
        first_number = "1111111111"
        dial.addNumber(first_number)
        xml = PlivoXML.new(response)
        return xml.to_xml
      rescue PlivoXMLError => e
        puts 'Exception: ' + e.message
    end

=begin
Sample output
<Response>
    <Speak>Connecting your call..</Speak>
    <Dial>
       <Number>1111111111</Number>
    </Dial>
</Response>    
=end