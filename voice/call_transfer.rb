require 'rubygems'
require 'plivo'
include Plivo

get '/call_transfer' do
    r = Response.new()
    r.addSpeak("Please wait while your call is being transferred")
    r.addRedirect("https://enigmatic-cove-3140.herokuapp.com/connect")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

get '/connect' do
    r = Response.new()
    params = {
        'action' => "https://enigmatic-cove-3140.herokuapp.com/dial_status/", # Redirect to this URL after leaving Dial. 
        'method' => "GET", # Submit to action URL using GET or POST.
        'redirect' => "true" # If set to false, do not redirect to action URL. The call will be controlled based on the XML returned from the action URL.
    }

    r.addSpeak("Connecting your call..")
    d = r.addDial(params)
    d.addNumber("1111111111")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample output for Redirect XML
<Response>
    <Speak>Please wait while you call is being transferred</Speak>
    <Redirect>https://enigmatic-cove-3140.herokuapp.com/connect/</Redirect>
</Response>

Sample output for Dial XML
<Response>
    <Speak>Connecting your call..</Speak>
    <Dial action="https://enigmatic-cove-3140.herokuapp.com/dial_status/" method="GET" redirect="true">
        <Number>1111111111</Number>
    </Dial>
</Response>

=end