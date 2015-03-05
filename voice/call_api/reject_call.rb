# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

# Set te caller ID using Dial XML

get '/hangup' do

    r = Response.new()
    params = {
        'reason' => 'busy', # Specify the reason for hangup
        'schedule' => '60' # Schedule the hangup
    }
    
    body = "This call will be hung up in 1 minute"

    r.addSpeak(body)
    r.addHangup(params)
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Dial callerId="1111111111">
        <Number>2222222222</Number>
    </Dial>
</Response>    
=end
