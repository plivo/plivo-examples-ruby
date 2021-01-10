require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/seq_dial' do
	content_type 'text/xml'
	begin
		response = Response.new
				params = {
			'timeout' => "20", # The duration (in seconds) for which the called party has to be given a ring.
			'action' => "https://www.foo.com/dial_status/" # Redirect to this URL after leaving Dial.
        }
        first_dial = response.addDial(params)
		first_number = "1111111111"
		first_dial.addNumber(first_number)
				second_dial = response.addDial()
		second_number = "2222222222"
		second_dial.addNumber(second_number)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Output
<Response>
    <Dial action="https://www.foo.com/dial_status/" timeout="20">
       <Number>1111111111</Number>
    </Dial>
    <Dial>
       <Number>2222222222</Number>
    </Dial>
</Response>
=end