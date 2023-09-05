## JSON HTTP POST Notifications
* **Source**: n/a
* **Icon Support**: No
* **Attachment Support**: yes
* **Message Format**: JSON
* **Message Limit**: 32768 Characters per message

This is just a custom Notification that allows you to have this tool post to a web server as a simple JSON string. This is useful for those who want to be notified via their own custom methods.

The format might look something like this:
```json
{
   "version": "1.0",
   "title": "Some Great Software Downloaded Successfully",
   "message": "Plenty of details here",
   "type": "info"
}
```

The *type* will be one of the following:
* **info**: An informative type message
* **success**: A successful report
* **failure**: A failure report
* **warning**: A warning report

### Syntax
Valid syntax is as follows:
* `json://{hostname}`
* `json://{hostname}:{port}`
* `json://{user}:{password}@{hostname}`
* `json://{user}:{password}@{hostname}:{port}`

The secure versions:
* `jsons://{hostname}`
* `jsons://{hostname}:{port}`
* `jsons://{user}:{password}@{hostname}`
* `jsons://{user}:{password}@{hostname}:{port}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The Web Server's hostname
| port        | No       | The port our Web server is listening on. By default the port is **80** for **json://** and **443** for all **jsons://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| method      | No       | Optionally specify the server http method; possible options are `post`, `put`, `get`, `delete`, and `head`.  By default if no method is specified then `post` is used.

#### Example
Send a JSON notification to our web server listening on port 80:
```bash
# Assuming our {hostname} is json.server.local
apprise json://json.server.local
```

### Header Manipulation
Some users may require special HTTP headers to be present when they post their data to their server.  This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
```bash
# Below would set the header:
#    X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "json://localhost:8080/path/?+X-Token=abcdefg"

# Multiple headers just require more entries defined:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "json://localhost:8080/path/?+X-Token=abcdefg&+X-Apprise=is%20great"
```