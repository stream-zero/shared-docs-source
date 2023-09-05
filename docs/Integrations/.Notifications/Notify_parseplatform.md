## Parse Platform Notifications
* **Source**: https://parseplatform.org/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per Message

### Syntax
Channels are optional; if no channel is specified then you are just personally notified.
- `parsep://{app_id}:{master_key}@{hostname}`
- `parseps://{app_id}:{master_key}@{hostname}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| app_id      | Yes      | The Application ID
| master_key  | Yes      | This is the Master Key associated with your account
| hostname    | Yes      | The Hostname of your Parse Platform Server

#### Example
Send a Parse Platform notification
```bash
# Assume:
#  - our {app_id} is abc123
#  - our {master_key} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
#  - our {hostname} is parseplatform.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   parsep://app_id:master_key@parseplatform.local
```