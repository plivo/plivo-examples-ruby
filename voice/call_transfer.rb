require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/call_transfer' do
    content_type 'text/xml'
    begin
        response = Response.new
      
        speak_body = 'Please wait while you call is being transferred.'
        response.addSpeak(speak_body)

        redirect_url = 'https://www.foo.com/connect/'
        response.addRedirect(redirect_url);

        xml = PlivoXML.new(response)
        puts xml.to_xml
      rescue PlivoXMLError => e
        puts 'Exception: ' + e.message
      end
    
    return r.to_s()
end

get '/connect' do
    content_type 'text/xml'
	begin
		response = Response.new
		speak_body = 'Connecting your call..'
		response.addSpeak(speak_body)
				params = {
			'action' => 'https://www.foo.com/dial_status/', # Redirect to this URL after leaving Dial.
            'method' => 'GET' # Submit to action URL using GET or POST.
            'redirect' => "true" # If set to false, do not redirect to action URL. The call will be controlled based on the XML returned from the action URL.
		}
		dial = response.addDial(params)
		first_number = "1111111111"
		dial.addNumber(first_number)
		xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample output for Redirect XML
<Response>
    <Speak>Please wait while you call is being transferred</Speak>
    <Redirect>https://www.foo.com/connect/</Redirect>
</Response>

Sample output for Dial XML
<Response>
    <Speak>Connecting your call..</Speak>
    <Dial action="https://www.foo.com/dial_status/dial_status/" method="GET" redirect="true">
        <Number>1111111111</Number>
    </Dial>
</Response>

=end