require 'rubygems'
require 'plivo'
include Plivo

# Example for Basic Wait

get '/basic_wait' do
    r = Response.new()
    
    r.addSpeak("I will wait for 10 seconds")
    
    params = {
        'length' => "10" # Time to wait in seconds
    }

    r.addWait(params)
    r.addSpeak("I just waited 10 seconds")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Speak>I will wait for 10 seconds</Speak>
    <Wait length="10" />
    <Speak>I just waited 10 seconds</Speak>
</Response>
=end

# Example for Delayed Call Answer

get '/delayed_wait' do
    r = Response.new()
    params = {
        'length' => "10" # Time to wait in seconds
    }
    r.addWait(params)
    r.addSpeak("Hello")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output
<Response>
    <Wait length="10" />
    <Speak>Hello</Speak>
</Response>
=end

# Example for Beep Detection

get '/beep_det' do
    r = Response.new()
    params = {
        'length' => "100", # Time to wait in seconds
        'beep' => "true"
    }
    r.addWait(params)
    r.addSpeak("Hello")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Output 
<Response>
    <Wait length="10" beep="true" />
    <Speak>Hello</Speak>
</Response>
=end



