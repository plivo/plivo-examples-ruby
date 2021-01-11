require 'sinatra'
require 'rubygems'
require 'plivo'
include Plivo
include Plivo::XML

# GET request
get '/speak/' do
	auth_token = "Your_Auth_Token"
	signature = headers.fetch("X-Plivo-Signature-V3", "signature")
	nonce = headers.fetch("X-Plivo-Signature-V3-Nonce", "12345")
	url = request.url
	method = "GET"
	output = Plivo::Utils.valid_signatureV3?(url, nonce, signature, auth_token, method)
	puts output #signature validation output

	response = Response.new
	response.addSpeak("Hello, Welcome to Plivo")
	xml = PlivoXML.new(response)
	content_type 'text/xml'
	return xml.to_s
end

# POST request
post '/speak/' do
	auth_token = "your_auth_token"
	signature = headers.fetch("X-Plivo-Signature-V3", "signature")
	nonce = headers.fetch("X-Plivo-Signature-V3-Nonce", "12345")
	url = request.url
	method = "POST"
	output = Plivo::Utils.valid_signatureV3?(url, nonce, signature, auth_token, method, params)
	puts output #signature validation output

	response = Response.new
	response.addSpeak("Hello, Welcome to Plivo")
	xml = PlivoXML.new(response)
	content_type 'text/xml'
	return xml.to_s