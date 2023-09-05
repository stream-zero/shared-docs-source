## Direct 7 (D7) Networks
* **Source**: https://d7networks.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 160 Characters per message

### Account Setup
To use this service you will need a D7 Networks account from their [website](https://d7networks.com/)

After you've established your account you can get your api login credentials (both _user_ and _password_) from the API Details section from within your [account profile area](https://d7networks.com/accounts/profile/).

### Syntax
Valid syntaxes are as follows:
* `d7sms://{user}:{password}@/{PhoneNo}`
* `d7sms://{user}:{password}@/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`

### Parameter Breakdown
| Variable        | Required | Description
| --------------- | -------- | -----------
| user      | Yes      | The _username_ associated with your D7 Networks account.  This is available to you via the **API Details** section from within your [account profile area](https://d7networks.com/accounts/profile/).
| password       | Yes   | The _API Secret_ associated with your D7 Networks account.  This is available to you via the **API Details** section from within your [account profile area](https://d7networks.com/accounts/profile/).
| PhoneNo         | Yes  | At least one phone number MUST identified to use this plugin.  This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.
| from         | No   | Originating address,In cases where the rewriting of the sender's address is supported or permitted by the SMS-C. This is used to transmit the message, this number is transmitted as the originating address and is completely optional.
| priority     | No   | By default a priority of zero (0) is set (low).  You can set 0, 1, 2, or 3 if you wish to adjust this value where as 3 represents a high priority.
| batch        | No  | D7 Networks allows a batch mode.  If you identify more then one phone number, you can send all of the phone numbers you identify on the URL in a single shot instead of the normal _Apprise_ approach (which sends them one by one). Enabling batch mode has both it's pro's and cons. By default batch mode is disabled.

#### Example
Send a D7 Network Notification as an SMS:
```bash
# Assuming our {user} is l2g
# Assuming our {password} is appriseIsAwesome
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
#                        - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   d7sms://l2g:appriseIsAwesome@18005551223

# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   d7sms://l2g:appriseIsAwesome@1-(800) 555-1223
```