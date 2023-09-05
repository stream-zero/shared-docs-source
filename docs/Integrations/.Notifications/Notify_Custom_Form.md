## FORM HTTP POST Notifications
* **Source**: n/a
* **Icon Support**: No
* **Attachment Support**: yes
* **Message Format**: application/x-www-form-urlencoded
* **Message Limit**: 32768 Characters per message

This is just a custom Notification that allows you to have this tool post to a web server as a simple FORM (`application/x-www-form-urlencoded`). This is useful for those who want to be notified via their own custom methods.

The payload will include a `body`, `title`, `version`, and `type` in it's response.  You can add more (see below for details).

The *type* will be one of the following:
* **info**: An informative type message
* **success**: A successful report
* **failure**: A failure report
* **warning**: A warning report

### Syntax
Valid syntax is as follows:
* `form://{hostname}`
* `form://{hostname}:{port}`
* `form://{user}:{password}@{hostname}`
* `form://{user}:{password}@{hostname}:{port}`

The secure versions:
* `forms://{hostname}`
* `forms://{hostname}:{port}`
* `forms://{user}:{password}@{hostname}`
* `forms://{user}:{password}@{hostname}:{port}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The Web Server's hostname
| port        | No       | The port our Web server is listening on. By default the port is **80** for **form://** and **443** for all **forms://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| method      | No       | Optionally specify the server http method; possible options are `post`, `put`, `get`, `delete`, and `head`.  By default if no method is specified then `post` is used.

**Note:**: If you include file attachments; each one is concatenated into the same single post to the upstream server. The `Content-Type` header request also changes from `application/x-www-form-urlencoded` to `multipart/form-data` in this case.

#### Example
Send a FORM Based web request to our web server listening on port 80:
```bash
# Assuming our {hostname} is my.server.local
apprise form://my.server.local
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
   "form://localhost:8080/path/?+X-Token=abcdefg"

# Multiple headers just require more entries defined:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "form://localhost:8080/path/?+X-Token=abcdefg&+X-Apprise=is%20great"
```

### Payload Manipulation
The payload can have entries added to it in addition to the default `body`, `title`, and `type` values.  This can be accomplished by just sticking a colon symbol (**:**) in front of any parameter you specify on your URL string.

```bash
# Below would set the header:
#    X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming we want to include app=mysystem as part of the payload:
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "form://localhost/?:app=payload"
```