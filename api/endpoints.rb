require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Create an Endpoint
params = {
    'username' => 'Testing', # The username for the endpoint to be created
    'password' => 'TestingCity', # The password for your endpoint username
    'alias' => 'Sample address' # Alias for this endpoint
}

response = p.create_endpoint(params)
print response

=begin
Sample Output
[201, 
    {
        "alias"=>"Sample address", 
        "api_id"=>"f4d8cd14-af6f-11e4-96e3-22000abcb9af", 
        "endpoint_id"=>"32548855995201", 
        "message"=>"created", 
        "username"=>"Testing150208085331"
    }
]       
=end

# Get details of all existing endpoints
params = {
    'limit' => '2', # The number of results per page
    'offset' => '0' # The number of value items by which the results should be offset
}

response = p.get_endpoints(params)
print response

=begin
Sample Output
[200, 
    {
        "api_id"=>"4ddfdee8-af70-11e4-b153-22000abcaa64", 
        "meta"=>{
            "limit"=>2, 
            "next"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/?limit=2&offset=2", 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>3
        }, "objects"=>[
            {
                "alias"=>"Sample address", 
                "application"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Application/16982793927977910/", 
                "endpoint_id"=>"32548855995201", 
                "password"=>"7681fb638a6edc7c70a522f58659af10", 
                "resource_uri"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/32548855995201/", 
                "sip_registered"=>"false", 
                "sip_uri"=>"sip:Testing150208085331@phone.plivo.com", 
                "sub_account"=>nil, 
                "username"=>"Testing150208085331"
            }, {
                "alias"=>"TestSample", 
                "application"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Application/16632742496743552/", 
                "endpoint_id"=>"24753112937214", 
                "password"=>"147538da338b770b61e592afc92b1ee6", 
                "resource_uri"=>"/v1/Account/xxxxxxxxxxxxxxxxx/Endpoint/24753112937214/", 
                "sip_registered"=>"false", 
                "sip_uri"=>"sip:test150108095716@phone.plivo.com", 
                "sub_account"=>nil, 
                "username"=>"test150108095716"
            }
        ]
    }
]
=end

# Print the total number of apps
print response[1]['meta']['total_count']

# Sample successful output
# 3

# Get details of a single endpoint
params = {
        'endpoint_id'=> '32548855995201' # ID of the endpoint for which the details have to be retrieved
}

response = p.get_endpoint(params)
print response

=begin
Sample Output
[200, 
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
]
=end

# Modify an endpoint
params = {
        'endpoint_id' => '32548855995201', # ID of the endpoint that has to be modified
        'alias' => 'New_test' # Values that have to be updated
}

response = p.modify_endpoint(params)
print response

=begin
Sample Output
[202, 
    {
        "api_id"=>"1e0bceec-af71-11e4-b423-22000ac8a2f8", 
        "message"=>"changed"
    }
]
=end

# Delete an endpoint
params = {
        'endpoint_id' => '32548855995201' # ID of the endpoint that as to be deleted
}

response = p.delete_endpoint(params)
print response

=begin
Sample Output
[204, ""]
=end


