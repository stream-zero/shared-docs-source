## Webex Teams Notifications
* **Source**: https://teams.webex.com
* **Icon Support**: No
* **Message Format**: Markdown
* **Message Limit**: 1000 Characters per message

### Account Setup
To use this plugin, you need to first access https://teams.webex.com and make yourself an account if you don't already have one. You'll want to create at least one 'space' before getting the 'incoming webhook'.

Next you'll need to install the 'Incoming webhook' plugin found under the 'other' category here: https://apphub.webex.com/integrations/

These links may not always work as time goes by and websites always change, but at the time of creating this plugin [this was a direct link to it](https://apphub.webex.com/integrations/incoming-webhooks-cisco-systems).

If you're logged in, you'll be able to click on the 'Connect' button. From there you'll need to accept the permissions it will ask of you. Give the webhook a name such as 'apprise'.

When you're complete, you will receive a URL that looks something like this:
```
https://api.ciscospark.com/v1/webhooks/incoming/\
       Y3lzY29zcGkyazovL3VzL1dFQkhPT0sajkkzYWU4fTMtMGE4Yy00
```

The last part of the URL is all you need to be interested in. Think of this URL as:
* `https://api.ciscospark.com/v1/webhooks/incoming/{token}`

So as you can see, we have is 3 separate tokens.  These are what you need to build your apprise URL with.  In the above (simplified) example, the tokens are:
* **Token**: `Y3lzY29zcGkyazovL3VzL1dFQkhPT0sajkkzYWU4fTMtMGE4Yy00`

**Note:** Apprise supports this URL _as-is_ (_as of v0.7.7_); you no longer need to parse the URL any further.  However there is slightly less overhead (internally) if you do.

### Syntax
Valid syntax is as follows:
* `https://api.ciscospark.com/v1/webhooks/incoming/{token}`
* `wxteams://{token}/`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| token       | Yes      | The  tokens provided to you after creating a *incoming-webhook*

#### Example
Send a Webex Teams notification:
```bash
# Assuming our {token} is T1JJ3T3L2DEFK543
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   wxteams:///T1JJ3T3L2DEFK543/
```
