require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

# Load configuration from system environment variables - see the README for more
# on these variables.
TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']

set :bind, '0.0.0.0'
set :port, ENV['TWILIO_STARTER_RUBY_PORT'] || 4567

# Create an authenticated client to call Twilio's REST API
client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

# Sinatra route for your app's home page at "http://localhost:4567/" or your
# public web server
get '/' do
  erb :index
end

# Handle a form POST to send a message
post '/message' do
  # Use the REST API client to send a text message
  client.messages.create(
    :from => TWILIO_PHONE_NUMBER,
    :to => params[:to],
    :body => 'Good luck on your Twilio quest!'
  )

  # Send back a message indicating the text is inbound
  'Message on the way!'
end

# Handle a form POST to make a call
post '/call' do
  # Use the REST API client to make an outbound call
  client.calls.create(
    :from => TWILIO_PHONE_NUMBER,
    :to => params[:to],
    :url => 'http://demo.twilio.com/docs/voice.xml'
  )

  # Send back a text string with just a "hooray" message
  'Call is inbound!'
end

# Render a TwiML document that will say a message back to the user
get '/hello' do
  # Build a TwiML response
  response = Twilio::TwiML::VoiceResponse.new
  response.say(:message => 'Hello there! You have successfully configured a web hook.')
  response.say(:message => 'Good luck on your Twilio quest!', :voice => 'woman')

  # Render an XML (TwiML) document
  content_type 'text/xml'
  response.to_s
end
