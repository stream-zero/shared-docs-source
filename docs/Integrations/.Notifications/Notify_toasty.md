## :skull: Super Toasty Notifications
* **Source**: http://supertoasty.com/
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message
* **Service End Date**: Somewhere between 2016 and 2017

### Service End Reason
It is hard to find much details on this project and whether or not it still exists in some form or another.

Here is the open source project that extended on this: https://github.com/JohnPersano/SuperToasts.

## Legacy Setup Details

There isn't too much configuration for Super Toasty notifications. The message is basically just passed to your online Super Toasty account and then gets relayed to your device(s) you've setup from there.

By default, 
### Syntax
Valid syntax is as follows:
* **toasty**://**{user_id}**@**{device_id}**
* **toasty**://**{user_id}**@**{device_id1}**/**{device_id2}**/**{device_idN}**

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| user_id     | Yes      | The user identifier associated with your Super Toasty account.
| device_id   | No       | The device identifier to send your notification to.

#### Example
Send a Super Toasty notification a configured device:
```bash
# Assuming our {user_id} is nuxref
# Assuming our {device_id} is abcdefghijklmnop-abcdefg
apprise toasty://nuxref@abcdefghijklmnop-abcdefg
```
