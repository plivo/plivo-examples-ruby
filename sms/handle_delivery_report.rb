require "sinatra"

post "/delivery_report/" do
  # Sender's phone number
  from_number = params[:From]
  # Receiver's phone number - Plivo number
  to_number = params[:To]
  # The text which was received
  text = params[:Text]
  # Print the message
  puts "Message received - From: #{from_number}, To: #{to_number}, Text: #{text}, MessageUUID: #{uuid}"

  puts "Delivery status reported"
end

# Sample Output
# Message received - From : 1111111111, To : 2222222222, Text : Hello from Plivo, MessageUUID : 237ad222-9fbf-11e4-a77d-22000ae383ea

# Possible values for message status - "queued", "sent", "failed", "delivered", "undelivered" or "rejected"