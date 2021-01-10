require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/forward' do
	content_type 'text/xml'

	# Generate a Dial XML to forward an incoming call.

	# The phone number of the person calling your Plivo number,
	# we'll use this as the Caller ID when we forward the call.

	from_number = params[:From]

	# The number you would like to forward the call to.

	forwarding_number = "2222222222"
		begin
		response = Response.new
				params = {
			'callerId' => from_number # The phone number to be used as the caller id. It can be set to the from_number or any custom number.
		}
				dial = response.addDial(params)
		first_number = "2222222222"
		dial.addNumber(first_number)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample output
<Response>
   <Dial callerId="1111111111">
       <Number>2222222222</Number>
   </Dial>
</Response>
=end