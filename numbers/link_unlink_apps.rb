require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Link an application to a number
params = {
        'number' => '12143010249', # Number that has to be linked to an application
        'app_id' => '16632742496743552' # Application ID that has to be linked
}

#response = p.link_application_number(params)
#print response

'''
Sample Output
[202, {
        "api_id"=>"d509f0b2-b686-11e4-af95-22000ac54c79", 
        "message"=>"changed"
    }
]
'''

# Unlink an application from an number
params = {
        'number' => '12143010249' # Number that has to be unlikned to an application
}

response = p.unlink_application_number(params)
print response

'''
Sample Output
[202, {
        "api_id"=>"e5456f42-b686-11e4-af95-22000ac54c79", 
        "message"=>"changed"
    }
]
'''