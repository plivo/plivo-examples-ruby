require 'rubygems'
require 'sinatra'
require 'plivo'
include Plivo

# This file will be played when a caller presses 2.
$plivo_song = "https://s3.amazonaws.com/plivocloud/music.mp3"
# This is the message that Plivo reads when the caller dials in
$ivr_message1 = "Welcome to the Plivo IVR Demo App. Press 1 to listen to a pre recorded text in different languages. Press 2 to listen to a song."

$ivr_message2 = "Press 1 for English. Press 2 for French. Press 3 for Russian"
# This is the message that Plivo reads when the caller does nothing at all
$noinput_message = "Sorry, I did not catch that. Please hangup and try again later."

# This is the message that Plivo reads when the caller inputs a wrong number.
$wronginput_message = "Sorry, it's wrong input."

get '/response/ivr' do

    r = Response.new()

    getinput_action_url = "https://example.com/ivr/firstbranch/"
    params = {
        action: getinput_action_url, 
        method: 'POST', 
        digitEndTimeout: '5',
        inputType:'dtmf',
        redirect:'true'
    }
    getinput = r.addGetInput(params)
    getinput.addSpeak($ivr_message1)
    r.addSpeak($noinput_message)

    xml = PlivoXML.new(r)
    render xml: xml.to_xml
  end
  def firstbranch
    digit = params[:Digits]
    r = Response.new()
    
    if (digit == "1")
        getinput_action_url = "https://example.com/ivr/secondbranch/"
        params = {
            action: getinput_action_url, 
            method: 'POST', 
            digitEndTimeout: '5',
            inputType:'dtmf',
            redirect:'true'
        }
        getinput = r.addGetInput(params)
        getinput.addSpeak($ivr_message2)
        r.addSpeak($noinput_message)

    elsif (digit == "2")
        r.addPlay($plivo_song)
    else
        r.addSpeak($wronginput_message)
    end

    xml = PlivoXML.new(r)
    render xml: xml.to_xml
  end
  def secondbranch
    digit = params[:Digits]

    r = Response.new()

    if (digit == "1")
        body = "This message is being read out in English"
        params = {
            'language'=> "en-GB"
        }

        r.addSpeak(body,params)
    elsif (digit == "2")
        body = "Ce message est lu en français"
        params = {
            'language'=> "fr-FR"
        }

        r.addSpeak(body,params)
    elsif (digit == "3")
        body = "Это сообщение было прочитано в России"
        params = {
            'language'=> "ru-RU"
        }

        r.addSpeak(body,params)
    else
        r.addSpeak($wronginput_message)
    end

    xml = PlivoXML.new(r)
    render xml: xml.to_xml
  end
end

=begin
Sample Output
<Response>
    <GetDigits action="https://enigmatic-cove-3140.herokuapp.com/response/ivr" method="POST" numDigits="1" retries="1" timeout="7">
        <Speak>
            Welcome to the Plivo IVR Demo App. Press 1 to listen to a pre recorded text in different languages. Press 2 to listen to a song.
        </Speak>
    </GetDigits>
        <Speak>
            Sorry, I didn&#39;t catch that. Please hangup and try again later.
        </Speak>
</Response>  

If 1 is pressed, another menu is read out. Following is the generated Speak XML.
<Response>
     <GetDigits action="http://morning-ocean-4669.herokuapp.com/response/tree/" method="POST" numDigits="1" retries="1" timeout="7">
        <Speak>Press 1 for English. Press 2 for French. Press 3 for Russian</Speak>
    </GetDigits>
   <Speak>Sorry, I didn't catch that. Please hangup and try again later.</Speak>
</Response>

If 1 is pressed, the English text is read out. Following is the generated Speak XML.
<Response>
    <Speak language="en-GB">This message is being read out in English</Speak>
</Response>

If 2 is pressed, the French text is read out. Following is the generated Speak XML.
<Response>
    <Speak language="fr-FR">Ce message est lu en fran&amp;#231;ais</Speak>
</Response>

If 3 is pressed, the Russian text is read out. Following is the generated Speak XML.
<Response>
    <Speak language="ru-RU">&amp;#1069;&amp;#1090;&amp;#1086; &amp;#1089;&amp;#1086;&amp;#1086;&amp;#1073;&amp;#1097;&amp;#1077;&amp;#1085;&amp;#1080;&amp;#1077; 
        &amp;#1073;&amp;#1099;&amp;#1083;&amp;#1086; &amp;#1087;&amp;#1088;&amp;#1086;&amp;#1095;&amp;#1080;&amp;#1090;&amp;#1072;&amp;#1085;&amp;#1086; &amp;#1074; 
        &amp;#1056;&amp;#1086;&amp;#1089;&amp;#1089;&amp;#1080;&amp;#1080;
    </Speak>
</Response>

If 2 is pressed, a music is played. Following is the generated Play XML.
<Response>
    <Play>https://s3.amazonaws.com/plivocloud/music.mp3</Play>
</Response> 

    
=end






