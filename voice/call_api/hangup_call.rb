equire 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
	response = api.calls.delete(
		'eba53b9e-8fbd-45c1-9444-696d2172fbc8' # UUID of the call to be hung up
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
[204,""]
=end