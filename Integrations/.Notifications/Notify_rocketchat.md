## Rocket.Chat Notifications
* **Source**: https://rocket.chat/
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 1000 Characters per Message

### Syntax
Rocket.Chat can send notifications through the following **modes**:
* **webhook**: A configured Incoming Webhook; this can be set up in the **Administration** area under **Integrations** heading.
* **basic**: A user/password combination.

Secure connections (via https) should be referenced using **rockets://** where as insecure connections (via http) should be referenced via **rocket://**.

#### Basic Mode
Valid syntax is as follows:
* `rocket://{user}:{password}@{hostname}/#{channel}`
* `rocket://{user}:{password}@{hostname}:{port}/#{channel}`
* `rocket://{user}:{password}@{hostname}/{room_id}`
* `rocket://{user}:{password}@{hostname}:{port}/{room_id}`
* `rockets://{user}:{password}@{hostname}/#{channel}`
* `rockets://{user}:{password}@{hostname}:{port}/#{channel}`
* `rockets://{user}:{password}@{hostname}/{room_id}`
* `rockets://{user}:{password}@{hostname}:{port}/{room_id}`

**Note:** the `?avatar=yes` option will only work if your user has the `bot` permission setting.

You can also form any combination of the above and perform updates from one url:
* **rocket**://**{user}**:**{password}**@**{hostname}**/#**{channel_id}**/**{room_id}**

For the Basic Mode Only: if neither a **{room_id}** or **#{channel}** is specified then this notification will fail.

#### Webhook Mode
Valid syntax is as follows:
* `rocket://{webhook}@{hostname}/#{channel}`
* `rocket://{webhook}@{hostname}/{room_id}`
* `rocket://{webhook}@{hostname}/{@user}`
* `rockets://{webhook}@{hostname}/#{channel}`
* `rockets://{webhook}@{hostname}:{port}/#{channel}`
* `rockets://{webhook}@{hostname}/{room_id}`
* `rockets://{webhook}@{hostname}:{port}/{room_id}`

You can also form any combination of the above and perform updates from one url:
* **rocket**://**{webhook}**@**{hostname}**:**{port}**/#**{channel_id}**/**{room_id}**/**@{user}**

By default a webhook is set up to be associated with a channel.  Thus the following syntax is also valid:
* **rocket**://**{webhook}**@**{hostname}**/


### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| user        | *Yes     | The user identifier you've associated with your Rocket.Chat server. This is only required if you are not providing a **webhook** instead.  This can be optionally combined with the **webhook** if you wish to over-ride the bot name.
| password    | *Yes     | The password identifier you've associated with your Rocket.Chat server. This is only required if you are not providing a **webhook** instead
| webhook    | *Yes     | The incoming webhook you created and associated with your Rocket.Chat server . This is only required if you are not providing a **webhook** instead
| hostname    | Yes      | The Rocket.Chat server you're sending your notification to.
| port        | No       | The port the Rocket.Chat server is listening on. By default the port is **80** for **rocket://** and **443** for all **rockets://** references.
| room_id     | No       | A room identifier. Available for both **basic** and **webhook** modes.
| channel     | No       | Channels must be prefixed with a hash (#) or they will be interpreted as a room_id. Available for both **basic** and **webhook** modes. Channels must be registered with your Rocket.Chat server to work.
| user_id    | No       | Another user you wish to notify. User IDs must be prefixed with an at symbol (@). Available for the **webhook** mode only.
| mode       | No       | The authentication mode is automatically detected based what it parses from the URL provided.  You only need to set this if you feel it is being detected incorrectly.  The possible modes are **basic** and **webhook** and are explained above.
| avatar     | No      | Override the default avatar associated with the message to match that of the notification type (be that of a Warning, Error, Info, etc).  By default this is set to **No** for **basic** mode and **Yes** for **webhook** mode.

#### Example
Send a Rocket.Chat notification to the channel *#nuxref*:
```bash
# Assuming our {user} is l2g
# Assuming our {password} is awes0m3!
# Assuming our {hostname} is rocket.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   rocket://l2g:awes0m3!@rocket.server.local/#nuxref
```