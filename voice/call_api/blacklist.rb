require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/reject_caller/' do
    blacklist = ['14156667777', '14156667778', '14156667779']

    from_number = params[:From]
    r = Response.new()

    if blacklist.include? from_number
        # Specify the reason for hangup
        params = {
            reason: 'rejected'
        }
        r.addHangup(params)
    else
        r.addSpeak('Hello from plivo')
    end  
    xml = Plivo::PlivoXML.new(r)
    render xml: xml.to_xml
 end
end

=begin
Sample output when From number is in blacklist
<Response>
    <Hangup reason="rejected"/>
</Response>

Sample Output when From number is not in blacklist
<Response>
    <Speak>Hello from Plivo</Speak>
</Response>    
=end
