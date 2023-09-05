## Opsgenie Notifications
* **Source**: https://www.opsgenie.com
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 15000 Characters per Message

### Account Setup
1. Visit https://www.opsgenie.com to create your account.
2. [Generate your Integration API Key](https://app.opsgenie.com/settings/integration/add/API/)

**Note**: You must generate an Integration API Key; this is not to be confused with the Opsgenie Management API Key.

### Syntax
The syntax is as follows:
-  `opsgenie://{apikey}/`
-  `opsgenie://{apikey}/@{user}`
-  `opsgenie://{apikey}/@{user1}/@{user2}/@{userN}`
-  `opsgenie://{apikey}/*{schedule}`
-  `opsgenie://{apikey}/*{schedule1}}/*{schedule2}/*{scheduleN}`
-  `opsgenie://{apikey}/^{escalation}`
-  `opsgenie://{apikey}/^{escalation1}/^{escalation2}/^{escalationN}`
-  `opsgenie://{apikey}/#{team}`
-  `opsgenie://{apikey}/#{team1}/#{team2}/#{teamN}`

**Note:** If no prefix character is specified, then the target is presumed to be a user (an `@` symbol is presumed to be in front of it).

You can also mix/match the targets:
- `opsgenie://{apikey}/@{user}/#{team}/*{schedule}/^{escalation}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| apikey      | Yes      | This is the API Key associated with your Opsgenie account.
| user        | No       | The user you wish to notify; this can be a `username`, `email`, or `uuid4`. This is the assumed default target type to notify, but it is advised you prefix all users with a `@` symbol to eliminate any ambiguity.
| team        | No       | The team you wish to notify; this can be the team name itself, or or `uuid4` associated with it. <br>**Note:** Teams must be prefixed with a `#` symbol.
| schedule    | No       | The schedule you wish to notify; this can be the schedule name itself, or or `uuid4` associated with it. <br>**Note:** Schedules must be prefixed with a `*` symbol.
| escalation  | No       | The escalation you wish to notify; this can be the escalation name itself, or or `uuid4` associated with it. <br>**Note:**Escalations must be prefixed with a `^` symbol.
| region      | No       | The 2 character region code.  By default this is set to `us` if not specified. Europeans must set this to `eu` to work correctly.
| batch       | No       | Set it to **Yes** if you want all identified targets to be notified notified in batches (instead of individually). By default this is set to **No**.
| tags        | No       | A comma separated list of tags you can associate with your Opsgenie message
| priority    | No       | The priority to associate with the message.  It is on a scale between 1 and 5. The default value is `3` if not specified.
| alias       | No       | The alias to associate with the message.
| entity      | No       | The entity to associate with the message.

#### Example
Send a Opsgenie notification to all devices associated with a project:
```bash
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
```

### Include Details (Key/Value Pairs)
Opsgenie allows you to provide details composed of key/value pairs you can set with messages. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
```bash
# Below would set the key/value pair of foo=bar:
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty/?+foo=bar"

# Multiple key/value pairs just require more entries:
# Below would set the key/value pairs of:
#    foo=bar
#    apprise=awesome
#
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty/?+foo=bar&+apprise=awesome"
```
