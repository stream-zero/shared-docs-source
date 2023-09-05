## Notifico Notifications
* **Source**: https://n.tkte.ch/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 512 Characters per message

Notifico allows you to send a message to one or more IRC Channel(s)

## Account Setup
1. Visit https://n.tkte.ch and sign up for an account
1. Create a project; either manually or sync with github
1. from within the project, you can create a **Plain Text Message Hook**
![notifico plain text hook](https://user-images.githubusercontent.com/850374/66708086-3f17cb00-ed19-11e9-8e37-bc7e6ba5a3cd.png)

Once your hook has been created successfully, from the main project page, you can retrieve the link needed to send your messages to.  Apprise will need this:
![notifico hook capture instructions](https://user-images.githubusercontent.com/850374/66708104-6c647900-ed19-11e9-895e-d5f755d05079.png)

The URL will look something like this:
```
       https://n.tkte.ch/h/2144/uJmKaBW9WFk42miB146ci3Kj
                            ^                ^
                            |                |
                         project id       message hook
```

This URL effectively equates to:<br/>
```https://n.tkte.ch/h/{ProjectID}/{MessageHook}```

If you want to convert this to an Apprise URL, do the following:
The last part of the URL you're given make up the 2 arguments that are most important to us. In the above example the arguments are as follows:
1. **ProjectID** is ```2144```
2. **MessageHook** is ```uJmKaBW9WFk42miB146ci3Kj```

# Syntax
You can directly pass in the native URL as retrieved from the website if you like:
* `https://n.tkte.ch/h/{ProjectID}/{MessageHook}`

Or your can format it for Apprise (there is slightly less overhead if you do this):
* `notifico://{ProjectID}/{MessageHook}`

You can optionally turn colors off (by default they are turned on):
* `notifico://{ProjectID}/{MessageHook}?color=off`

By default Apprise will send a prefix with each message it sends you can turn this off too as follows:
* `notifico://{ProjectID}/{MessageHook}?prefix=off`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| ProjectID  | Yes      | The project ID is an integer and makes up the first part of the provided Notifico Message Hook URL.
| MessageHook | Yes     | The message hook can be found at the end of the provided Notifico Message Hook URL.
| color       | No      | Uses IRC Coloring to provide a richer experience.  It also allows the parsing of IRC colors found in the notification passed in.  You must ensure the **Color** Checkbox is selected when setting up your Message Hook for this to work. By default this is set to **Yes**.
| prefix      | No      | All messages sent to IRC by default have a Prefix that help identify the type of message (info, error, warning, or success) as well as the system performing the notification. By default this is set to **Yes**.

#### Example
Send a Notifico notification
```bash
# The following sends a notifico notification
# Assuming our {ProjectID} is 2144
# Assuming our {MessageHook} is uJmKaBW9WFk42miB146ci3Kj
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   notifico://2144/uJmKaBW9WFk42miB146ci3Kj
```