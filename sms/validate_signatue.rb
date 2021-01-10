require 'sinatra'
require 'rubygems'
require 'plivo'
include Plivo
require 'uri'

get '/receive_sms/' do
    auth_token = "Your_Auth_Token"
    signature = request.env["HTTP_X_PLIVO_SIGNATURE_V2"]
    nonce = request.env["HTTP_X_PLIVO_SIGNATURE_V2_NONCE"]
    url = request.url
    uri = (url.split("?"))[0]
    
    output = Plivo::Utils.valid_signature?(uri,nonce,signature,auth_token)
    puts output

    from_number = params[:From]# The phone number of the person who sent the SMS
    to_number = params[:To]# Your Plivo number that will receive the SMS
    text = params[:Text]# The text which was received on your Plivo number

    puts "Message received from #{from_number} : #{ text }"
end