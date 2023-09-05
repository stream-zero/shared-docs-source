## MSG91
* **Source**: https://msg91.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 160 Characters per message

### Account Setup
To use MSG91, you will need to acquire your _Authentication Key_. This is accessible via the [MSG91 Dashboard](https://world.msg91.com/user/index.php#api).

### Syntax
Valid syntaxes are as follows:
* **msg91**://**{AuthKey}**/**{PhoneNo}**
* **msg91**://**{AuthKey}**/**{PhoneNo1}**/**{PhoneNo2}**/**{PhoneNoN}**
* **msg91**://**{SenderID}**@**{AuthKey}**/**{PhoneNo}**
* **msg91**://**{SenderID}**@**{AuthKey}**/**{PhoneNo1}**/**{PhoneNo2}**/**{PhoneNoN}**

### Parameter Breakdown
| Variable        | Required | Description
| --------------- | -------- | -----------
| AuthKey         | Yes      | The _Authentication Key_ associated with your MSG91 account.  This is available to you via the [MSG91 Dashboard](https://world.msg91.com/user/index.php#api).
| PhoneNo         | Yes      | A phone number MUST include the country codes dialling prefix as well when placed.  This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion
| Route           | No       | The SMS Route. This is an SMG91 configuration that defaults to **1** (Transactional) if not otherwise specified.
| Country         | No       | The SMS Country. This is an SMG91 optional configuration that can either be **91** if referencing India, **1** if the USA and **0** if International.

#### Example
Send a MSG91 Notification as an SMS:
```bash
# Assuming our {AuthKey} is gank339l7jk3cjaE
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
#                        - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   msg91://gank339l7jk3cjaE/18005551223

# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "msg91://gank339l7jk3cjaE/1-(800) 555-1223"
```