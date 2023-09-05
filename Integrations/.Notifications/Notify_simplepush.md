## SimplePush Notifications
* **Source**: https://simplepush.io/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 10000 Characters per Message

SimplePush is a pretty straight forward messaging system you can get for your Android Device through their App [here](https://play.google.com/store/apps/details?id=io.tymm.simplepush).

You can optionally add additional notification encryption in the settings where it provides you with a **{salt}** value and allows you to configure/set your own encryption **{password}**.

### Syntax
Valid authentication syntaxes are as follows:
* `spush://{apikey}/`
* `spush://{salt}:{password}@{apikey}/`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| apikey      | Yes      | This is required for your account to work. You will be provided one from your SimplePush account.
| event       | No       | Optionally specify an event on the URL.
| password    | No       | SimplePush offers a method of further encrypting the message and title during transmission (on top of the secure channel it's already sent on).  This is the Encryption password set. You must provide the `salt` value with the `ppassword` in order to work.
| salt        | No       | The salt is provided to you by SimplePush and is the second part of the additional encryption you can use with this service.  You must provide a `password` with the `salt` value in order to work.

#### Example
Send a SimplePush notification:
```bash
# Assume:
#  - our {apikey} is ABC123
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   spush://ABC123
```
