require 'rubygems'
require 'sinatra/base'
require 'rack-flash'
require 'twilio-ruby'

# We're going to create a class which is a Sinatra web app.  More documentation
# on how to use Sinatra is found here: http://www.sinatrarb.com/
class MyApp < Sinatra::Base
  enable :sessions
  use Rack::Flash

  # Configure this application with your Twilio account credentials
  # NOTE: It is best to store these values in environment variables in a
  # production application, not in source code.
  #
  # You can find these values for your account (requires login) by visiting:
  # https://www.twilio.com/user/account
  #
  # Your account SID is like your Twilio API user name - it will look something
  # like "ACblahblahblahblahblahblahblahblah"
  @@TWILIO_ACCOUNT_SID = 'CHANGE_ME'

  # Your auth token is like your Twilio API password - it will be a long
  # string of random characters
  @@TWILIO_AUTH_TOKEN = 'CHANGE_ME'

  # Your Twilio number should be a valid phone number.  Twilio will parse any
  # US phone number in a variety of formats, but for the sake of consistency,
  # we use the format below (plus sign, country code, area code, then number).
  #
  # To see a list of your account's phone numbers, visit this page:
  # https://www.twilio.com/user/account/phone-numbers/incoming
  #
  @@TWILIO_NUMBER = '+16518889999' ## << change to your Twilio number

  # Create an authenticated client to call Twilio's REST API
  @@client = Twilio::REST::Client.new @@TWILIO_ACCOUNT_SID, @@TWILIO_AUTH_TOKEN

  # Sinatra route for your app's home page at "http://yourserver.com/"
  get '/' do
    # If there was a message stored from a previous request to "/message" or
    # "/call", it will be stored in a variable called "message" when rendering
    # index.erb
    erb :index, {
      :locals => {
        :message => flash[:message]
      }
    }
  end

  # Handle a form POST to send a message
  post '/message' do

    # Use the REST API client to send a text message
    @@client.account.sms.messages.create(
      :from => @@TWILIO_NUMBER, # This is the number you configured at the 
                                # top of this file

      :to => params[:to], # This is the phone number you're sending a text
                          # message to, probably your mobile phone number.

      :body => 'Good luck on your Twilio quest!' # This is the actual message
    )

    # Render the home page again, with an informative message
    flash[:message] = 'Text message sent!'
    redirect '/'
  end

  # Handle a form POST to make a call
  post '/call' do
    # Use the REST API client to make an outbound call
    @@client.account.calls.create(
      :from => @@TWILIO_NUMBER,
      :to => params[:to],
      :url => 'http://twimlets.com/message?Message%5B0%5D=Good%20luck%20on%20your%20Twilio%20Quest!'
    )

    # Render the home page again, with an informative message
    flash[:message] = 'Call inbound!'
    redirect '/'
  end

  # Render a TwiML document that will say a message back to the user
  get '/hello' do
    # Build a TwiML response
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello there! You have successfully configured a web hook.'
      r.Say 'Good luck on your Twilio quest!', :voice => 'woman'
    end

    # Render an XML (TwiML) document
    content_type 'text/xml'
    response.text
  end

  # start the server
  run! if app_file == $0
end
