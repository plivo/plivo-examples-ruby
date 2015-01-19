require 'sinatra'
require 'plivo'
include Plivo

post '/message/' do

	# The phone number of the person who sent the SMS
	from_number = params[:From]

	# Your Plivo number that will receive the SMS
	to_number = params[:To]

	# The text which was received on your Plivo number
	text = params[:Text]

	# Output the text which was received, you could
	# also store the text in a database.
	puts "Message received from #{from_number} : #{text}"

	r = Response.new()

	body = 'Thank you for your message'
    params = {
    'src' => to_number, # Sender's phone number
    'dst' => from_number, # Receiver's phone Number
    'callbackUrl' => 'https://enigmatic-cove-3140.herokuapp.com/report/', # URL that is notified by Plivo when a response is available and to which the response is sent
    'callbackMethod' => 'POST' # The method used to notify the callbackUrl
    }
	
	r.addMessage(body,params)
	puts r.to_xml()
	content_type 'text/xml'
	return r.to_s()
end


# Sample Output
# Message received from 2222222222 : Hello
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#	<Message callbackMethod='GET' callbackUrl='https://enigmatic-cove-3140.herokuapp.com/report/' dst='2222222222' src='1111111111'>Thank you for your message</Message>
# </Response>
