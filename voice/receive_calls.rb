require 'rubygems'
require 'plivo'
include Plivo

get '/speak' do
    r = Response.new()
    r.addSpeak("Hello, Welcome to Plivo")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Speak XML
<Response>
    <Speak>Hello, Welcome to Plivo.</Speak>
</Response>
=end