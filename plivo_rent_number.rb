require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "" 
AUTH_TOKEN = ""

api = RestAPI.new(AUTH_ID, AUTH_TOKEN)

 ## Search For Number
params = {
    country_code: '1',
    services: :sms,
    prefix: '443'
}
response = api.search_numbers(params)
    

number = response[1]['objects'].first['number']
print number

params = {'number' => number
    }

response = api.rent_number(params)
puts response.inspect
