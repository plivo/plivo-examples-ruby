require 'mail'
require 'sinatra'
require 'plivo'
include Plivo

post '/email_sms/' do
    # The phone number of the person who sent the SMS
    from_number = params[:From]
    # Your Plivo number that will receive the SMS
    to_number = params[:To]
    # The text which was received on your Plivo number
    text = params[:Text]

    # Print the message
    puts "Message received from #{from_number}: #{text}"
    to_email(text, from_number)
end

def to_email(text, from_number)
    options = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :user_name            => 'Your email address',
        :password             => 'Your password',
        :authentication       => 'plain',
        :enable_starttls_auto => true
    }

    Mail.defaults do
        delivery_method :smtp, options
    end

    Mail.deliver do
        to 'To email address'
        from 'From email address'
        subject 'SMS from #{from_number}'
        body text
    end
end
        
# Sample successful output
# Text received: Hello, from Plivo - From: 2222222222
