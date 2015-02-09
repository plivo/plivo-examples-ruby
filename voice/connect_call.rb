require 'rubygems'
require 'plivo'
include Plivo

get '/connect' do
    # Generate a Dial XML with the details of the number to call 
    
    r = Response.new()
    r.addSpeak("Connecting your call..")
    d = r.addDial(params)
    d.addNumber("1111111111")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
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
    