## Text Based Apprise Configuration
The TEXT Based configuration files are pretty straight forward and very easy to work with.  You just provide a list of your notification URLs like so.
```apache
# Use pound/hashtag (#) characters to comment lines
# Here is an example of a very basic entry (without tagging):
mailto://someone:theirpassword@gmail.com
slack://token_a/token_b/token_c
```

Tagging is a very feature-rich aspect of Apprise, and you can easily associate tags with your URLs by just placing them before your URL you define. If you want to specify more then one tag, just separate them with a space and/or comma.
```apache
# Use pound/hashtag (#) characters to comment lines
# The syntax is <tags>=<url> or just <url> on each line
#
# Here is an example of a very basic entry (without tagging):
mailto://someone:theirpassword@gmail.com

# Now here is an example of tag associations to another URL
# The equal sign (=) delimits the tag from the actual URL:
desktop=gnome://

# If you have more then one tag you'd like to associate with it,
# simply use a comma (,) and or space to delimit your tags.
# The same rules apply afterwards; just use an equal sign (=)
# to mark the end of your tagging definitions and start your
# notification service URL:
tv,kitchen=kodi://myuser:mypass@kitchen.hostame
tv,basement=kodi://myuser:mypass@basement.hostame
```

## Expanding Configuration Sources
The TEXT based configuration also supports the keyword `include` which allows you to pull more configuration down from other locations. For example:
```apache
# Perhaps this is your default configuration that is always read
# stored in ~/.config/apprise (or ~/.apprise)

# The following could import all of the configuration located on your
# Apprise API:
include http://localhost:8080/get/apprise
```

From there you can easily use the CLI tool from the command line while managing your configuration remotely:
```bash
# automatically reads our above configuration
# Which further imports our additional configuration entries:
apprise -vv -t "my title" -b "my message body"
```

You can freely mix/match include statements and Apprise URLs as well, for example:
```apache
# Our config file located in ~/.config/apprise (or ~/.apprise)

# Our imports
include http://localhost:8080/get/apprise

# A relative config file import (relative to 'this' configuration file)
include more_configuration.cfg

# Absolute path inclusion works well too:
include /etc/apprise/cfg

# you can still include your other URLs here too
mailto://someone:theirpassword@gmail.com

# as always, it's recommended you tag everything and then just
# use the --tag (or -g) switch to access the entries. This
# is especially important if you're going to start storing your
# configuration elsewhere too!
devops=slack://tokenA/tokenB/TokenC
```

All loaded configuration files can also contain the `include` keyword as well.  But by default they `include` recursion only happens at 1 level.  If you want to allow more files to be included, you need to specify `--recursion-depth` (`-R`) and set it to the number of recursive levels you will allow the include to occur for.  By default this is set to 1 with the `apprise` tool.

**Note:** For security reasons, an `http://` configuration source can NOT `include` a `file://` source.

## Web Hosted TEXT Configuration
Apprise can retrieve configuration files from over a network as well using the HTTP protocol.
For HTTP requests, the **Content-Type** HTTP Header (_which defines Mime Type_) is very important. Apprise will parse remote network hosted configuration files as TEXT so long as you're using one of the following **Content-Type** entries:
- `text/plain`
- `text/html`