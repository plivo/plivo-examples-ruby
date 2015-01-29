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
	puts "Message received from #{from_number} : #{ text }"

	"Message received"
end

# Sample successful output
# Text received: Hello, from Plivo - From: 2222222222