require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# Get account details
begin
	response = api.account.details
		puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
{
  :account_type=>"standard", 
  :address=>"Test Address", 
  :api_id=>"1b334d32-3b96-11eb-aea7-0242ac110003", 
  :auth_id=>"MAXXXXXXXXXXXX", 
  :auto_recharge=>false,
  :billing_mode=>"prepaid", 
  :cash_credits=>"19.44188", 
  :city=>"Test City", 
  :name=>"Mohammed Huzaif", 
  :resource_uri=>"/v1/Account/MAXXXXXXXXXXXX/", 
  :state=>"Test state", 
  :timezone=>"Asia/Kolkata"
}
=end

# Modify account
begin
	response = api.account.update(
		city: 'Test City', # Name of the City.
		name: 'Test Account', # Name of the account.
		address: 'Test Address' # Your Office address.
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
{
    :"api_id"=>"3ddf476e-af74-11e4-ac1f-22000ac51de6", 
    :"message"=>"changed"
}
=end

# Create a sub account
begin
	response = api.subaccounts.create(
		'Test Subaccount', # Name of the subaccount
		true, # Specify if the subaccount should be enabled or not
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
{
    :"api_id"=>"54906eca-af74-11e4-96e3-22000abcb9af", 
    :"auth_id"=>"SANZXXXXXXXXXXXXX", 
    :"auth_token"=>"OGU0OTJmNDZhOWQwZTXXXXXXXXXXXX", 
    :"message"=>"created"
}
=end

# Modify a sub account
begin
	response = api.subaccounts.update(
		'SAXXXXXXXXXXXXXXXXXX', # Auth ID of the sub acccount that has to be modified
		'Updated Subaccount Name', # Name of the subaccount
		false # Specify if the subaccount should be enabled or not
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
{
    :"api_id"=>"7446b580-af74-11e4-a2d1-22000ac5040c", 
    :"message"=>"changed"
}
=end

# Get details of all sub accounts
begin
	response = api.subaccounts.list(
		limit: 5, # The number of results per page
		offset: 0,# The number of value items by which the results should be offset
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end
=begin
Sample Output    
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
                :"account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
                :"auth_id"=>"SAXXXXXXXXXXXXXXX", 
                :"auth_token"=>"OGU0OTJmNDZhOWQwdfXXXXXXXXXXXXXXX", 
                :"created"=>"2015-02-08", 
                :"enabled"=>true, 
                :"modified"=>"2015-02-08", 
                :"name"=>"XYZ_test", 
                :"new_auth_token"=>"OGU0OTJmNDZhOWQwZTYerXXXXXXXXXXXXXXX", 
                :"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SAXXXXXXXXXXXXXXX/"
            }, {
                :"account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
                :"auth_id"=>"SAXXXXXXXXXXXXXXX", 
                :"auth_token"=>"MjI4YzBiMDQ4MWFjewXXXXXXXXXXXXXXX", 
                :"created"=>"2014-12-04", 
                :"enabled"=>true, 
                :"modified"=>nil, 
                :"name"=>"Ramya", 
                :"new_auth_token"=>"MjI4YzBiMDQ4MWF3edXXXXXXXXXXXXXXX", 
                :"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SAXXXXXXXXXXXXXXX/"
            }
        ]
    }
]    
=end

# Get details of a particular sub acount
begin
	response = api.subaccounts.get(
		'SAXXXXXXXXXXXXXXXXXX' # Auth ID of the sub acccount for which the details hae to be retrieved
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
{
        :"account"=>"/v1/Account/XXXXXXXXXXXXXXXXX/", 
        :"api_id"=>"d3461404-af74-11e4-96e3-22000abcb9af", 
        :"auth_id"=>"SAXXXXXXXXXXXXXXXXX", 
        :"auth_token"=>"OGU0OTJmNDZhOWQwZTY5ZGXXXXXXXXXXXXXXXXX", 
        :"created"=>"2015-02-08", 
        :"enabled"=>true, 
        :"modified"=>"2015-02-08", 
        :"name"=>"XYZ_test", 
        :"new_auth_token"=>"OGU0OTJmNDZhOWQwZTXXXXXXXXXXXXXXXXX", 
        :"resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXXXX/Subaccount/SAXXXXXXXXXXXXXXXXX/"
}
=end

begin
	response = api.subaccounts.delete(
		'SAXXXXXXXXXXXXXXX', # Auth ID of the sub acccount that has to be deleted
		true,
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output    
No response
=end
