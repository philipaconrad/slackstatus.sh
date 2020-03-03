#!/bin/bash
# Copyright (c) Philip Conrad, 2020. All rights reserved.
# Released under the MIT License.

# Obtained from api.slack.com on the "OAuth & Permissions" page.
# You will need an OAuth token with the `users.profile:write` permission.
slack_token="YourOAuthTokenGoesHere"

# Read in command line arguments and build JSON payload.
status_text=$1
status_emoji=$2
status_expiration=${3:-0}
json_payload="{\"profile\": {\"status_text\": \"$status_text\", \"status_emoji\": \"$status_emoji\", \"status_expiration\": $status_expiration}}"
printf "$json_payload\n"

curl https://slack.com/api/users.profile.set \
  -H "Content-Type: application/json; charset=utf-8" \
  -H "Authorization: Bearer $slack_token" \
  --data "$json_payload"

printf "\n"
