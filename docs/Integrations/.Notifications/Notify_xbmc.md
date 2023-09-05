## XBMC Notifications
* **Source**: http://kodi.tv/
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 250 Characters per message

**Note:** XMBC is a legacy product and has been replaced by [[KODI|Notify_kodi]]. However for systems that can't be updated (such as a Jail Broken Apple TV2) you can use this protocol.

### Syntax
Valid syntaxes are as follows:
* **xbmc**://**{hostname}**
* **xbmc**://**{hostname}**:**{port}**
* **xbmc**://**{userid}**:**{password}**@**{hostname}**:**{port}**


### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The server XBMC is listening on.
| port        | No       | The port XBMC is listening on. By default the port is **8080**.
| userid      | No       | The account login to your XBMC server.
| password    | No       | The password associated with your XBMC Server.

#### Example
Send a XBMC notification to our server listening on port 8080:
```bash
# Assuming our {hostname} is xbmc.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   xbmc://xbmc.server.local

# You may have a password and user protecting your xbmc server; so the
# following is another way to hit your xbmc server:
# Assuming our {hostname} is xbmc.server.local
# Assuming our {userid} is xbmc
# Assuming our {password} is xbmc
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   xbmc://xbmc:xbmc@xbmc.server.local
```