require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# Create a new application
begin
	response = api.applications.create(
		'Test Application', # The name of your application
		answer_url: 'http://answer.url', # The URL Plivo will fetch when a call executes this application
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end


=begin
Sample Output 
{
    "api_id"=>"ec5adc12-af75-11e4-ac1f-22000ac51de6", 
    "app_id"=>"31417932002017379", 
    "message"=>"created"
}
=end

# Get details all existing applications
begin
	response = api.applications.list(
		limit: 5, # The number of results per page
		offset: 0 # The number of value items by which the results should be offset
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.messag
end

=begin
Sample Output 
{
    :"api_id"=>"0f337ed8-af76-11e4-b423-22000ac8a2f8", 
    :"meta"=>{
        :"limit"=>2, 
        :"next"=>"/v1/Account/XXXXXXXXXXXX/Application/?limit=2&offset=2", 
        :"offset"=>0, 
        :"previous"=>nil, 
        :"total_count"=>9
        }, "objects"=>
        {
            :"answer_method"=>"POST", 
            :"answer_url"=>"http://example.com", 
            :"app_id"=>"31417932002017379", 
            :"app_name"=>"Testing_App", 
            :"default_app"=>false, 
            :"default_endpoint_app"=>false, 
            :"enabled"=>true, 
            :"fallback_answer_url"=>"", 
            :"fallback_method"=>"POST", 
            :"hangup_method"=>"POST", 
            :"hangup_url"=>"http://example.com", 
            :"message_method"=>"POST", 
            :"message_url"=>"", 
            :"public_uri"=>false, 
            :"resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Application/31417932002017379/", 
            :"sip_uri"=>"sip:31417932002017379@app.plivo.com", 
            :"sub_account"=>nil
            }, 
            {
                :"answer_method"=>"POST", 
                :"answer_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
                :"app_id"=>"16982793927977910", 
                :"app_name"=>"Sip default", 
                :"default_app"=>false, 
                :"default_endpoint_app"=>true, 
                :"enabled"=>true, 
                :"fallback_answer_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533",
                :"fallback_method"=>"POST", 
                :"hangup_method"=>"POST", 
                :"hangup_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
                :"message_method"=>"POST", 
                :"message_url"=>"http://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=919663489533", 
                :"public_uri"=>false, 
                :"resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Application/16982793927977910/", 
                :"sip_uri"=>"sip:16982793927977910@app.plivo.com", 
                :"sub_account"=>nil
            }
        ]
    }
=end

# Get details of a single application
begin
	response = api.applications.get(
		'15784735442685051' # ID of the application that has to be modified
	)
	# print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.messag
end


=begin
Sample Output 
{
	:answer_method=>"GET", 
	:answer_url=>"http
	://plivodirectdial.herokuapp.com/response/sip/route/?DialMusic=real&CLID=18587561234", 
	:app_id=>"77506472664956327", 
	:api_id=>"04011dad-4f26-11eb-8f87-0242ac110005", 
	:app_name=>"Direct Dial", 
	:default_app=>false, 
	:default_endpoint_app=>true, 
	:enabled=>true, 
	:fallback_answer_url=>"", 
	:fallback_method=>"POST", 
	:hangup_method=>"POST", 
	:hangup_url=>"https
	://webhook.site/bbcd37a6-922c-4cfe-8c3f-8ea282f83702", 
	:message_method=>"POST", 
	:message_url=>"https
	://run.mocky.io/v3/33eb28f6-2a00-4a98-9235-06e1ace5728a", 
	:public_uri=>false, 
	:resource_uri=>"/v1/Account/MAMDC1NTE3ZGQ4NWNJNM/Application/77506472664956327/", 
	:sip_uri=>"sip:77506472664956327@app.plivo.com", 
	:sub_account=>nil, 
	:log_incoming_messages=>nil
}
=end

# Modify an application

begin
	response = api.applications.update(
		'31417932002017379', # ID of the application that has to be modified
		answer_url: 'http://exampletest.com' # Values that have to be updated
	)
	# print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output 
{
    :"api_id": "9fc9268c-4f26-11eb-be7e-0242ac110004",
    :"message": "changed"
}
=end

# Delete an application
begin
	response = api.applications.delete(
		'15784735442685051' # ID of the application that as to be deleted
	)
	# print response
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output 
[204, ""]
=end

