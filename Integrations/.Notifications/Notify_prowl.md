## Prowl Notifications
* **Source**: https://www.prowlapp.com/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 10000 Characters per message

Prowl requires users to pre-register themselves at [prowlapp.com](https://www.prowlapp.com/) first.

### Syntax
Valid syntaxes are as follows:
* **prowl**://**{apikey}**
* **prowl**://**{apikey}**/**{providerkey}**
* **prowl**://**{apikey}**/?**priority={priority}**

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| apikey    | Yes      | The API Key provided to you after you create yourself a Prowl account.
| providerkey        | No       | The Provider Key is only required if you have been whitelisted.
| priority  | No | Can be **low**, **moderate**, **normal**, **high**, or **emergency**; the default is **normal** if a priority isn't specified.

#### Example
Send a Prowl notification to our server
```bash
# Assuming our {apikey} is adf9dfjkj24jkafkljkf6f
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   prowl://adf9dfjkj24jkafkljkf6f
```