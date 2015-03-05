require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/call_hunting' do

    r = Response.new()
    r.addSpeak("Dialing")
    d = r.addDial()
    d.addNumber("2222222222")
    d.addNumber("3333333333")
    d.addUser("sip:abcd1234@phone.plivo.com")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Speak>Dialing</Speak>
    <Dial>
        <Number>2222222222</Number>
        <Number>3333333333</Number>
        <User>sip:abcd1234@phone.plivo.com</User>
    </Dial>
</Response>  
=end