require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUHT_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Create a new application
params = {
    'answer_url' => 'http://example.com', # The URL Plivo will fetch when a call executes this application
    'app_name' => 'Testing_App' # The name of your application
}

response = p.create_application(params)
#print response

=begin
Sample Output 
[201, 
    {
        "api_id"=>"ec5adc12-af75-11e4-ac1f-22000ac51de6", 
        "app_id"=>"31417932002017379", 
        "message"=>"created"
    }
]
=end

# Get details all existing applications
params = {
        'limit' => '2', # The number of results per page
        'offset' => '0' # The number of value items by which the results should be offset
}

response = p.get_applications()
#print response

=begin
Sample Output 
[200, 
    {
        "api_id"=>"0f337ed8-af76-11e4-b423-22000ac8a2f8", 
        "meta"=>{
            "limit"=>2, 
            "next"=>"/v1/Account/MAYMFHYZJKMJG0NJG4OG/Application/?limit=2&offset=2", 
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
                "resource_uri"=>"/v1/Account/MAYMFHYZJKMJG0NJG4OG/Application/31417932002017379/", 
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
                "resource_uri"=>"/v1/Account/MAYMFHYZJKMJG0NJG4OG/Application/16982793927977910/", 
                "sip_uri"=>"sip:16982793927977910@app.plivo.com", 
                "sub_account"=>nil
            }
        ]
    }
]
=end

# Print the total number of apps
#puts response[1]['meta']['total_count']

# Sample successful output
# 6

# Print public_uri, default_app, default_endpoint
# count = response[1]['meta']['total_count']
# puts "count: #{count}"
#for i in (0..count-1)
#    uri = response[1]['objects'][i]['public_uri']
#    app = response[1]['objects'][i]['default_app']
#    endpoint = response[1]['objects'][i]['default_endpoint_app']
#    puts "public_uri : #{uri}" 
#   puts "default_app : #{app}"
#    puts "default_endpoint_app : #{endpoint}"
#end

# Get details of a single application
params = {
        'app_id' => '31417932002017379' # ID of the application for which the details have to be retrieved
}

response = p.get_application(params)
# print response

=begin
Sample Output 
[200, 
    {
        "answer_method"=>"POST", 
        "answer_url"=>"http://example.com", 
        "api_id"=>"0bc977bc-af9d-11e4-96e3-22000abcb9af", 
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
        "resource_uri"=>"/v1/Account/MAYMFHYZJKMJG0NJG4OG/Application/31417932002017379/", 
        "sip_uri"=>"sip:31417932002017379@app.plivo.com", 
        "sub_account"=>nil
    }
]
=end

# Modify an application
params = {
        'app_id' => '31417932002017379', # ID of the application that has to be modified
        'answer_url' => 'http://exampletest.com' # Values that have to be updated
}

response = p.modify_application(params)
# print response

=begin
Sample Output 
[202, 
    {
        "api_id"=>"474a59aa-af9d-11e4-a2d1-22000ac5040c", 
        "message"=>"changed"
    }
]
=end

# Delete an application
params = {
        'app_id' => '31417932002017379' # ID of the application that as to be deleted
}

response = p.delete_application(params)
# print response

=begin
Sample Output 
[204, ""]
=end

