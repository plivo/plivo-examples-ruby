require 'rubygems'
require 'plivo'
include Plivo

# Dial XML
dial_callerId = '1XXXXXXXX'
dial_number = '120XXXXX'
r = Response.new()
d = r.addDial({'callerId' => dial_callerId})
d.addNumber(dial_number)
puts r.to_xml()

# Output:
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#   <Dial callerId='1XXXXXXXX'>
#     <Number>120XXXXX</Number>
#   </Dial>
# </Response>


# Speak XML

r = Response.new()
r.addWait({'length' => 2 })
r.addSpeak('Hi')
puts r.to_xml()

# Output:
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#   <Wait length='2'/>
#   <Speak>Hi</Speak>
# </Response>


# Play XML
play_url = 'http://example.com/bonjo.mp3'
play_loop = '2'

r = Response.new()
r.addPlay(play_url, {'loop' => play_loop})
puts r.to_xml()

# Output:
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#   <Play loop='2'>http://example.com/bonjo.mp3</Play>
# </Response>


# GetDigits XML
receive_url = 'http://example.com/receivedigits'

r = Response.new()
d = r.addGetDigits({'action' => receive_url, 'method' => 'GET'})
d.addSpeak('Press one for English, press two for Spanish')
r.addSpeak('No input received. Good bye')
puts r.to_xml()

# Output:
# <?xml version="1.0" encoding="utf-8" ?>
# <Response>
#   <GetDigits action='http://example.com/receivedigits' method='GET'>
#     <Speak>Press one for English, press two for Spanish</Speak>
#   </GetDigits>
#   <Speak>No input received. Good bye</Speak>
# </Response>
