require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
	response = api.calls.list(
		limit: 5,
		offset: 0
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
    {
        "api_id"=>"b3181b50-b03c-11e4-b423-22000ac8a2f8", 
        "meta"=>{
            "limit"=>20, 
            "next"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/?limit=20&offset=20", 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>101
        }, "objects"=>[
            {
                "bill_duration"=>47, 
                "billed_duration"=>60, 
                "call_direction"=>"outbound", 
                "call_duration"=>47, 
                "call_uuid"=>"8b9ffd64-af6e-11e4-8789-377ffe01233f", 
                "end_time"=>"2015-02-08 14:14:20+05:30", 
                "from_number"=>"+1111111111", 
                "parent_call_uuid"=>nil, 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/8b9ffd64-af6e-11e4-8789-377ffe01233f/", 
                "to_number"=>"2222222222", 
                "total_amount"=>"0.03570", 
                "total_rate"=>"0.03570"
            }, {
                "bill_duration"=>41, 
                "billed_duration"=>60, 
                "call_direction"=>"outbound", 
                "call_duration"=>41, 
                "call_uuid"=>"8bd540aa-af6e-11e4-87a9-377ffe01233f", 
                "end_time"=>"2015-02-08 14:14:19+05:30", 
                "from_number"=>"+1111111111", 
                "parent_call_uuid"=>nil, 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/8bd540aa-af6e-11e4-87a9-377ffe01233f/", 
                "to_number"=>"919176616491", 
                "total_amount"=>"0.03570", 
                "total_rate"=>"0.03570"
            }
        ]
    }
=end

# Filtering the records

begin
	response = api.calls.list(
		limit: 2, # The number of results per page
		offset: 0, # The number of value items by which the results should be offset
		to_number:'2222222222', # Filter the results by the number to which the call was made
		from_number:'1111111111', # Filter the results by the number from where the call originated
		call_direction:'outbound' # Filter the results by call direction. The valid inputs are inbound and outbound
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
        "api_id"=>"34b5e87c-b03d-11e4-b423-22000ac8a2f8", 
        "meta"=>{
            "limit"=>2, 
            "next"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/?call_direction=outbound&to_number=2222222222&end_time__gt=2015-01-29+11%3A47&from_number=1111111111&limit=2&offset=2", 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>10
        }, "objects"=>[
            {
                "bill_duration"=>0, 
                "billed_duration"=>0, 
                "call_direction"=>"outbound", 
                "call_duration"=>0, 
                "call_uuid"=>"c0222436-b03b-11e4-a50a-377ffe01233f", 
                "end_time"=>"2015-02-09 14:42:51+05:30", 
                "from_number"=>"+1111111111", 
                "parent_call_uuid"=>nil, 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/c0222436-b03b-11e4-a50a-377ffe01233f/", 
                "to_number"=>"2222222222", 
                "total_amount"=>"0.00000", 
                "total_rate"=>"0.03570"
            }, {
                "bill_duration"=>0, 
                "billed_duration"=>0, 
                "call_direction"=>"outbound", 
                "call_duration"=>0, 
                "call_uuid"=>"707146ec-b03b-11e4-8bc9-c73b3246dc2a", 
                "end_time"=>"2015-02-09 14:40:51+05:30", 
                "from_number"=>"+1111111111", 
                "parent_call_uuid"=>nil, 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXXXXX/Call/707146ec-b03b-11e4-8bc9-c73b3246dc2a/", 
                "to_number"=>"2222222222", 
                "total_amount"=>"0.00000", 
                "total_rate"=>"0.03570"
            }
        ]
    }
=end