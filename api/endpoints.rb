require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# Create an Endpoint
begin
	response = api.endpoints.create(
		'testusername', # The username for the endpoint to be created
		'testpassword', # The password for your endpoint username
		'Test Account', # Alias for this endpoint
	)
	# print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end


=begin
Sample Output
{
   "alias""=>""Test Account",
   "api_id""=>""f240e817-4f2f-11eb-9df4-0242ac110003",
   "endpoint_id""=>""170531581259436",
   "message""=>""created",
   "username""=>""testusername507459284486405183834",
   "id""=>""170531581259436"
}  
=end

# Get details of all existing endpoints
begin
	response = api.endpoints.list
	#print response    
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
   "api_id""=>""4ddfdee8-af70-11e4-b153-22000abcaa64",
   "meta""=>"{
      "limit"=>2,
      "next""=>""/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/?limit=2&offset=2",
      "offset"=>0,
      "previous""=>nil",
      "total_count"=>3
   },
   "objects""=>"[
      {
         "alias""=>""Sample address",
         "application""=>""/v1/Account/xxxxxxxxxxxxxxxxx/Application/16982793927977910/",
         "endpoint_id""=>""32548855995201",
         "password""=>""7681fb638a6edc7c70a522f58659af10",
         "resource_uri""=>""/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/32548855995201/",
         "sip_registered""=>""false",
         "sip_uri""=>""sip:Testing150208085331@phone.plivo.com",
         "sub_account""=>nil",
         "username""=>""Testing150208085331"
      },
      {
         "alias""=>""TestSample",
         "application""=>""/v1/Account/xxxxxxxxxxxxxxxxx/Application/16632742496743552/",
         "endpoint_id""=>""24753112937214",
         "password""=>""147538da338b770b61e592afc92b1ee6",
         "resource_uri""=>""/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/24753112937214/",
         "sip_registered""=>""false",
         "sip_uri""=>""sip:test150108095716@phone.plivo.com",
         "sub_account""=>nil",
         "username""=>""test150108095716"
      }
   ]
}
=end


# Get details of a single endpoint
begin
	response = api.endpoints.get(
		'39452475478853' # ID of the endpoint for which the details have to be retrieved
	)
	#print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
 
{
    "alias"=>"Sample address", 
    "api_id"=>"df4e1638-af70-11e4-a2d1-22000ac5040c", 
    "application"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Application/16982793927977910/", 
    "endpoint_id"=>"32548855995201", 
    "password"=>"7681fb638a6edc7c70a522f58659af10", 
    "resource_uri"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/32548855995201/", 
    "sip_registered"=>"false", 
    "sip_uri"=>"sip:Testing150208085331@phone.plivo.com", 
    "sub_account"=>nil, 
    "username"=>"Testing150208085331"
}
=end

# Modify an endpoint

begin
	response = api.endpoints.update(
		'39452475478853', # ID of the endpoint that has to be modified
		alias: 'Updated Endpoint Alias' # Values that have to be updated
	)
	#print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
    "api_id"=>"1e0bceec-af71-11e4-b423-22000ac8a2f8", 
    "message"=>"changed"
}
=end

# Delete an endpoint
begin
	response = api.endpoints.delete(
		'39452475478853' # ID of the endpoint that as to be deleted
	)
	#print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
[204, ""]
=end


