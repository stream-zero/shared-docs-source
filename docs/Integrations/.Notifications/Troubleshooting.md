
## Table of Contents

<!--ts-->
   * [General Troubleshooting](#general-troubleshooting)
   * [Tag Matching Issues](#tag-matching-issues)
   * [Too Much Data and Overflow Directive](#too-much-data-and-overflow-directive)
   * [Special Characters and URL Conflicts](#special-characters-and-url-conflicts)
   * [Formatting Issues](#formatting-issues)
<!--te-->

## General Troubleshooting

The best thing you can do when troubleshooting problems with your notification is to work it out using the _apprise_ command line tool. You can add verbosity what is going on with the notification you're troubleshooting by simply specifying **-v**; the more v's you specify, the more verbose it gets:
```bash
# In the below example, I am trying to figure out why my mailto:// line
# isn't working:
apprise -vvv -t "test title" -b "test body" \
    mailto://user:password@gmail.com
```
The output can help you pinpoint what is wrong with your URL.

If the output appears cryptic, or you feel that you've exhausted all avenues, Don't be afraid to [open a ticket and ask here](https://github.com/caronc/apprise/issues). It greatly helps if you share the output received from your debug response.  It might be just a simple tweak to your URL that is needed, otherwise we might have a good bug we need to solve.

Please feel free to join us on [Discord](https://discord.gg/MMPeN2D); it's not a big community, but it's growing slowly. You may just find an answer here after asking.

Just be cautious as the debugging information can potentially expose personal information (such as your password and/or private access tokens) to the screen.  Please remember to erase this or swap it with some random characters before posting such a thing publicly.

## Tag Matching Issues

If you tagged your URLs, they're not going to be notified unless you explicitly reference them with **--tag=** (or **-g**).  You can always check to see what URLs have been loaded using the `all` tag directive paired with **--dry-run**:
```bash
# This simply lists all of the tags found in the apprise.txt file
# You don't even need to specify the --config if you're reading files
# from their default locations:
python apprise --dry-run --tag=all \
   --config=/my/path/to/my/config/apprise.txt

# Without a --tag specified, you'll only match URLs that have
# no tag associated with them:
python apprise --dry-run \
   --config=/my/path/to/my/config/apprise.txt

# Otherwise, --dry-run can help you track what notifications are triggered
# depending on what services you're targeting (without actually performing
# any action):
python apprise --dry-run --tag=devops \
   --config=/my/path/to/my/config/apprise.txt
```

## Too Much Data and Overflow Directive

Out of the box, Apprise passes the full message (and title) you provide right along to the notification source(s). Some sources can handle a large surplus of data while others might not. These limitations are documented (*to the best of my knowledge*) on each of the [individual services corresponding wiki pages](https://github.com/caronc/apprise/wiki#notification-services).

However if you don't want to be bothered with upstream restrictions, Apprise has a somewhat _non-elegant_ way of handling these kinds of situations that you can leverage. You simply need to tack on the **overflow** parameter somewhere in your Apprise URL; for example:
* `schema://path/?overflow=split`
* `schema://path/?overflow=truncate`
* `schema://path/?overflow=upstream`
* `schema://path/?other=options&more=settings&overflow=split`

The possible **overflow=** options are defined as:

| Variable    | Description
| ----------- | ----------- |
| **split**  | This will break the message body into as many smaller chunks as it takes to ensure the full delivery of what you wanted to notify with.   The smaller chunk sizes are based on the very restrictions put out by the notification service itself.<br/><br/>For example, _Twitter_ restricts public tweets to 280 characters. If your Apprise/Twitter URL was updated to look like this: `twitter://<auth data>/?overflow=split`, A message of say 1000 characters would be broken (and sent) via 4 smaller messages (280 + 280 + 280 + 160).
| **truncate**  | This just ensures that regardless of how much content you're passing along to a remote notification service, the contents will never exceed the restrictions set by the service itself.<br/><br/>Take our _Twitter_ example again (which restricts public tweets to 280 characters), If your Apprise/Twitter URL was updated to look like this: `twitter://<auth data>/?overflow=truncate`, A message of say 1000 characters would only send the first 280 characters to it. The rest would just be _truncated_ and ignored.
| **upstream** | Simply let the the upstream notification service handle all of the data passed to it (large or small). Apprise will not mangle/change it's content in any way.<br/>**Note**: This is the default configuration option used when the `overflow=` directive is not set.

Please note that the **overflow=** option isn't a perfect solution:
* It can fail for services like Telegram which can take content in the format of _HTML_ (in addition to _Markdown_). If you're using _HTML_, then there is a very strong possibility that both the `overflow=split` and/or `overflow=truncate` option could cut your message in the middle of an un-closed HTML tag.  Telegram doesn't fair to well to this and in the past (at the time of writing this wiki entry) would error and not display the data.
* It doesn't elegantly split/truncate messages the end of a word (near the message limits). It just makes a cut right at the notification services hard limit itself.
* The `overflow=split` can work against you. Consider a situation where you send thousands of log entries accidentally to you via an SMS notification service.  Be prepared to get hundreds of text messages to re-construct all of the data you asked it to deliver! This may or may not be what you wanted to happen; in this case, perhaps `overflow=truncate` is a better choice. Some services might even concur extra costs on you if you exceed a certain message threshold. The point is, just be open minded when you choose to enable the _split_ option with notification services that have very small message size limits. The good news that each supported notification service on the [Apprise Wiki](https://github.com/caronc/apprise/wiki) identifies what each hard limit is set to.

So while the overflow _switch_ is a viable solution for most notification services; consider that it may not work perfectly for all.

## Special Characters and URL Conflicts

Apprise is built around URLs. Unfortunately URLs have pre-reserved characters it uses as delimiters that help distinguish one argument/setting from another.

For example, in a URL, the **&**, **/**, and **%** all have extremely different meanings and if they also reside in your password or user-name, they can cause quite a troubleshooting mess as to why your notifications  aren't working.

Now there is a workaround: you can replace these characters with special **%XX** character-set (URL encoded) values. These encoded characters won't cause the URL to be mis-interpreted allowing you to send notifications at will.

Below is a chart of special characters and the value you should set them:

| Character    | URL Encoded | Description
| ----------- | -------- | -----------
| **%**      | **%25**      | The percent sign itself is the starting value for defining the %XX character sets.
| **&**      | **%26**      | The ampersand sign is how a URL knows to stop reading the current variable and move onto the next.  If this existed within a password or username, it would only read 'up' to this character.  You'll need to escape it if you make use of it.
| **#**      | **%23**      | The hash tag and/or pound symbol as it's sometime referred to as can be used in URLs as anchors.
| **?**      | **%3F**      | The question mark divides a url path from the arguments you pass into it.  You should ideally escape this if this resides in your password or is intended to be one of the variables you pass into your url string.
| _(a space)_    | **%20**      | While most URLs will work with the space, it's a good idea to escape it so that it can be clearly read from the URL.  
| **/**    | **%2F**      | The slash is the most commonly used delimiter that exists in a URL and helps define a path and/or location.
| **@**    | **%40**      | The at symbol is what divides the user and/or password from hostname in a URL.  if your username and/or password contains an '@' symbol, it can cause the url parser to get confused. 
| **+**    | **%2B**      | By default a addition/plus symbol **(+)** is interpreted as a _space_ when specified in the URL. It must be escaped if you actually want the character to be represented as a **+**.
| **,**    | **%2C**      | A comma only needs to be escaped in _extremely rare circumstances_ where one exists at the very end of a specific URL that has been chained with others using a comma. [See PR#104](https://github.com/caronc/apprise/pull/104) for more details as to why you _may_ need this.
| **:**    | **%3A**      | A colon will never need to be escaped unless it is found as part of a user/pass combination.  Hence in a url `http://user:pass@host` you can see that a colon is already used to separate the _username_ from the _password_.  Thus if your _{user}_ actually has a colon in it, it can confuse the parser into treating what follows as a password (and not the remaining of your username).   This is a very rare case as most systems don't allow a colon in a username field.

## Formatting Issues

If your upstream server is not correctly interpreting the information you're passing it, it could be a simple tweak to Apprise you need to make to help it along.

The thing with Apprise is it doesn't know what you're feeding it (the format the text is in); so by default it just passes exactly what you hand it right along to the upstream service.  Since Email operates using HTML formatting (by default), if you feed it raw text, it may not interpret the new lines correctly (because HTML ignores these charaters); you can solve this problem by 3 ways:

1. Change your email URL to read this instead (adding the `format=text` parameter)
   * `mailtos://example.com?user=username&pass=password&to=myspy@example.com&format=text`
1. For developers, your call to `notify()` to include should include the `body_format` value set:
   ```python
   # one more include to keep your code clean
   from apprise import NotifyFormat

   apobj.notify(
       body=message,
       title='My Notification Title',
       body_format=NotifyFormat.TEXT,
   )
   ```
1. For developers, you can actually make a global variable out of the `body_format` so you don't have to keep setting it every time you call `notify` (in-case you intend to call this throughout your code in several locations):
   ```python
   import apprise
   from apprise import NotifyFormat
   from apprise import AppriseAsset
   
   # Create your Apprise Asset
   asset = apprise.Asset(body_format=apprise.NotifyFormat.TEXT)
   
   # Create your Apprise object (pass in the asset):
   apobj = apprise.Apprise(asset=asset)
   
   # Add your objects (like you're already doing)
   apobj.add('mailtos://example.com?user=username&pass=password&to=myspy@example.com')
   
   # And your multi-line message
   message = """
   This message will self-destruct in 10 seconds...
   
   Or not... (... yeah it probably won't at all)
   
   Chris
   """
   
   # The big difference here is now all calls to notify already have the body_format 
   # set to be TEXT.  Apprise knows everything you're feeding it will always be this
   # You can still specify body_format here in the future and over-ride if you ever
   # need to, but your notify stays simple like you had it (but the multi line will work
   # this time):
   apobj.notify(
       body=message,
       title='My Notification Title',
   )
   ```
**What it boils down to is:**
* Developers can use the `body_format` tag which is telling Apprise what the **INPUT source** is. If a Apprise knows this it can go ahead and make special accommodations for the services that are expecting another format. By default the `body_format` is `None` and no modifications to the data fed to Apprise is touched at all (it's just passed right through to the upstream provider).
* End User can modify their URL to specify a `format=` which can be either `text`, `markdown`, or `html` which sets the **OUTPUT source**.  Notification Plugins can use this information to accommodate the data it's being fed and behave differently to help accommodate your situation.

## Scripting Multi-Line Input/Output with CLI
If you're using the `apprise` tool from the command line, you may be trying to script it to send multiple lines.  To acomplish this, there are a number of tweaks you can do with `bash`, `sh`, or `ksh` such as:
Those who want to deliver multiple line output can use the CLI as follows:
```bash
# Send ourselves a DBus related multi-line notification using `stdin` and
# the `cat` tool:
cat << _EOF | apprise -vv -t "Multi-line STDIN Redirect Example" dbus://
Line 1 of output
Line 2 of output
Line 3 of output
_EOF

# Another way is to just redirect the contents of file straight back
# into apprise:
cat ~/notes.txt | apprise -vv -t "Multi-line cat STDIN Redirect Example 2" \
   email://user:pass@hotmail.com

# You can also use pass content from a multi-line variable you
# declared:
MULTILINE_VAR="
This variable has been defined
with multiple lines in it."

# Now send our variable straight into apprise:
apprise -vv -t "Multi-line Variable Example" -b "$MULTILINE_VAR" \
    gotify://localhost

# Note: to preserve the new lines, be sure to wrap your
#       variable in quotes (like example does above).

```