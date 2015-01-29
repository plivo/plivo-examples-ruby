# encoding: utf-8
require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# SMS containing more than 160 standard characters, is automatically split as a long SMS.  
# SMS containing more than 70 Unicode characters, is automatically split as a long SMS.
# Information about split SMSes are sent to the url and are also reported in the Message Logs in the Account Dashboard. 

# Send SMS
params = {
	'src' => '1111111111', # Sender's phone number with country code
	'dst' => '2222222222', # Receiver's phone Number with country code
	'text' => 'This randomly generated text can be used in your layout (webdesign , websites, books, posters ... ) for free. This text is entirely free of law. Feel free to link to this site by using the image below or by making a simple text link' 
	# Your SMS Text Message - English
#	'text' : u"Ce texte généré aléatoirement peut-être utilisé dans vos maquettes (webdesign, sites internet,livres, affiches...) gratuitement. Ce texte est entièrement libre de droit. N'hésitez pas à faire un lien sur ce site en utilisant l'image ci-dessous ou en faisant un simple lien texte", 
	# Your SMS Text Message - French
#	'text' : u"このランダムに生成されたテキストは、自由のためのあなたのレイアウト（ウェブデザイン、ウェブサイト、書籍、ポスター...）で使用することができます。このテキストは、法律の完全に無料です。下の画像を使用して、または単純なテキストリンクを作ることで、このサイトへのリンクフリーです",
    # Long text in Japanese	
	}

response = p.send_message(params)
print response

# Sample Output
# [202, {
#		"api_id"=>"8d982c40-9fa6-11e4-a2d1-22000ac5040c", 
#		"message"=>"message(s) queued", 
#		"message_uuid"=>["8daae286-9fa6-11e4-a77d-22000ae383ea"]
#	}
# ]

uuid = response[1]['message_uuid'][0]

params1 = {
    'record_id' => uuid
}

response = p.get_message(params1)

print "You SMS was split into #{response[1]['units']} units"

# Output for Japanese
# Your SMS was split into 3 units

# Output for English
# Your SMS was split into 2 units

# Output for French
# Your SMS was split into 5 units
