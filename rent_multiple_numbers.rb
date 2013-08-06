require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Search Number Group
params = {'country_iso' => 'US',
		  'prefix' => '443'
        }
response = p.get_number_group(params)

group_id = response[1]['objects'][0]['group_id']

#Rent Numbers
params = {'group_id' => group_id,
		  'quantity' => '1'
        }
response = p.rent_from_number_group(params)
print response
