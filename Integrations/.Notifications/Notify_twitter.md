## Twitter Notifications
* **Source**: https://twitter.com/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 10000 Characters per message if a private DM otherwise public tweets are limited to 280 character.

### Account Setup
Twitter Direct Messages  are slightly more complicated then some of the other notification services, so here is quick breakdown of what you need to know and do in order to send Notifications through it using this tool:

1. First off, you need to generate a Twitter App from [developer.twitter.com](https://developer.twitter.com/en/apps). It's through a Twitter App we will be able to send our DMs.
2. Once you create the app, you'll need to **generate the Access Tokens**. This Is done from the "*Keys and Access Tokens*" Tab.

You should now have 4 Tokens to work with at this point on this same page.
* A Consumer Key
* A Consumer Secret
* An Access Token
* An Access Token Secret

From here you're ready to go. You can post public tweets or simply create DMs through the use of the mode= variable.  By default Direct Messaging (DM) is used.

### Syntax
Valid syntaxes are as follows:
* **twitter**://**{ConsumerKey}**/**{ConsumerSecret}**/**{AccessToken}**/**{AccessSecret}**
* **twitter**://**{ScreenName}**@**{ConsumerKey}**/**{ConsumerSecret}**/**{AccessToken}**/**{AccessSecret}**
* **twitter**://**{ConsumerKey}**/**{ConsumerSecret}**/**{AccessToken}**/**{AccessSecret}**/**{ScreenName1}**/**{ScreenName2}**/**{ScreenNameN}**

**Note** If no ScreenName is specified, then by default the Direct Message is sent to your own account.

A Public tweet can be referenced like so:
* **twitter**://**{ConsumerKey}**/**{ConsumerSecret}**/**{AccessToken}**/**{AccessSecret}**?**mode=tweet**

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| ScreenName      | Yes      | The UserID of your account such as *l2gnux* (if your id is @l2gnux). You must specify a {userid} *or* an {ownerid}.
| ConsumerKey      | Yes      | The Consumer Key
| ConsumerSecret     | Yes      | The Consumer Secret Key
| AccessToken     | Yes      | The Access Token; you would have had to generate this one from your Twitter App Configuration.
| AccessSecret     | Yes      | The Access Secret; you would have had to generate this one from your Twitter App Configuration.
| Mode             | No       | This the the Twitter mode you want to operate in.  Possible values are **dm** (for Private Direct Messages) and **tweet** to make a public post.  By default this is set to **dm**

#### Example
Send a Twitter DM to @testaccount:
```bash
# Assuming our {ConsumerKey} is T1JJ3T3L2
# Assuming our {ConsumerSecret} is A1BRTD4JD
# Assuming our {AccessToken} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {AccessSecret} is FDVJaj4jcl8chG3
# our user is @testaccount
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   twitter://testaccount@T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/FDVJaj4jcl8chG3
```
