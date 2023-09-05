## Nextcloud Notifications
* **Source**: https://nextcloud.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 4000 Characters per message

### Account Setup
The official [Notifications app](https://github.com/nextcloud/notifications) will need to be installed.  An 'app password' (also referred to as 'device-specific' password/token) of the admin-user will need to be created, see the [documentation](https://docs.nextcloud.com/server/stable/user_manual/session_management.html#managing-devices) for more information.  Don't forget to disable file system access for this password.  

### Syntax
Secure connections (via https) should be referenced using **nclouds://** where as insecure connections (via http) should be referenced via **ncloud://**.

Valid syntaxes are as follows:
* `ncloud://{hostname}/{notify_user}`
* `ncloud://{hostname}:{port}/{notify_user}`
* `ncloud://{admin_user}:{password}@{hostname}/{notify_user}`
* `ncloud://{admin_user}:{password}@{hostname}:{port}/{notify_user}`
* `nclouds://{hostname}/{notify_user}`
* `nclouds://{hostname}:{port}/{notify_user}`
* `nclouds://{admin_user}:{password}@{hostname}/{notify_user}`
* `nclouds://{admin_user}:{password}@{hostname}:{port}/{notify_user}`

You can notify more then one user by simply chaining them at the end of the URL.
* `ncloud://{admin_user}:{password}@{hostname}:{port}/{notify_user1}/{notify_user2}/{notify_userN}`
* `nclouds://{admin_user}:{password}@{hostname}:{port}/{notify_user1}/{notify_user2}/{notify_userN}`


### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The hostname of the server hosting your Nextcloud service.
| admin_user  | Yes      | The administration user of the next cloud service you have set up.
| password    | Yes      | The administrator password associated with the **admin_user** for your Nextcloud account.
| notify_user | Yes      | One or more users you wish to send your notification to.
| to          | No       | This is an alias to the notify_user variable.
| version     | No       | NextCloud changed their API around with v21.  By default Apprise uses their latest API spec.  If you're using an older version, you can sent this value accordingly and Apprise will accommodate (switching back to the older API).

#### Example
Send a secure nextcloud notification to the user _chucknorris_:
```bash
# Assuming our {host} is localhost
# Assuming our {admin_user} is admin
# Assuming our (admin) {password} is 12345-67890-12345-67890-12345:
apprise nclouds://admin:12345-67890-12345-67890-12345@localhost/chucknorris
```

### Header Manipulation
Some users may require special HTTP headers to be present when they post their data to their server.  This can be accomplished by just sticking a hyphen (**-**) in front of any parameter you specify on your URL string.
```bash
# Below would set the header:
#    X-Token: abcdefg
#
# We want to send an insecure connection (we'll use ncloud://)
# Assuming our {host} is localhost
# Assuming our {admin_user} is admin
# Assuming our (admin) {password} is 12345-67890-12345-67890-12345:
# We want to notify arnold
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   ncloud://admin:12345-67890-12345-67890-12345@localhost/arnold?-X-Token=abcdefg

# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {host} is localhost
# Assuming our {admin_user} is admin
# Assuming our (admin) {password} is secret:
# We want to notify arnold
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   ncloud://admin:12345-67890-12345-67890-12345@localhost/arnold?-X-Token=abcdefg&-X-Apprise=is%20great

# If we're using an older version of NextCloud (their API changed) we may need
# to let Apprise know this (using the version= directive)
apprise -t "Title" -b "Body" "ncloud://admin:12345-67890-12345-67890-12345@localhost/arnold??version=20"

```