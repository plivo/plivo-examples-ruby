require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# Link an application to a number
begin
	response = api.numbers.update(
		'15671234567', # Number that has to be linked to an application
		app_id: '77506472664956327' # Application ID that has to be linked
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
        "api_id"=>"d509f0b2-b686-11e4-af95-22000ac54c79", 
        "message"=>"changed"
}
=end

# Unlink an application from an number
begin
	response = api.numbers.update(
		'13308702395', # Number that has to be unlikned to an application
		app_id: ''
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
        "api_id"=>"e5456f42-b686-11e4-af95-22000ac54c79", 
        "message"=>"changed"
}
=end