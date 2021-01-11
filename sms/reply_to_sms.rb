require "plivo"
require "sinatra"

include Plivo
include Plivo::XML

get "/reply_sms/" do
  # Sender's phone number
  from_number = params[:From]
  # Receiver's phone number - Plivo number
  to_number = params[:To]
  # The text which was received
  text = params[:Text]

  # Print the message
  puts "Message received - From: #{from_number}, To: #{to_number}, Text: #{text}"

  # send the details to generate an XML
  response = Response.new
  params = {
    src: to_number,  # Sender's phone number
    dst: from_number, # Receiver's phone Number
    type: "sms",
    callbackUrl: "https://www.foo.com/sms_status",
    callbackMethod: "POST",
  }

  message_body = "Thank you, we have received your request"
  response.addMessage(message_body, params)
  xml = PlivoXML.new(response)

  puts xml.to_xml() # Prints the XML
  content_type "application/xml"
  return xml.to_s() # Returns the XML
end

# Sample Output
# Message received - From: 111111111, To: 222222222, Text: Hey Plivo, Please send my message.
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#	<Message callbackMethod='POST' callbackUrl='https://www.foo.com/sms_status' dst='2222222222' src='1111111111'>Thank you, we have received your request</Message>
# </Response>
