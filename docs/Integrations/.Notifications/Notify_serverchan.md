## ServerChan Notifications
* **Source**: https://sct.ftqq.com/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per Message

## Account Setup
Register your own account on the [ServerChan Official Website](https://sct.ftqq.com/). After configure the notify channel, you will be provided the sendkey/token used for notifications.

### Syntax
Valid authentication syntax is as follows:
* `schan://{sendkey}/`


### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| sendkey     | Yes      | This is token provided to you through your SimpleChan account.


#### Example
Send a SimpleChan notification:
```bash
# Assume:
#  - our {sendkey} is ABC123
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   schan://ABC123
```
