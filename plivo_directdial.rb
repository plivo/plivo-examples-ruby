require 'rubygems'
require 'plivo'
require 'sinatra'

include Plivo

get '/dial' do
  to_number = params[:To]
  from_number = params[:CLID] ? params[:CLID] : params[:From] ? params[:From] : ''
  caller_name = params[:CallerName] ? params[:CallerName] : ''

  resp = Response.new()
  if not to_number
    resp.addHangup()
  else
    if to_number[0, 4] == "sip:"
      d = resp.addDial({'callerName' => caller_name})
      d.addUser(to_number)
    else
      d = resp.addDial({'callerId' => from_number})
      d.addNumber(to_number)
    end
  end
  content_type :xml 
  "text/xml"
  resp.to_xml()
end
