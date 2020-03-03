slackstatus.sh
--------------

This repo contains a Bash script that allows you to update your Slack status from the command line easily.

## Setup

 1. You will need to create a Slack App in order to get an OAuth token.
    Check out [api.slack.com](https://api.slack.com/) to get started.
 2. Once you have created a Slack App, you will need to give it the `users.profile:write` permission. This allows anything using that OAuth token to modify your profile and status.
 3. Copy the OAuth token into the `slackstatus.sh` script, where you see `slack_token="YourOAuthTokenGoesHere"`
 4. Have fun updating your status!

## Usage

The script takes 3 arguments in sequence:

    ./slackstatus.sh STATUS_TEXT STATUS_EMOJI EXPIRATION_TIME

All of the positional parameters are optional.
Providing no parameters will remove all active status indicators.

You can use raw unicode emojis, or the `:emojiname:` syntax provided by Slack.

Examples:

    ./slackstatus.sh "slackstatus works!" ":fireworks:"

This will set the status line to look like: "🎆 slackstatus works!"
The status will be set without an expiration.

    ./slackstatus.sh "Working in the lab" ":office:" `date --date='TZ="America/New_York" 5:00 pm today' +%s`

This will set the status line to look like: "🏢 Working in the lab"
The status will expire at EST 5:00 PM on the day you run the command.

You can also provide manual Unix timestamps and raw emojis, like the following:

    ./slackstatus.sh "Burning down the servers" "🔥" 1583125200

This will set the status line to look like: "🔥 Burning down the servers", and will expire at 12:00 AM, UTC on 2020-03-02 (the time value encoded in the Unix timestamp).

## License

This project is released under the terms of the MIT License.

See the LICENSE file for the full license text.
