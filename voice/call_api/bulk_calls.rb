require 'rubygems'
require 'plivo'

include Plivo
include Plivo::Exceptions

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

begin
  response = api.calls.create(
    '+14151234567', # The phone number to be used as the caller id
    ['+14151112222<+14151113333'], # The phone number to which the call has to be placed separated by "<" delimiter
    'http://s3.amazonaws.com/static.plivo.com/answer.xml' # The URL invoked by Plivo when the outbound call is answered
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
    "request_uuid"=>["8180f5f2-848e-4055-916a-e30b2eba009e", "d14b7837-82e2-49ac-b046-192df114ac8d"]
}
=end