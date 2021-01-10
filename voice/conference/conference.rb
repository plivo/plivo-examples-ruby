require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
  response = api.calls.create(
    '+14151234567', # The phone number to be used as the caller id
    ['+14151112222'], # The phone number to which the call has to be placed.
    'https://s3.amazonaws.com/plivosamplexml/conference_url.xml' # The URL invoked by Plivo when the outbound call is answered
  )
  puts response
rescue PlivoRESTError => e
  puts 'Exception: ' + e.message
end

=begin
Sample Output
{
    "api_id"=>"b7248e74-5338-11eb-b110-0242ac110008", 
    "message"=>"calls fired", 
    "request_uuid"=>["8180f5f2-848e-4055-916a-e30b2eba009e"]
}
=end

# XML returned by the answer_url
# <Response>
#     <Conference>Sample_Room</Conference>
# </Response>