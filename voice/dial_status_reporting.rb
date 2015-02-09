require 'rubygems'
require 'plivo'
include Plivo

get '/dial' do
    r = Response.new()
    params = {
        'action' : "https://enigmatic-cove-3140.herokuapp.com/dial_status", # Redirect to this URL after leaving Dial.
        'method' : 'GET' # Submit to action URL using GET or POST.
    }

    r.addSpeak("Connecting your call..")
    d = r.addDial(params)
    d.addumber("1111111111")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

get '/dial_status' do
    status = params[:DialStatus]
    aleg = params[:DialALegUUID]
    bleg = params[:DialBLegUUID]
    puts "Status : #{status}, ALeg UUID : #{aleg}, BLeg UUID : #{bleg}"
end

=begin
# Sample Dial XML
<Response>
   <Speak>Connecting your call..</Speak>
   <Dial action="https://enigmatic-cove-3140.herokuapp.com/dial_status/" method="GET">
       <Number>1111111111</Number>
   </Dial>
</Response>

Status : completed, ALeg UUID : 52bb0058-902d-11e4-9681-2d7d49a323a0, BLeg UUID : 54f84290-902d-11e4-96df-2d7d49a323a0
=end