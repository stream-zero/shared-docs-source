## Gnome Desktop Notifications
* **Source**: n/a
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 250 Characters per message

Display notifications right on your Gnome desktop.  This only works if you're sending the notification to the same system you're currently accessing.  Hence this notification can not be sent from one PC to another.

### Syntax
There are currently no options you can specify for this kind of notification, so it's really easy to reference:
* **gnome**://


### Parameter Breakdown
There are no parameters at this time.

#### Example
Assuming we're on an OS that allows us to host the Gnome Desktop, we can send a notification to ourselves like so:
```bash
# Send ourselves a Gnome desktop notification
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   gnome://
```