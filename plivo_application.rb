require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Create application
params = {
    'app_name' => 'Gandalf the Gray',
    'answer_url' => 'http://example.com/answer_url',
    'answer_method' => 'POST',
    'hangup_url' => 'http://example.com/hangup_url',
    'hangup_method' => 'POST',
    'fallback_url' => 'http://example.com/fallback_url',
    'fallback_method' => 'POST',
}
response = p.create_application(params)


# Modify application
response = p.modify_application(params)


# Delete application
params = {
    'app_id' => 'XXXXXXXXXXXXXXXXXXXXXXX',
}
response = p.delete_application(params)


# Create subaccount application
params = {
    'subauth_id' => ' XXXXXXXXXXXX',
    'app_name' => 'Gimli the dwarf',
    'answer_url' => 'http://example.com/answer_url',
    'answer_method' => 'POST',
    'hangup_url' => 'http://example.com/hangup_url',
    'hangup_method' => 'POST',
    'fallback_url' => 'http://example.com/fallback_url',
    'fallback_method' => 'POST',
}
response = p.create_subaccount_application(params)
