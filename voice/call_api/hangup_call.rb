# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

params = {
    'call_uuid': 'defb0706-86a6-11e4-b303-498d468c930b' # UUID of the call to be hung up
}

response = p.hangup_call(params)
print response

=begin
Sample Output
[204,""]
=end