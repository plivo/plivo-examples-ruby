require 'plivo'


AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Get account details
response = p.get_account()

# Get all subaccounts
response = p.get_subaccounts()


# Get subaccount details
params = {'subauth_id' => 'XXXXXXXXXXXXXXXXXXXXXXX'}
response = p.get_subaccounts(params)


# Delete a subaccount
params = {'subauth_id' => 'XXXXXXXXXXXXXXXXXXXXXXX'}
response = p.delete_subaccount(params)


# Create a subaccount
params = {'name' => 'Gandalf'}
response = p.create_subaccount(params)



