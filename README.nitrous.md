# Nitrous Quickstart

This `nitrous.readme.md` file contains instructions on how to use the Nitrous [Quickstart](https://www.nitrous.io/quickstarts/) feature with this project.

Quickstarts allow you to create an out of the box development environment on Nitrous in just a few minutes; without having to perform the expected setup or configuration beforehand.

## How to Use

All that's required is a [Nitrous.io account](https://www.nitrous.io) and that your are signed in to this account with your web browser when you click the Quickstart trigger button below.

Click the button to begin the process once signed in:

[![Nitrous Quickstart](https://nitrous-image-icons.s3.amazonaws.com/quickstart.svg)](https://www.nitrous.io/quickstart?repo=https://github.com/twilio/starter-ruby)

> The Quick Start setup process will take several minutes to complete.

After the process completes you are redirected to your new development environnment on Nitrous.

Before you can run this project, you will need to set three system environment variables. These are:

* `TWILIO_ACCOUNT_SID` : Your Twilio "account SID" - it's like your username for the Twilio API.  This and the auth token (below) can be found [on your account dashboard](https://www.twilio.com/user/account).
* `TWILIO_AUTH_TOKEN` : Your Twilio "auth token" - it's your password for the Twilio API.  This and the account SID (above) can be found [on your account dashboard](https://www.twilio.com/user/account).
* `TWILIO_NUMBER` : A Twilio number that you own, that can be used for making calls and sending messages.  You can find a list of phone numbers you control (and buy another one, if necessary) [in the account portal](https://www.twilio.com/user/account/phone-numbers/incoming).

Environment Variables can be set in the terminal window by typing the following three commands - replace all the characters after the `=` with values from your Twilio account:

```bash
$ export TWILIO_ACCOUNT_SID=ACXXXXXXXXX
$ export TWILIO_AUTH_TOKEN=XXXXXXXXX
$ export TWILIO_NUMBER=+16518675309
```

To run the app on Nitrous:

1 - Click the ""Run starter-ruby App"" option from the "Run" tab to start the application.

![Nitrous Run Menu](http://i.imgur.com/MKvommW.png)

2 - Then click the "Preview" tab and "Port 3000".

![Nitrous Preview Menu](http://i.imgur.com/KQHm6qN.png)

Alternatively instead of the above, run the following commands in the terminal:

```bash
$ cd ~/workspace/starter-ruby
$ ./script/server
```

Then go to the "Preview" tab and click "Port 3000"
