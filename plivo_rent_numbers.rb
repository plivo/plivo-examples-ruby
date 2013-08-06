require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "XXXXXXXXXXXXXXXXXXXXXXXXXXX" 
AUTH_TOKEN = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

api = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Search available numbers for a prefix
params = {
    country_code: '1',
    services: :sms,
    prefix: '443'   
}
response = api.search_numbers(params)    

#Print available numbers
for num in response[1]['objects'] do
	print num['number']
	print "\n"
end

#rent choosen number from abtained list
params = {'number' => number
    }

response = api.rent_number(params)
puts response.inspect