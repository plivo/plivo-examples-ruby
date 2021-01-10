require 'sinatra'
require 'plivo'
require 'rubygems'

include Plivo::XML
include Plivo::Exceptions

get '/text_to_speech' do
    content_type 'text/xml'
    begin
        response = Response.new
      
        # English Text
        speak_body_1 = 'This is English!'
        params = {
          language: 'en-GB',
          voice:'MAN'
        }
        response.addSpeak(speak_body_1, params)

        # French Text
        speak_body_2 = 'Ce texte généré aléatoirement peut-être utilisé dans vos maquettes'
        params = {
            language: 'fr-FR',
            voice:'MAN'
        }
        response.addSpeak(speak_body_2, params)

        #Russian Text
        speak_body_3 = 'Это случайно сгенерированный текст может быть использован в макете'
        params = {
            language: 'ru-RU',
            voice:'MAN'
        }
        response.addSpeak(speak_body_3, params)
      
        xml = PlivoXML.new(response)
        return xml.to_xml
      rescue PlivoXMLError => e
        puts 'Exception: ' + e.message
      end
end


=begin
Sample Output
<Response>
    <Speak language="en-GB" voice="MAN">This is English!</Speak>
    <Speak language="fr-FR" voice="MAN">Ce texte généré aléatoirement peut-être utilisé dans vos maquettes</Speak>
    <Speak language="ru-RU" voice="MAN">Это случайно сгенерированный текст может быть использован в макете</Speak>
</Response>
=end