require 'sinatra'
require 'rubygems'
require 'plivo'
include Plivo
require 'uri'

get '/speak/' do
    auth_token = "Your AUTH_TOKEN"
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
    if post_params
        params = params.merge(Hash[*URI.decode_www_form(post_params).flatten])
    end
    # params = params + param    
    valid = XPlivoSignature.new(signature,uri,params,auth_token)
    puts valid.is_valid?()

    r = Response.new()
    r.addSpeak("Hello, Welcome to Plivo")

    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end