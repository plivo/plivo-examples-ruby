require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/reject_caller/' do
    people = ['1111111111','2222222222','3333333333']

    from_number = params[:From] 
    r = Response.new()

    if people.include? from_number
        params = {
            'reason' =>'rejected'
        }
        r.addHangup(params)
    else
        r.addSpeak('Hello, from Plivo')
    end
    
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()

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
