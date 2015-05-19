require 'sinatra'
require 'rubygems'
require 'plivo'
include Plivo
require 'uri'

get '/message/' do
    auth_token = "Your AUTH TOKEN"
    signature = request.env["HTTP_X_PLIVO_SIGNATURE"]
    url = request.url
    uri = (url.split("?"))[0]
    parse_uri = URI(url)

    params = Hash.new{[]}

    # GET
    query_params = parse_uri.query
    if query_params
        params = params.merge(Hash[*URI.decode_www_form(query_params).flatten])
    end

    # POST
    post_params = request.body.read
    puts post_params
    if post_params
        params = params.merge(Hash[*URI.decode_www_form(post_params).flatten])
    end
    # params = params + param    
    valid = XPlivoSignature.new(signature,uri,params,auth_token)
    puts valid.is_valid?()

    # The phone number of the person who sent the SMS
    from_number = params[:From]

    # Your Plivo number that will receive the SMS
    to_number = params[:To]

    # The text which was received on your Plivo number
    text = params[:Text]

    # Output the text which was received, you could
    # also store the text in a database.
    puts "Message received from #{from_number} : #{ text }"
end