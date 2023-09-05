## Enimga2 Device Notifications
* **Source**: n/a
* **Icon Support**: No
* **Message Format**: XML
* **Message Limit**: 1000 Characters per message

A [_E2OpenPlugin_](https://github.com/E2OpenPlugins) called [OpenWebif](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif) can allow you to communicate with your Enigma2 devices (such as [Dreambox](http://www.dream-multimedia-tv.de/), [Vu+](http://www.vuplus.com), etc.) using a API.

Once [OpenWebif](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif) is installed, Apprise can utilize it's API to send notifications to your Enigma2 device.

Installation instructions on how to install OpenWebif onto your Engima2 device can be found on it's [GitHub Page](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif).

### Syntax
Valid syntaxes are as follows:
* `enigma2://{host}`
* `enigma2://{host}:{port}`
* `enigma2://{user}@{host}`
* `enigma2://{user}@{host}:{port}`
* `enigma2://{user}:{password}@{host}`
* `enigma2://{user}:{password}@{host}:{port}`
* `enigma2s://{host}`
* `enigma2s://{host}:{port}`
* `enigma2s://{user}@{host}`
* `enigma2s://{user}@{host}:{port}`
* `enigma2s://{user}:{password}@{host}`
* `enigma2s://{user}:{password}@{host}:{port}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The Enigma2 devices IP/hostname
| port        | No       | The port our Web server is listening on. By default the port is **80** for **enigma2s://** and **443** for all **enigma2://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| timeout     | No       | The number of seconds delivered notification stay on the screen for.  The default value is 13.

#### Example
Send an notification to our Enigma2 Device:
```bash
# Assuming our {hostname} is dreambox
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   enigma2://dreambox
```
### Header Manipulation
Some users may require special HTTP headers to be present when they post their data to their server.  This can be accomplished by just sticking a hyphen (**-**) in front of any parameter you specify on your URL string.
```bash
# Below would set the header:
#    X-Token: abcdefg
#
# Assuming our {hostname} is vu-device
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "enigma2://localhost/?-X-Token=abcdefg"

# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {hostname} is localhost
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "enigma2://localhost/path/?-X-Token=abcdefg&-X-Apprise=is%20great"
```