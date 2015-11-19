require 'sinatra'
require 'rubygems'
require 'plivo'
include Plivo
require 'uri'

auth_token = "Your_Auth_Token"

get '/message/' do
    signature = request.env["HTTP_X_PLIVO_SIGNATURE"]
    uri = (request.url.split("?"))[0]
    params = Hash.new{[]}

    parse_uri = URI(request.url)
    query_params = parse_uri.query
    if query_params
        params = params.merge(Hash[*URI.decode_www_form(query_params).flatten])
    end

    message_signature = XPlivoSignature.new(signature,uri,params,auth_token)
    puts "Valid Signature: #{message_signature.is_valid?()}"

    # The phone number of the person who sent the SMS
    from_number = params["From"]

    # Your Plivo number that will receive the SMS
    to_number = params["To"]

    # The text which was received on your Plivo number
    text = params["Text"]

    # Output the text which was received, you could also store the text in a database.
    puts "Message received - from: #{from_number}, to: #{to_number}, text: #{text}"
end

post '/message/' do
    signature = request.env["HTTP_X_PLIVO_SIGNATURE"]
    uri = request.url
    params = Hash.new{[]}

    post_params = request.body.read
    puts post_params
    if post_params
        params = params.merge(Hash[*URI.decode_www_form(post_params).flatten])
    end

    message_signature = XPlivoSignature.new(signature,uri,params,auth_token)
    puts "Valid Signature: #{message_signature.is_valid?()}"

    # The phone number of the person who sent the SMS
    from_number = params["From"]

    # Your Plivo number that will receive the SMS
    to_number = params["To"]

    # The text which was received on your Plivo number
    text = params["Text"]

    # Output the text which was received, you could also store the text in a database.
    puts "Message received - from: #{from_number}, to: #{to_number}, text: #{text}"
end
