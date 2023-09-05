## :skull: Pushalot Notifications
* **Source**: https://pushalot.com (also see https://ifttt.com/pushalot)
* **Icon Support**: Yes
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message
* **Service End Date**: _Somewhere around_ **Nov 2016** (_Estimate_)

### Service End Reason
There isn't much to go on here; Here was their [last public tweet](https://twitter.com/pushalotapp/status/534758031431860224) made on November 18th, 2014:<br/>
![pushalot-last-tweet](https://user-images.githubusercontent.com/850374/53437921-a07a6c00-39cc-11e9-95cc-a120476f292e.png)

There is also [this reddit post](https://www.reddit.com/r/pushalot/comments/5ctstq/pushalot_gone/) which also hints that the permanent shutdown occurred sometime in early November 2016.

Presumably service was never restored and they just closed up shop.

## Legacy Setup Details

There isn't too much configuration for Pushalot notifications.  The message is basically just passed to your online Pushalot account and then gets relayed to your Microsoft device(s) from there.

### Syntax
Valid syntax is as follows:
* **palot**://**{authorizationtoken}**

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| authorizationtoken    | Yes      | The authorization token associated with your Pushalot account. This is an alpha-numeric string (32 characters in length)

#### Example
Send a Pushalot notification
```bash
# Assuming our {authorizationtoken} is 1f418df7577e32b89ac6511f2eb9aa68
apprise palot://1f418df7577e32b89ac6511f2eb9aa68
```
