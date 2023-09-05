## Faast Notifications
* **Source**: http://www.faast.io/
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message

There isn't too much configuration for Faast notifications.  The message is basically just passed to your online Faast account and then gets relayed to your device(s) you've setup from there.

### Syntax
Valid syntax is as follows:
* **faast**://**{authorizationtoken}**

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| authorizationtoken    | Yes      | The authorization token associated with your Faast account.
| image       | No       | Associate an image with the message. By default this is enabled.

#### Example
Send a Faast notification
```bash
# Assuming our {authorizationtoken} is abcdefghijklmnop-abcdefg
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   faast://abcdefghijklmnop-abcdefg
```