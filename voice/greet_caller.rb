require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/greet_caller/' do

    people = {
        '1111111111' => 'ACDEF',
        '2222222222' => 'WVXYZ',
        '3333333333' => 'QWERTY'
    }

    from_number = params[:From] 
    r = Response.new()

    if people.include? from_number
        body = "Hello " + people[from_number]
    else
        body = 'Hello Stranger!' 
    end

    r.addSpeak(body)
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()

end

=begin
Sample Output
<Response>
    <Speak>Hello,ABCDEF</Speak>
</Response>
=end