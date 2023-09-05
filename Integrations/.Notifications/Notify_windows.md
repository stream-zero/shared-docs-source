## Microsoft Windows Notifications
* **Source**: n/a
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 250 Characters per message

Display notifications right inside of your windows application.  This only works if you're sending the notification to the same windows system you're currently accessing.  Hence this notification can not be sent from one PC to another.

You may have to install a dependency on your windows system to get this to work.  Simply run:
```bash
# windows:// minimum requirements
pip install pywin32
```

### Syntax
There are currently no options you can specify for this kind of notification, so it's really easy to reference:
* **windows**://

### Parameter Breakdown
There are no parameters at this time.

#### Example
Assuming we're on a Windows computer, we can send a Windows Notification to ourselves:
```bash
# Send ourselves a windows notification
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   windows://
```