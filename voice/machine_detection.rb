require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
    response = api.calls.create(
      '+14151234567',
      ['+15671234567'],
      'http://s3.amazonaws.com/static.plivo.com/answer.xml',
      'GET'
      { machine_detection: true, # Used to detect if the call has been answered by a machine. The valid values are true and hangup.
          machine_detection_time:'10000', # Time allotted to analyze if the call has been answered by a machine. The default value is 5000 ms.
          machine_detection_url:'https://www.foo.com/machine_detection', # A URL where machine detection parameters will be sent by Plivo.
          machine_detection_method:'GET' # Method used to invoke machine_detection_url
      },
    )
    puts response
  rescue PlivoRESTError => e
    puts 'Exception: ' + e.message
end

=begin
Sample Output 
{
    "api_id"=>"af863204-b02f-11e4-96e3-22000abcb9af", 
    "message"=>"call fired", 
    "request_uuid"=>"09c12b5d-d8df-4488-a5fa-4cf604ff526d"
}
=end

# Machine Detection URL example
get '/machine_detection' do

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
get '/basic_wait' do
	content_type 'text/xml'
	begin
		response = Response.new
		params = {
			length: '10', # Time to wait in seconds
			silence:'true', # When silence is set to true, if no voice or sound is detected for minSilence milliseconds, end the wait and continue to the next element in the XML immediately 
			minSilence:'3000' # Only used when silence is set to true. The minimum length in milliseconds of silence that needs to be present to qualify as silence
		}
		response.addWait(params)   
		speak_body = 'Hello Voicemail'
		response.addSpeak(speak_body)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Wait XML
<Response>
    <Wait length="10" silence="true" minSilence="500"/>
    <Speak>Hello Voicemail!</Speak>
</Response>
=end



