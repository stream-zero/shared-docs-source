## :mega: Apprise CLI
This small tool wraps the apprise python library to allow individuals such as Developers, DevOps, and Administrators to send notifications from the command line.

### Getting Started
Apprise in it's most basic form requires that you provide it a message and an Apprise URL which contains enough information to send the notification with. A list of supported services and how to build your own URL can be found [here](https://github.com/caronc/apprise/wiki#notification-services). Here is a simple [email](https://github.com/caronc/apprise/wiki/Notify_email) example:
```bash
# Set a notification to a hotmail (email) account:
apprise --body="My Message" mailto://user:password@hotmail.com
```

If you don't specify a **--body** (**-b**) then Apprise reads from **stdin** instead:
```bash
# without a --body, you can use a pipe | to redirect output
# into you're notification:
uptime | apprise mailto://user:password@hotmail.com
```

By default Apprise is very silent;  If you want to have a better understanding of what is going on, just add a `-v` switch to improve the verbosity.  The more `v`'s you add, the more detailed output you'll get back.

There is no limit to the number of services you want to notify, just keep adding/chaining them one after another:
```bash
# Set a notification to a yahoo email account, Slack, and a Kodi Server
# with a bit of added verbosity (2 v's specified):
apprise -vv --body="Notify more than one service" \
   mailto://user:password@yahoo.com \
   slack://token_a/token_b/token_c \
   kodi://example.com
```

#### CLI Switches and Options
All of the switches and options available to you can be presented by adding `--help` (`-h`) to the command line:
```bash
# Print all of the help information:
apprise --help
```

The switches/options are as follows:
```
Usage: apprise [OPTIONS] SERVER_URL [SERVER_URL2 [SERVER_URL3]]

  Send a notification to all of the specified servers identified by their
  URLs the content provided within the title, body and notification-type.

  For a list of all of the supported services and information on how to use
  them, check out at https://github.com/caronc/apprise

Options:
  -b, --body TEXT                Specify the message body. If no body is
                                 specified then content is read from <stdin>.
  -t, --title TEXT               Specify the message title. This field is
                                 complete optional.
  -c, --config CONFIG_URL        Specify one or more configuration locations.
  -a, --attach ATTACHMENT_URL    Specify one or more attachment.
  -n, --notification-type TYPE   Specify the message type (default=info).
                                 Possible values are "info", "success",
                                 "warning", and "failure".
  -i, --input-format FORMAT      Specify the message input format
                                 (default=text). Possible values are "text",
                                 "html", and "markdown".
  -T, --theme THEME              Specify the default theme.
  -g, --tag TAG                  Specify one or more tags to filter which
                                 services to notify. Use multiple --tag (-g)
                                 entries to "OR" the tags together and comma
                                 separated to "AND" them. If no tags are
                                 specified then all services are notified.
  -Da, --disable-async           Send all notifications sequentially
  -d, --dry-run                  Perform a trial run but only prints the
                                 notification services to-be triggered to
                                 stdout. Notifications are never sent using
                                 this mode.
  -l, --details                  Prints details about the current services
                                 supported by Apprise.
  -R, --recursion-depth INTEGER  The number of recursive import entries that
                                 can be loaded from within Apprise
                                 configuration. By default this is set to 1.
  -v, --verbose                  Makes the operation more talkative. Use
                                 multiple v to increase the verbosity. I.e.:
                                 -vvvv  [x>=0]
  -e, --interpret-escapes        Enable interpretation of backslash escapes
  -D, --debug                    Debug mode
  -V, --version                  Display the apprise version and exit.
  -h, --help                     Show this message and exit.
```

#### File Based Configuration
Ideally it's never safe to store your personal details on the command line; others might see it! So the best thing to do is stick your configuration into a simple [[configuration file|config]]. With respect to the above example, maybe your file will look like this:
```apache
# use hashtag/pound characters to add comments into your
# configuration file.  Define all of your URLs one after
# another:
mailto://user:password@yahoo.com
slack://token_a/token_b/token_c
kodi://example.com
```

Then you can notify all of your services like so: 
```bash
# Set a notification to a yahoo email account, Slack, and a Kodi Server:
apprise -v --body="Notify more than one service" \
   --config=/path/to/your/apprise/config.txt
```

If you stick your configuration in the right locations, you don't even need to reference the **--config** as it will be included automatically; the default filename paths are as follows:
* **Linux/Mac users**:
  * `~/.apprise`
  * `~/.config/apprise`
* **Microsoft Windows users**:
  * `%APPDATA%/Apprise/apprise`
  * `%LOCALAPPDATA%/Apprise/apprise`

With default configuration file(s) in place, reference to the Apprise CLI gets even easier:
```bash
# Set a notification to a yahoo email account, Slack, and a Kodi Server:
apprise -v --body="Notify all of my services"
```

#### Attachment Support
Apprise even lets you send file attachments to the services you use (provided they support them). Attachments are passed along by just including the **--attach** (**-a**) switch along with your Apprise command:
```bash
# Set a simple attachment:
apprise --title="A photo of my family" --body="see attached" \
   --attach=/path/to/my/photo.jpeg

# You can attach as many file attachments as you like:
apprise -v --title="Several great photo's of the gang" --body="see attached" \
   --attach=/path/team1.jpeg \
   --attach=/path/teambuilding-event.jpg \
   --attach=/path/paintball-with-office.jpg
```

**Note**: When using attachments, if one of them can't be found/retrieved for delivery then the message isn't sent.

The great thing with attachments is that Apprise is able to make a remote web-request  for them (prior to attaching them).  This is easily done by just using the `http://` or `https://` protocol. This works great for things like security camera images, or just content you want to pass along hosted online:
```bash
# A web-based attachment:
apprise -v --title="A Great Github Cheatsheet" --body="see attached" \
   --attach="https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf"
```

### :label: Leverage Tagging
Consider the case where you've defined all of your Apprise URLs in one file, but you don't want to notify all of them each and every time.
* :inbox_tray: Maybe you have special notifications that only fire when a download completed.
* :rotating_light: Maybe you have home monitoring that requires you to notify several different locations
* :construction_worker_man: Perhaps you work as an Administrative, Developer, and/or Devops role and you want to just notify certain people at certain times (such as when a software build completes, or a unit test fails, etc).

Apprise makes this easy by simply allowing you to tag your URLs.  There is no limit to the number of tags associate with a URL.  Let's make a simple apprise configuration file; this can be done with any text editor of your choice:
```apache
# Tags in a Text configuration sit in front of the URL
#  - They are comma and/or space separated (if more than one
#  - To mark that you are no longer specifying tags and want to identify
#    the URL, you just place an equal (=) sign and write the URL:
#
# Syntax: <tags>=<url>

# Here we set up a mailto:// URL and assign it the tags: me, and family
# maybe we are doing this to just identify our personal email and
# additionally tag ourselves with the family (which we will tag elsewhere
# too)
me,family=mailto://user:password@yahoo.com

# Here we set up a mailto:// URL and assign it the tag: family
# In this example, we would email 2 people if triggered
family=mailto://user:password@yahoo.com/myspouse@example.com/mychild@example.com

# This might be our Slack Team Server targeting the #devops channel
# We assign it the tag: team
team=slack://token_a/token_b/token_c/#general

# Maybe our company has a special devops group too idling in another
# channel; we can add that to our list too and assign it the tag: devops
devops=slack://token_a/token_b/token_c/#devops

# Here we assign all of our colleagues the tags: team, and email
team,email=mailto://user:password@yahoo.com/john@mycompany.com/jack@mycompany.com/jason@mycompany.com

# Maybe we have home automation at home, and we want to notify our 
# kodi box when stuff becomes available to it
mytv=kodi://example.com

# There is no limit... fill this file to your hearts content following
# the simple logic identified above
```

Now there is a lot to ingest from the configuration above, but it will make more sense when you see how the content is referenced. Here are a few examples (based on config above):
```bash
# This would notify the first 2 entries they have the tag `family`
# It would 'NOT' send to any other entry defined
apprise -v --body="Hi guys, I'm going to be late getting home tonight" \
   --tag=family

# This would only notify the first entry as it is the only one
# that has the tag: me
apprise -v --body="Don't forget to buy eggs!" \
   --tag=me
```

If you're building software, you can set up your continuous integration to notify your `team` AND `devops` by simply identifying 2 tags:
```bash
# notify the services that have either a `devops` or `team` tag
# If you check our our configuration; this matches 3 separate URLs
apprise -v --title="Apprise Build" \
   --body="Build was a success!" \
   --tag=devops --tag=team
```
When you specify more than one **--tag** the contents are **OR**'ed together.

If you identify more than one element on the same **--tag** using a space and/or comma, then these get treated as an **AND**. Here is an example:
```bash
# notify only the services that have both a team and email tag
# In this example, there is only one match.
apprise -v --title="Meeting this Friday" \
   --body="Guys, there is a meeting this Friday with our director." \
   --tag=team,email
```

There is a special reserved tag called `all`.  `all` will match ALL of your entries regardless of what tag name you gave it.  Use this with caution.

Here is another way of looking at it:
```bash
# assuming you got your configuration in place; tagging works like so:
apprise -b "has TagA" --tag=TagA
apprise -b "has TagA OR TagB" --tag=TagA --tag=TagB

# For each item you group with the same --tag value is AND'ed
apprise -b "has TagA AND TagB" --tag="TagA, TagB"
apprise -b "has (TagA AND TagB) OR TagC" --tag="TagA, TagB" --tag=TagC
```

### Testing Configuration and Tags
Once you've built your elaborate configuration file and assigned all your tags.  You certainly won't want to notify everyone over and over again while you test it out.  Don't worry, that's what **--dry-run** (**-d**) is for.  You can use this to test your _tag logic_ out and not actually perform the notification.
```bash
# Test which services would have been notified if the tags team and email
# were activated:
apprise --title="Meeting this Friday" \
   --body="Guys, there is a meeting this Friday with our director." \
   --tag=team,email \
   --dry-run
```

If you use the **--dry-run** (**-d**) switch, then some rules don't apply. For one, the **--body** (**-b**) is not even a required option.  The above could have been re-written like so:
```bash
# Test which services would have been notified if the tags team and email
# were activated (without actually notifying them):
apprise --tag=team,email --dry-run
```

## :heavy_check_mark: Compatibility and Notification Details
Apprise offers a lot of services at your fingertips, but some of them may or may not be available to you depending on your Operating system and/or what packages you have installed.  You can see a list of what is available by doing the following:
```bash
# List all of the supported services available to you
# you can also use -l as well:
apprise --details
```

Here is an example of the output (as it is now) on the CLI:
![image](https://user-images.githubusercontent.com/850374/142778418-11e87c7f-1b07-4314-ab86-cbf8d268dabf.png)

## :baggage_claim: Message Body Source
The Apprise CLI doesn't know what you are feeding it when sending a message to a Notification provider. It just assumes that whatever you message you feed it, it should just pass it along *as is* to the upstream provider *as text*.  In most cases, this is perfect and this is the default behaviour. However, if you are passing along HTML content or markdown content, you should just let Apprise know by specifying the `--input-format` (`-i`) switch. For example:
```bash
# An HTML Example:
cat test.html | apprise --input-format=html

# Or Markdown:
cat << _EOF | apprise --input-format=markdown
## Ways to Prepare Eggs
* Scrambled
* Sunny Side Up
* Over Easy

There is more, but I want to keep my message short. :)
_EOF
```

## :star2: Tricks and Additional Notes
### Tmux Alert Bell Integration
Users of Tmux can link their `alert-bell` to use Apprise like so:
```bash
# set your tmux bell-action to type 'other':
set-option -g bell-action other

# now set tmux to trigger on `alert-bell` actions
set-hook -g alert-bell 'run-shell "\
  apprise \
    --title \"tmux finished on #{host}\" \
    --body \"in session #{session_name} window #{window_index}:#{window_name}\" \
    discord://webhook_id/webhook_token \
    slack://TokenA/TokenB/TokenC/Channel \
    twilio://AccountSid:AuthToken@FromPhoneNo"
```
