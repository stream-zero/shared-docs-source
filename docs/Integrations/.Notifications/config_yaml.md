## YAML Based Apprise Configuration
YAML Support offers a much more advance use then what is provided by the TEXT format. Apprise expects configuration files to be found with the extension of `.yml` or `.yaml`.

Here is a configuration example in it's absolute simplest form:
```yaml
#
# Minimal Configuration Example
#

# Define your URLs
urls:
  # Either on-line each entry like this:
  - json://localhost
  - xml://localhost

  # Or add a colon to the end of the URL where you can optionally provide
  # over-ride entries.  One of the most likely entry to be used here
  # is the tag entry.  This gets extended to the global tag (if defined)
  # above
  - windows://:
   # 'tag' is a special keyword that allows you to associate tags with your
   # services:
    - tag: desktop
```

To expand on **tags**, you can also identify a _global entry_ that will be applied _to ALL of the subsequent URL entries defined in the YAML file_. Example
```yaml
#
# Global Tag Configuration Example
#

# Define our version
version: 1

# Our global tags to associate with all of the URLs we define
tag: admin, devops

# Define your URLs (Mandatory!)
urls:
  - xml://localhost
  - json://localhost
  - kodi://user:pass@myserver
```

You can over-ride the AppriseAsset Object too if you know the objects you want to update using the special keyword **asset**.
```yaml
#
# Asset Override Configuration Example
#

# Define our version
version: 1

# Define an Asset object if you wish (Optional)
asset:
  app_id: NuxRef
  app_desc: NuxRef Notification
  app_url: http://nuxref.com

# Define your URLs (Mandatory!)
urls:
  - mailto://bill:pass@protomail.com
```

YAML configuration gets more powerful when you want to utilize a URL more then once. Here is a more complicated example:
```yaml
# if no version is specified then version 1 is presumed. Thus this is a
# completely optional field. It's a good idea to just add this line because it
# will help with future ambiguity (if it ever occurs).
version: 1

# Define an Asset object if you wish (Optional)
asset:
  app_id: AppriseTest
  app_desc: Apprise Test Notifications
  app_url: http://nuxref.com

# Optionally define some global tags to associate with ALL of your
# urls below.
tag: admin, devops

# Define your URLs
urls:
  # One-liner (no colon at the end); just the url as you'd expect it:
  - json://localhost

  # A colon grants you customization; the below associates another tag
  # with our URL. This means it will have admin, devops and customer:
  - xml://localhost:
    - tag: customer

 # Replication Example # 
  # The more elements you specify under a URL the more times the URL will
  # get replicated and used. Hence this entry actually could be considered
  # 2 URLs being called with just the destination email address changed:
  - mailto://george:password@gmail.com:
     - to: jason@hotmail.com
     - to: fred@live.com

  # Again... to re-iterate, the above mailto:// would actually fire two (2)
  # separate emails each with a different destination address specified.
  # Be careful when defining your arguments and differentiating between
  # when to use the dash (-) and when not to.  Each time you do, you will
  # cause another instance to be created.

  # Defining more then 1 element to a multi-set is easy, it looks like this:
  - mailto://jackson:abc123@hotmail.com:
     - to: jeff@gmail.com
       tag: jeff, customer

     - to: chris@yahoo.com
       tag: chris, customer
```

## Expanding Configuration Sources
The YAML based configuration also supports the keyword `include` which allows you to pull more configuration down from other locations. For example:
```yaml
# Perhaps this is your default configuration that is always read
# stored in ~/.config/apprise.yml (or ~/.apprise.yml)
include:
  # The following could import all of the configuration located on your
  # Apprise API:
  - http://localhost:8080/get/apprise
```

From there you can easily use the CLI tool from the command line while managing your configuration remotely:
```bash
# automatically reads our above configuration
# Which further imports our additional configuration entries:
apprise -vv -t "my title" -b "my message body"
```

You can freely mix/match include statements and Apprise URLs as well, for example:
```yaml
# Our config file located in ~/.config/apprise.yml (or ~/.apprise.yml)

# Our imports
include:
  # web based include (use https:// too if you like)
  - http://localhost:8080/get/apprise
  # A relative config file import (relative to 'this' configuration file)
  - more_configuration.cfg
  # Absolute path inclusion works well too:
  - /etc/apprise/cfg

# you can still include your other URLs here too if you want:
# Define your URLs
urls:
  - json://localhost

  # It's recommended you tag everything and then just
  # use the --tag (or -g) switch to access the entries. This
  # is especially important if you're going to start storing your
  # configuration elsewhere too!
  - slack://tokenA/tokenB/TokenC:
    - tag: devops
```

All loaded configuration files can also contain the `include` keyword as well.  But by default they `include` recursion only happens at 1 level.  If you want to allow more files to be included, you need to specify `--recursion-depth` (`-R`) and set it to the number of recursive levels you will allow the include to occur for.  By default this is set to 1 with the `apprise` tool.

**Note:** For security reasons, an `http://` configuration source can NOT `include` a `file://` source.

## Web Hosted YAML Configuration
Apprise can retrieve configuration files from over a network as well using the HTTP protocol.
For HTTP requests, the **Content-Type** HTTP Header (_which defines Mime Type_) is very important. Apprise will parse remote network hosted configuration files as YAML so long as you're using one of the following **Content-Type** entries:
* `text/yaml`
* `text/x-yaml`
* `application/yaml`
* `application/x-yaml`