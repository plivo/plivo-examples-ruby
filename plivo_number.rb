require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Get all numbers
response = p.get_numbers()

# Get one rented number
params = {
        'number'=> '1212121212',
}
response = p.get_number(params)

# Search number
params = {
    'contains'=> '43',
}
response = p.search_numbers(params)


# Rent number
params = {
        'number'=> '1212121212',
}
response = p.rent_number(params)


# Link application
params = {
        'number'=> '1212121212',
        'app_id'=> 'SACSSSASDDDDDD',
}
response = p.link_application_number(params)


# Unlink application
params = {
        'number'=> '1212121212',
}
response = p.unlink_application_number(params)


# Get subaccount numbers
params = {
        'subauth_id'=> 'XXXXXXXXXXXXXXXXXXX',
}
response = p.get_subaccount_numbers(params)


