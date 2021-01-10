require "plivo"
include Plivo

api = RestClient.new("YOUR_AUTH_ID", "YOUR_AUTH_TOKEN")

# SMS containing more than 160 standard characters, is automatically split as a long SMS.
# SMS containing more than 70 Unicode characters, is automatically split as a long SMS.
# Information about split SMSes are sent to the url and are also reported in the Message Logs in the Account Dashboard.

response = api.messages.create(
  '+15671234567', # Sender 's phone number with country code ["+14151112222"], # Receiver 's phone Number with country code
  "Hello, this is a sample text", # Your SMS Text Message - English 
  # "このランダムに生成されたテキストは、自由のためのあなたのレイアウト（ウェブデザイン、ウェブサイト、書籍、ポスター...）で使用することができます。このテキストは、法律の完全に無料です。下の画像を使用して、または単純なテキストリンクを作ることで、このサイトへのリンクフリーです"- Your SMS Text Message - Japanese
  # "Ce texte généré aléatoirement peut-être utilisé dans vos maquettes (webdesign, sites internet,livres, affiches...) gratuitement. Ce texte est entièrement libre de droit. N'hésitez pas à faire un lien sur ce site en utilisant l'image ci-dessous ou en faisant un simple lien texte" - Your SMS Text Message - French 
  {
    url: "http://foo.com/sms_status/", # The URL to which with the status of the message is sent
    method: 'POST' # The method used to call the url
  },
)
puts response

# Sample Output
# {
# "api_id" => "948dc17e-529a-11eb-a4f5-0242ac110006",
# "message" => "message(s) queued",
# "message_uuid" => ["948effc6-529a-11eb-a4f5-0242ac110006"],
#}

response = api.messages.get(response.message_uuid)

print "You SMS was split into #{response.units} units"

# Output
for Japanese
# Your SMS was split into 3 units

# Output
for English
# Your SMS was split into 2 units

# Output
for French
# Your SMS was split into 5 units