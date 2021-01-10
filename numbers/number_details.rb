require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
	response = api.numbers.list(
		limit: 5, # Used to display the number of results per page.
		offset: 0 # Denotes the number of value items by which the results should be offset. 
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
        "api_id"=>"a1547c4c-b677-11e4-9107-22000afaaa90", 
        "meta"=>{
            "limit"=>10, 
            "next"=>nil, 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>2
        }, "objects"=>[
            {
                "active"=>true, 
                "added_on"=>"2014-10-28", 
                "alias"=>"", 
                "application"=>"/v1/Account/XXXXXXXXXXXX/Application/26469261154421101/", 
                "carrier"=>"Plivo", 
                "monthly_rental_rate"=>"0.80000", 
                "number"=>"1111111111", 
                "number_type"=>"local", 
                "region"=>"California, UNITED STATES", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Number/1111111111/", 
                "sms_enabled"=>true, 
                "sms_rate"=>"0.00000", 
                "sub_account"=>nil, 
                "type"=>"local", 
                "voice_enabled"=>true, 
                "voice_rate"=>"0.00850"
            }, {
                "active"=>true, 
                "added_on"=>"2014-12-04", 
                "alias"=>"", 
                "application"=>"/v1/Account/XXXXXXXXXXXX/Application/21935628481970026/", 
                "carrier"=>"Plivo", 
                "monthly_rental_rate"=>"0.80000", 
                "number"=>"2222222222", 
                "number_type"=>"local", 
                "region"=>"UNITED KINGDOM", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Number/2222222222/", 
                "sms_enabled"=>true,
                "sms_rate"=>"0.00000", 
                "sub_account"=>nil, 
                "type"=>"local", 
                "voice_enabled"=>true, 
                "voice_rate"=>"0.00500"
            }
        ]
}
=end

# Get a particular number
begin
	response = api.numbers.get(
		'17609915566' # Phone number for which the details have to be retrieved
	)
	puts response
rescue PlivoRESTError => e
	puts 'Exception: ' + e.message
end

=begin
Sample Output
{
        "active"=>true, 
        "added_on"=>"2014-12-04", 
        "alias"=>"", 
        "api_id"=>"06615a7e-b678-11e4-9107-22000afaaa90", 
        "application"=>"/v1/Account/XXXXXXXXXXXX/Application/21935628481970026/", 
        "carrier"=>"Plivo", 
        "monthly_rental_rate"=>"0.80000", 
        "number"=>"17609915566", 
        "number_type"=>"local", 
        "region"=>"UNITED KINGDOM", 
        "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/Number/17609915566/", 
        "sms_enabled"=>true, 
        "sms_rate"=>"0.00000", 
        "sub_account"=>nil, 
        "type"=>"local", 
        "voice_enabled"=>true, 
        "voice_rate"=>"0.00500"
    }
=end