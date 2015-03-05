require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/seq_dial' do
    r = Response.new()

    params = {
        'timeout' => "20", # The duration (in seconds) for which the called party has to be given a ring.
        'action' => "https://enigmatic-cove-3140.herokuapp.com/dial_status" # Redirect to this URL after leaving Dial.
    }
    d = r.addDial(params)
    d.addNumber("1111111111")
    d = r.addDial()
    d.addNumber("2222222222")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Dial action="https://enigmatic-cove-3140.herokuapp.com/dial_status/" timeout="20">
       <Number>1111111111</Number>
    </Dial>
    <Dial>
       <Number>2222222222</Number>
    </Dial>
</Response>
=end