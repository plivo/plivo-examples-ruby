require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/dial' do
    # When an outbound call is made and then connected different number using Dial element, 
    # you can play a custom caller tone using the dialMusic attribute
    
    r = Response.new()
    params = {
        'dialMusic' => "https://enigmatic-cove-3140.herokuapp.com/custom_tone/"
    }

    d = r.addDial(params)
    d.addumber("1111111111")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Dial XML
<Response>
    <Dial dialMusic="https://enigmatic-cove-3140.herokuapp.com/custom_tone/">
        <Number>1111111111</Number>
    </Dial>
</Response> 
=end

get '/custom_tone' do
    r = Response.new()
    r.addPlay("https://s3.amazonaws.com/plivocloud/music.mp3")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample output
<Response>
   <Play>https://s3.amazonaws.com/plivocloud/music.mp3</Play>
</Response>    
=end