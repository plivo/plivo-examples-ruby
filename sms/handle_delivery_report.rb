require 'sinatra'
require 'plivo'
include Plivo

post '/report/' do

	# Sender's phone number
	from_number = params[:To]

	# Receiver's phone number - Plivo n
	to_number = params[:From]

	# The status of the message
	status = params[:Status]

	# Message uuid
	uuid = params[:MessageUUID]
	
	# Print the status of the message
	puts "From : #{from_number}, To : #{to_number}, Status : #{status}, MessageUUID : #{uuid}"

	return "Delivery status reported"
end

# Sample Output
# From : 1111111111, To : 2222222222, Status : sent, MessageUUID : 237ad222-9fbf-11e4-a77d-22000ae383ea

# Possible values for message status - "queued", "sent", "failed", "delivered", "undelivered" or "rejected"