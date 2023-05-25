#!/usr/bin/env bash

json=$(aws-okta login --mfa-factor-type=push --mfa-provider=OKTA --json "okta-$1")

export AWS_ACCESS_KEY_ID=$(echo "$json" | jq -r .AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo "$json" | jq -r .SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo "$json" | jq -r .SessionToken)
