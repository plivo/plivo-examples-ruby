require 'mail'
require 'sinatra'
require 'plivo'
include Plivo

post '/receive_message/' do

    # The phone number of the person who sent the SMS
    from_number = params[:From]

    # Your Plivo number that will receive the SMS
    to_number = params[:To]

    # The text which was received on your Plivo number
    text = params[:Text]

    # Output the text which was received, you could
    # also store the text in a database.
    puts "Message received from #{from_number} : #{text}"
    to_email(text)
    
end

def to_email(text)
    options = { 
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :user_name            => 'Your mail address',
        :password             => 'Your Password',
        :authentication       => 'plain',
        :enable_starttls_auto => true  
    }


    Mail.defaults do
        delivery_method :smtp, options
    end

    Mail.deliver do
        to 'To mail address'
        from 'From mail address'
        subject 'Testing sending using gmail'
        body text
    end
end

# Sample successful output
# Text received: Hello, from Plivo - From: 2222222222
