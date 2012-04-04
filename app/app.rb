require 'sinatra'
require 'plivo'

base_url = ''
AUTH_ID = ""
AUTH_TOKEN = ""

get '/' do
    'Welcome to plivo'
end


post '/call/' do
    to_number = params[:to]
    from_number = params[:from]
    answer_url = params[:answer_url]

    p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

    call_params = {'to' => to_number,
                    'from' => from_number,
                    'answer_url' => answer_url,
                    'answer_method' => 'GET'
    }

    response = p.make_call(call_params)

    'Call has been fired'
end

get '/dialxml/' do
    dial_callerId = ''
    dial_number = ''
    r = Response.new()

    d = r.addDial({'callerId' => dial_callerId})
    d.addNumber(dial_number)

    content_type 'text/xml'
    r.to_xml()
end


get '/playxml/' do
    play_url = ''
    play_loop = ''

    r = Response.new()

    r.addPlay(play_url, {'loop' => play_loop})

    content_type 'text/xml'
    r.to_xml()
end

get '/speakxml/' do
    r = Response.new()

    r.addWait({'length' => 2 })
    r.addSpeak('Hi')

    content_type 'text/xml'
    r.to_xml()
end


get '/recordxml/' do
    record_url = ''

    r = Response.new()

    r.addSpeak('Leave a message after the beep')
    r.addRecord({'action' => record_url,
                'maxLength' => 30,
                'playBeep' => true})

    content_type 'text/xml'
    r.to_xml()
end
