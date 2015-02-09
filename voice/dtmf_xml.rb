require 'rubygems'
require 'plivo'
include Plivo

get '/dtmf' do
    r = Response.new()
    r.addSpeak("Sending Digits")
    r.addDTMF("12345")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample DTMF XML
<Response>
    <Speak>Sending Digits</Speak>
    <DTMF>12345</DTMF>
</Response>
=end
