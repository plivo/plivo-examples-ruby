require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# This example shows how to traverse the list of all applications. 

# Get details all existing applications
begin
	response = api.applications.list(
		limit: 5, # The number of results per page
		offset: 0 # The number of value items by which the results should be offset
	)
	#print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output 
{
    "api_id"=>"0f337ed8-af76-11e4-b423-22000ac8a2f8", 
    "meta"=>{
        "limit"=>2, 
        "next"=>"/v1/Account/XXXXXXXXXXXX/Application/?limit=2&offset=2", 
        "offset"=>0, 
        "previous"=>nil, 
        "total_count"=>9
    }, "objects"=>[
        {
            "answer_method"=>"POST", 
            "answer_url"=>"http://example.com", 
            "app_id"=>"31417932002017379", 
            "app_name"=>"Testing_App", 
            "default_app"=>false, 
            "default_endpoint_app"=>false, 
            "enabled"=>true, 
            "fallback_answer_url"=>"", 
            "fallback_method"=>"POST", 
            "hangup_method"=>"POST", 
            "hangup_url"=>"http://example.com", 
            "message_method"=>"POST", 
            "message_url"=>"", 
            "public_uri"=>false, 
            "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Application/31417932002017379/", 
            "sip_uri"=>"sip:31417932002017379@app.plivo.com", 
            "sub_account"=>nil
        }, {
            "answer_method"=>"POST", 
            "answer_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
            "app_id"=>"16982793927977910", 
            "app_name"=>"Sip default", 
            "default_app"=>false, 
            "default_endpoint_app"=>true, 
            "enabled"=>true, 
            "fallback_answer_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533",
            "fallback_method"=>"POST", 
            "hangup_method"=>"POST", 
            "hangup_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
            "message_method"=>"POST", 
            "message_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
            "public_uri"=>false, 
            "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Application/16982793927977910/", 
            "sip_uri"=>"sip:16982793927977910@app.plivo.com", 
            "sub_account"=>nil
        }
    ]
}

=end

# Print the link to view the next page of results
print response['meta']['next']

=begin
    
Sample successful output
/v1/Account/XXXXXXXXXXXX/Application/?limit=2&offset=2
Browse https://api.plivo.com/v1/Account/XXXXXXXXXXXX/Application/?limit=2&offset=2
to view the next page of results. To traverse pages, browse the 'next' and 'previous' urls

=end
