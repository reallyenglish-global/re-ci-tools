#!/bin/sh

# Use curl to send an email via an SMTP-to-API service like SendGrid
curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{
    "personalizations": [{"to": [{"email": "'"$TO_EMAIL"'"}]}],
    "from": {"email": "'"$FROM_EMAIL"'"},
    "subject": "Kubernetes Release Notification",
    "content": [{
      "type": "text/plain", 
      "value": "A new Kubernetes release has been deployed: '"$RELEASE_INFO"'"
    }]
  }'