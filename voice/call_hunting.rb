require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

get '/call_hunting' do

	begin
		response = Response.new
				dial = response.addDial()
		first_user = "sip:alice1234@phone.plivo.com"
		dial.addUser(first_user)
				number = "1111111111"
		dial.addNumber(number)
				second_user = "sip:john1234@phone.plivo.com"
		dial.addUser(second_user)
				xml = PlivoXML.new(response)
		return xml.to_xml
	rescue PlivoXMLError => e
		puts 'Exception: ' + e.message
	end
end

=begin
Sample Output
<Response>
    <Dial>
      <User>sip:alice1234@phone.plivo.com</User>
      <Number>15671234567</Number>
      <User>sip:john1234@phone.plivo.com</User>
    </Dial>
</Response>
=end