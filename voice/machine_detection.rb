require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'to' => '2222222222', # The phone number to which the call has to be placed
    'from' => '1111111111', # The phone number to be used as the caller id
    'answer_url' => 'https://enigmatic-cove-3140.herokuapp.com/detect', # The URL invoked by Plivo when the outbound call is answered
    'answer_method' => 'GET', # The method used to call the answer_url
    'machine_detection' : "true", # Used to detect if the call has been answered by a machine. The valid values are true and hangup.
    'machine_detection_time' : "10000", # Time allotted to analyze if the call has been answered by a machine. The default value is 5000 ms.
    'machine_detection_url' : "http://enigmatic-cove-3140.herokuapp.com/machine_detection", # A URL where machine detection parameters will be sent by Plivo.
    'machine_detection_method' : "GET" # Method used to invoke machine_detection_url
}

response = p.make_call(params)
print response

=begin
Sample Output
[201, 
    {
        "api_id"=>"af863204-b02f-11e4-96e3-22000abcb9af", 
        "message"=>"call fired", 
        "request_uuid"=>"09c12b5d-d8df-4488-a5fa-4cf604ff526d"
    }
]
=end

# Machine Detection URL example

get '/machine_detection' do

    r = Response.new()
    from_number = params[:From]
    to_number = params[:To]
    machine = params[:Machine]
    call_uuid = params[:CallUUID]
    event = params[:Event]
    status = params[:CallStatus]

    puts "From : #{from_number}, To : #{to_number}, Machine : #{machine}, Call UUID : #{call_uuid}, Event : #{event}, Status : #{status}"
end

=begin
Sample Output
From : 2222222222, To : 1111111111, Machine : true, Call UUID : 45704ba2-959f-11e4-802f-e9b058eeb9e5, Event : MachineDetection, Call Status : in-progress       
=end

# As soon as the voicemail finishes speaking, and there is a silence for minSilence milliseconds, 
# the next element in the XML is processed, without waiting for the whole period of length seconds to pass

get '/detect' do

    r = Response.new()
    params = {
        'length' => "1000", # Time to wait in seconds
        'silence' => "true", # When silence is set to true, if no voice or sound is detected for minSilence milliseconds, end the wait and continue to the next element in the XML immediately 
        'minSilence' => "3000" # Only used when silence is set to true. The minimum length in milliseconds of silence that needs to be present to qualify as silence
    }
    r.addWait(params)
    r.addSpeak("Hello Voicemail")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

=begin
Sample Wait XML
<Response>
    <Wait length="10" silence="true" minSilence="500"/>
    <Speak>Hello Voicemail!</Speak>
</Response>
=end



