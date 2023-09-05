## Techulus Push Notifications
* **Source**: https://push.techulus.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 1000 Characters per message

### Account Setup
To use this plugin, you need to first download the mobile app and sign up through there:
- [Apple](https://itunes.apple.com/us/app/push-by-techulus/id1444391917?ls=1&mt=8)
- [Android](https://play.google.com/store/apps/details?id=com.techulus.push)

Once you've got your account, you can get your API key from [here](https://push.techulus.com/login.html).
You can also just get the **{apikey}** right out of the phone app that is installed. The **{apikey}** will look something like:
- `b444a40f-3db9-4224-b489-9a514c41c009`

### Syntax
Valid syntax is as follows:
* **push**://**{apikey}**/

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| apikey      | Yes      | The apikey associated with your Techulus Push account.

#### Example
Send a Techulus Push notification:
```bash
# Assuming our {apikey} is b444a40f-3db9-4224-b489-9a514c41c009
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   push:///b444a40f-3db9-4224-b489-9a514c41c009/
```
