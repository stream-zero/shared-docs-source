## Pushover Notifications
* **Source**: https://pushover.net/
* **Icon Support**: No
* **Attachment Support**: Yes
* **Message Format**: Text
* **Message Limit**: 512 Characters per message

There isn't too much configuration for Pushover notifications. The message is basically just passed to your online Pushover account and then gets relayed to your device(s) you've setup from there.

### Getting Your User Key
Once you log into [the website](https://pushover.net/), your dashboard will present your **{user_key}** in front of you. 

### Getting Your API Token
On the dashboard after logging in, if you scroll down you'll have the ability to generate an application. Upon doing so, you will be provided an API Token to associate with this application you generated.  This will become your **{token}**.

### Syntax
Valid syntax is as follows:
* `pover://{user_key}@{token}`
* `pover://{user_key}@{token}/{device_id}`
* `pover://{user_key}@{token}/{device_id1}/{device_id2}/{device_idN}`
* `pover://{user_key}@{token}?priority={priority}`
* `pover://{user_key}@{token}?priority=emergency&expire={expire}&retry={retry}`
### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| user_key     | Yes      | The user key identifier associated with your Pushover account. This is NOT your email address.  The key can be acquired from your Pushover dashboard.
| token       | Yes      | The token associated with your Pushover account.
| device_id   | No       | The device identifier to send your notification to. By default if one isn't specified then all of devices associated with your account are notified.
| priority  | No | Can be **low**, **moderate**, **normal**, **high**, or **emergency**; the default is **normal** if a priority isn't specified. <br/>To send an emergency-priority notification, the `retry` and `expire` parameters _should_ be supplied.
| expire  | No | The expire parameter specifies how many seconds your notification will continue to be retried for (every `retry` seconds). If the notification has not been acknowledged in `expire` seconds, it will be marked as expired and will stop being sent to the user. Note that the notification is still shown to the user after it is expired, but it will not prompt the user for acknowledgement. This parameter has a maximum value of at most 10800 seconds (3 hours). The default is 3600 seconds (1 hr) if nothing is otherwise specified.
| retry  | No | The retry parameter specifies how often (in seconds) the Pushover servers will send the same notification to the user. In a situation where your user might be in a noisy environment or sleeping, retrying the notification (with sound and vibration) will help get his or her attention. This parameter must have a value of at least 30 seconds between retries. The default is 900 seconds (15 minutes) if nothing is otherwise specified.
| sound  | No | Can optionally identify one of the optional sound effects identified [here](https://pushover.net/api#sounds). The default sound is **pushover**.
| url  | No | Can optionally provide a Supplementary URL to go with your message
| url_title  | No | Can optionally provide a Supplementary URL Title to go with your message

#### Example
Send a Pushover notification to all of our configured devices:
```bash
# Assuming our {user_key} is 435jdj3k78435jdj3k78435jdj3k78
# Assuming our {token} is abcdefghijklmnop-abcdefg
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   pover://435jdj3k78435jdj3k78435jdj3k78@abcdefghijklmnop-abcdefg
```

Send a Pushover notification with the Emergency Priority:
```bash
# Emergency priority advises you to also specify the expire and
# retry values.
# Assuming our {user_key} is 435jdj3k78435jdj3k78435jdj3k78
# Assuming our {token} is abcdefghijklmnop-abcdefg
# The following will set a 1hr expiry and attempt to resend
# the message every 10 minutes:
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   pover://435jdj3k78435jdj3k78435jdj3k78@abcdefghijklmnop-abcdefg?priority=emergency&retry=600&expire=3600
```