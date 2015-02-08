require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUHT_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Get account details
response = p.get_account()
print response

=begin
Sample Output    
[200, 
    {
        "account_type"=>"standard", 
        "address"=>"Sample address", 
        "api_id"=>"f0d99f28-af73-11e4-96e3-22000abcb9af", 
        "auth_id"=>"XXXXXXXXXXXXXXXXX", 
        "auto_recharge"=>false, 
        "billing_mode"=>"prepaid", 
        "cash_credits"=>"78.74745", 
        "city"=>"Testing City", 
        "name"=>"Testing", 
        "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
        "state"=>"", 
        "timezone"=>"Indian/Mauritius"
    }
]    
=end

# Modify account
params = {
    'name'  => 'Sample', # Name of the account holder or business.
    'city'  => 'Sample City', # City of the account holder
    'address' => 'Testig address', # Address of the account holder
    'timezone' => 'Asia/Kolkata' # Time zone of the account holder
}

response = p.modify_account(params)
print response

=begin
Sample Output    
[202, 
    {
        "api_id"=>"3ddf476e-af74-11e4-ac1f-22000ac51de6", 
        "message"=>"changed"
    }
]    
=end

# Create a sub account
params = {
    'name' => 'test_subaccount2', # Name of the subaccount
    'enabled' => 'True' # Specify if the subaccount should be enabled or not
}

response = p.create_subaccount(params)
print response

=begin
Sample Output    
[201, 
    {
        "api_id"=>"54906eca-af74-11e4-96e3-22000abcb9af", 
        "auth_id"=>"SANZZMZTC3ODQ3YTQ5NT", 
        "auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGVhMmY3MTNlNTMyMDlm", 
        "message"=>"created"
    }
]  
=end

# Modify a sub account
params = {
    'subauth_id' => 'SANZZMZTC3ODQ3YTQ5NT', # Auth ID of the sub acccount that has to be modified
    'name' => 'XYZ_test' # Name of the subaccount
}

response = p.modify_subaccount(params)
print response

=begin
Sample Output    
[202, 
    {
        "api_id"=>"7446b580-af74-11e4-a2d1-22000ac5040c", 
        "message"=>"changed"
    }
]   
=end

# Get details of all sub accounts
params = {
    'limit' => '5', # The number of results per page
    'offset' => '1' # The number of value items by which the results should be offset
}

response = p.get_subaccounts()
print response

=begin
Sample Output    
[200, 
    {
        "api_id"=>"877ed006-af74-11e4-96e3-22000abcb9af", 
        "meta"=>{
            "limit"=>20, 
            "next"=>nil, 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>2
        }, "objects"=>[
            {
                "account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
                "auth_id"=>"SANZZMZTC3ODQ3YTQ5NT", 
                "auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGVhMmY3MTNlNTMyMDlm", 
                "created"=>"2015-02-08", 
                "enabled"=>true, 
                "modified"=>"2015-02-08", 
                "name"=>"XYZ_test", 
                "new_auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGVhMmY3MTNlNTMyMDlm", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SANZZMZTC3ODQ3YTQ5NT/"
            }, {
                "account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
                "auth_id"=>"SAMWJKYJFHZTM2YWE4OW", 
                "auth_token"=>"MjI4YzBiMDQ4MWFjODkyYWNkMDY3NDViMDZjZGUz", 
                "created"=>"2014-12-04", 
                "enabled"=>true, 
                "modified"=>nil, 
                "name"=>"Ramya", 
                "new_auth_token"=>"MjI4YzBiMDQ4MWFjODkyYWNkMDY3NDViMDZjZGUz", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SAMWJKYJFHZTM2YWE4OW/"
            }
        ]
    }
]    
=end

# Print the total number of apps
print response[1]['meta']['total_count']

# Sample successful output
# 2

# Get details of a particular sub acount
params = {
    'subauth_id' => 'SANZZMZTC3ODQ3YTQ5NT' # Auth ID of the sub acccount for which the details hae to be retrieved
}

response = p.get_subaccount(params)
print response

=begin
Sample Output    
[200, 
    {
        "account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
        "api_id"=>"d3461404-af74-11e4-96e3-22000abcb9af", 
        "auth_id"=>"SANZZMZTC3ODQ3YTQ5NT", 
        "auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGVhMmY3MTNlNTMyMDlm", 
        "created"=>"2015-02-08", 
        "enabled"=>true, 
        "modified"=>"2015-02-08", 
        "name"=>"XYZ_test", 
        "new_auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGVhMmY3MTNlNTMyMDlm", 
        "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SANZZMZTC3ODQ3YTQ5NT/"
    }
]  
=end

params = {
    'subauth_id' => 'SANZZMZTC3ODQ3YTQ5NT' # Auth ID of the sub acccount that has to be deleted
}

response = p.delete_subaccount(params)
print response

=begin
Sample Output    
[204, ""]    
=end
