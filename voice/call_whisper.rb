require 'rubygems'
require 'plivo'
include Plivo

get '/call_whisper' do
    r = Response.new()
    params = {
        'confirmSound' => "https://enigmatic-cove-3140.herokuapp.com/confirm_sound", # A remote URL fetched with POST HTTP request which must return an 
                                                                                    # XML response with Play, Wait and/or Speak elements only.
        'confirmKey' => "5" # The digit to be pressed by the called party to accept the call.
    }

    d = r.addDial(params)
    d.addNumber("1111111111")
    d.addNumber("2222222222")
    d.addNumber("3333333333")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

get '/confirm_sound' do
    r = Response.new()
    r.addSpeak("Press 5 to answer the call")
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()    
end

=begin
Sample Output
<Response>
    <Dial confirmKey="5" confirmSound="ttps://morning-ocean-4669.herokuapp.com/confirm_sound/">
        <Number>1111111111</Number>
        <Number>2222222222</Number>
        <Number>3333333333</Number>
    </Dial>
</Response>

<Response>
    <Speak>Press 5 to answer the call</Speak>
</Response>
=end