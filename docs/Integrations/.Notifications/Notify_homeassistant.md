## Home Assistant Notifications
* **Source**: https://www.home-assistant.io/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message

### Setup
1. Access your profile after logging into your Home Assistant website.
2. You need to generate a **Long-Lived Access Tokens** via the **Create Token** button (very bottom of profile page)

### Syntax
Valid syntax is as follows:
* `hassio://{host}/{long-lived-access-token}`
* `hassio://{user}:{pass}:{host}/{access_token}`
* `hassio://{user}:{pass}:{host}:{port}/{access_token}`
* `hassio://{host}/optional/path/{access_token}`
* `hassio://{user}:{pass}:{host}/optional/path/{access_token}`
* `hassio://{user}:{pass}:{host}:{port}/optional/path/{access_token}`

By default `hassio://` will use port `8123` (unless you otherwise specify).  If you use `hassios://` (adding an `s`) to the end, then you use the `https` protocol on port `443` (unless otherwise specified).

So the same URL's above could be written using a secure connection/port as:
* `hassios://{host}/{access_token}`
* `hassios://{user}:{pass}:{host}/{access_token}`
* `hassios://{user}:{pass}:{host}:{port}/{access_token}`
* `hassios://{host}/optional/path/{access_token}`
* `hassios://{user}:{pass}:{host}/optional/path/{access_token}`
* `hassios://{user}:{pass}:{host}:{port}/optional/path/{access_token}`

The other thing to note is that Home Assistant requires a `notification_id` associated with each message sent.  If the ID is the same as the previous, then the previous message is over-written with the new.  This may or may not be what your goal is.

So by default Apprise will generate a unique ID (thus a separate message) on every call. If this isn't the effect you're going for, then define your own Notification ID like so:
* `hassio://{host}/{long-lived-access-token}?nid=myid`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| access_token | Yes       | The generated **Long Lived Access Token** from your profile page.
| hostname    | Yes      | The Web Server's hostname
| port        | No       | The port our Web server is listening on. By default the port is **8123** for **hassios://** and **443** for all **jsons://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| nid         | No       | Allows you to specify the **Notification ID** used when sending the notifications to Home Assistant. By doing this, each message sent to Home Assistant will replace the last.

#### Example
Send a Home Assistant notification:
```bash
# Assuming the {hostname} we're hosting Home Assistant on is just myserver.local (port 8123)
# Assuming our {access_token} is  4b4f2918fd-dk5f-8f91f
apprise -vvv hassio:///noreply@myserver.local/4b4f2918fd-dk5f-8f91f
```

Send a Home Assistant notification that always replaces the last one sent:
```bash
# Assuming the {hostname} we're hosting Home Assistant on is just myserver.local (port 8123)
# Assuming our {access_token} is  4b4f2918fd-dk5f-8f91f
# Fix our Notification ID to anything we want:
apprise -vvv hassio:///noreply@myserver.local/4b4f2918fd-dk5f-8f91f?nid=apprise
```

Secure access to Home Assistant just requires you to add an `s` to the schema.  Hence `hassio://` becomes `hassios://` like so:
```bash
# Assuming the {hostname} we're hosting a secure version of Home Assistant
# is accessible via my.secure.server.local (port 443)
# Assuming our {access_token} is  4b4f2918fd-dk5f-8f91f
apprise -vvv hassios:///noreply@my.secure.server.local/4b4f2918fd-dk5f-8f91f
```
