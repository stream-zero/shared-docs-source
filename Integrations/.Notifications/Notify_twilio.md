## Twilio
* **Source**: https://twilio.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 140 Characters per message

### Account Setup
To use Twilio, you will need to acquire your _Account SID_ and _Auth Token_. Both of these are accessible via the [Twilio Dashboard](https://www.twilio.com/console).

You'll need to have a number defined as an Active Number ([from your dashboard here](https://www.twilio.com/console/phone-numbers/incoming)).  This will become your **{FromPhoneNo}** when identifying the details below.

### Syntax
Valid syntaxes are as follows:
* **twilio**://**{AccountSID}**:**{AuthToken}**@**{FromPhoneNo}**/**{PhoneNo}**
* **twilio**://**{AccountSID}**:**{AuthToken}**@**{FromPhoneNo}**/**{PhoneNo1}**/**{PhoneNo2}**/**{PhoneNoN}**

If no _ToPhoneNo_ is specified, then the _FromPhoneNo_ will be messaged instead; hence the following is a valid URL:
* **twilio**://**{AccountSID}**:**{AuthToken}**@**{FromPhoneNo}**/

[Short Codes](https://www.twilio.com/docs/glossary/what-is-a-short-code) are also supported but require at least 1 Target PhoneNo
* **twilio**://**{AccountSID}**:**{AuthToken}**@**{ShortCode}**/**{PhoneNo}**
* **twilio**://**{AccountSID}**:**{AuthToken}**@**{ShortCode}**/**{PhoneNo1}**/**{PhoneNo2}**/**{PhoneNoN}**

### Parameter Breakdown
| Variable        | Required | Description
| --------------- | -------- | -----------
| AccountSID      | Yes      | The _Account SID_ associated with your Twilio account.  This is available to you via the Twilio Dashboard.
| AuthToken       | Yes      | The _Auth Token_ associated with your Twilio account.  This is available to you via the Twilio Dashboard.
| FromPhoneNo     | **\*No** | The [Active Phone Number](https://www.twilio.com/console/phone-numbers/incoming) associated with your Twilio account you wish the SMS message to come from.  It must be a number registered with Twilio.  As an alternative to the **FromPhoneNo**, you may provide a [ShortCode](https://www.twilio.com/docs/glossary/what-is-a-short-code) instead. The phone number MUST include the country codes dialling prefix as well when placed.  This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.
| ShortCode     | **\*No** | The ShortCode associated with your Twilio account you wish the SMS message to come from.  It must be a number registered with Twilio.  As an alternative to the **ShortCode**, you may provide a **FromPhoneNo** instead.
| PhoneNo         | **\*No**   | A phone number MUST include the country codes dialling prefix as well when placed.  This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.<br/>**Note:** If you're using a _ShortCode_, then at least one _PhoneNo_ MUST be defined.

**Note:** This notification service does not use the title field; only the _body_ is passed along.

#### Example
Send a Twilio Notification as an SMS:
```bash
# Assuming our {AccountSID} is AC735c307c62944b5a
# Assuming our {AuthToken} is e29dfbcebf390dee9
# Assuming our {FromPhoneNo} is +1-900-555-9999
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
#                        - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   twilio://AC735c307c62944b5a:e29dfbcebf390dee9@19005559999/18005551223

# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   twilio://AC735c307c62944b5a:e29dfbcebf390dee9@1-(900) 555-9999/1-(800) 555-1223

```
