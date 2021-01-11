require "sinatra"

post "/receive_sms/" do
  # Sender's phone number
  from_number = params[:From]
  # Receiver's phone number - Plivo number
  to_number = params[:To]
  # The text which was received
  text = params[:Text]
  # Print the message
  puts "Message received - From: #{from_number}, To: #{to_number}, Text: #{text}"
end

# Sample successful output
# Message received -  From: 111111111, To: 22222222222, Text: Hello, from Plivo.