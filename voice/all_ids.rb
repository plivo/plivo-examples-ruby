require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# API ID is returned for every API request. 
# Request UUID is request id of the call. This ID is returned as soon as the call is fired irrespective of whether the call is answered or not

begin
	response = api.calls.create(
		'+14151234567', # Caller ID
		['+15671234567'], # Destination number
		'http://s3.amazonaws.com/static.plivo.com/answer.xml' # URL which will return the XML
	)
	puts "API ID : #{response.api_id}"
	puts "Request ID : #{response.request_uuid}"

rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end


# Sample successful output
# API ID : a14d2070-9505-11e4-b932-22000ac50fac
# Request ID : 85b1d45d-bc12-47f5-89c7-ae4a2c5d5713

# Call UUID is the id of a live call. This ID is returned only after the call is answered.

begin
	response = api.calls.get_live(
		'eba53b9e-8fbd-45c1-9444-696d2172fbc8' # ID of the call
	)
	for uuid in response.calls
	print "Call UUID : #{uuid} "
    end
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

# Sample successful output
# Call UUID : a60f44dc-926f-11e4-82f5-b559cbfe39b9