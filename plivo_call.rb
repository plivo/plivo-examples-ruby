require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)


# Making a call
params = {'to' => '121212121212', 
           'from' => '12121212121212', 
           'answer_url' => 'http://example.com/AnswerUrl',
           'answer_method' => 'GET',
           'hangup_url' => 'http://example.com/HangupUrl',
        }
response = p.make_call(params)
print response


