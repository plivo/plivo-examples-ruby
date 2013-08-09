require 'rubygems'
require 'plivo'
include Plivo


AUTH_ID = "XXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "XXXXXXXXXXXXXXXXXXXXXXX"

p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Create an endpoint
params = {'alias' => '<alias name>',
		  'username' => '<your user name>',
		  'password' => '<your password>' 
         }
response = p.create_endpoint(params)


# Get Details of a Particular Endpoint
params = {'endpoint_id' => '10606913154315' }
response = p.get_endpoint(params)


# Get Details of All Endpoints
response = p.get_endpoints()


# Modify an Endpoint
params = {'alias' => 'test2',
		  'endpoint_id' => '10606913154315',
		  'app_id' => '29106759302105068',
		  'password' => '<new password>' 
         }
response = p.modify_endpoint(params)


# Delete an endpoint
params = {'endpoint_id' => '18093289457680' }
response = p.delete_endpoint(params)

