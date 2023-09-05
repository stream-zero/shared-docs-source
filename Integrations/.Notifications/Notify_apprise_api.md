## Apprise API Notifications
* **Source**: https://github.com/caronc/apprise-api
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message

The idea is to allow users to use Apprise and hit an existing Apprise API server.

### Syntax
The syntax is as follows:
- `apprise://{host}/{token}`
- `apprise://{host}:{port}/{token}`
- `apprise://{user}@{host}:{port}/{token}`
- `apprise://{user}:{password}@{host}:{port}/{token}`

For a secure connection, just use `apprises` instead.
- `apprises://{host}:{port}/{token}`
- `apprises://{host}:{port}/{token}`
- `apprises://{user}@{host}:{port}/{token}`
- `apprises://{user}:{password}@{host}:{port}/{token}`


### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The Web Server's hostname
| port        | No       | The port our Web server is listening on. By default the port is **80** for **apprise://** and **443** for all **apprises://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| tags        | No       | You can optional set the tags you want to supply with your call to the Apprise API server

#### Example
Send a notification along to an Apprise API server listening on port 80:
```bash
# Assuming our {hostname} is apprise.server.local
# Assuming our {token} is token
apprise apprise://apprise.server.local/token
```

### Header Manipulation
Some users may require special HTTP headers to be present when they post their data to their server.  This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
```bash
# Below would set the header:
#    X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "apprise://localhost:8080/apprise/?+X-Token=abcdefg"

# Multiple headers just require more entries defined:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
# In this example we allow for a custom URL path to be defined
# in the event we're hosting our Apprise API here instead
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "apprise://localhost:8080/path/apprise/?+X-Token=abcdefg&+X-Apprise=is%20great"
```

**Note:** this service is a little redundant because you can already use the CLI and point it's configuration to an existing Apprise API server (using the `--config` on the CLI or `AppriseConfig()` class via it's own internal API).
```bash
# A simple example of the Apprise CLI using a Config file instead:
# pulling down previously stored configuration
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
apprise --body="test message" --config=http://localhost:8080/get/apprise
```