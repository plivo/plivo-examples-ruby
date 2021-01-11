require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
  response = api.calls.list_live()
  puts response
rescue PlivoRESTError => e
  puts 'Exception: ' + e.message
end

=begin
Sample Output    
[200, 
    {
        "api_id"=>"c38b4e42-b03e-11e4-b153-22000abcaa64", 
        "calls"=>["c19c370e-b03e-11e4-97b6-f5504e456438"]
    }
]    
=end

# Looping through the call uuids

for uuid in response.calls
    print uuid
end

=begin
Sample Output    
c19c370e-b03e-11e4-97b6-f5504e456438
=end