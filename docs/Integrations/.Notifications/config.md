## :mega: Apprise Configuration
Configuration allows you to identify all of your notification services in one or more secure spots.

There are 2 supported formats:
- **[[TEXT|Config_text]]**: Super basic and easy to use.
- **[[YAML|Config_yaml]]**: A wee bit more complicated (when comparing to TEXT) but offers you much more flexibility.

## Configuration URLs
Whether loading your Apprise configuration from the command line or the Python framework, they also work in the form of URLs too. This allows for URL location endpoints to extend further then what is currently already supported in the future.

Today, the following configuration URLs are supported:

| URL             | Description |
| --------------- | ----------- |
| **file://**     | Reads the configuration from a file accessible locally from whence the directory you're standing in when using Apprise.  You can specify an absolute path such as `file:///etc/config/apprise.yaml` or a relative one such as `file://var/config.txt`.<br/><br/>The file extension associated with your configuration file plays a role in how it is interpreted. Configuration files ending with **.yml** and **.yaml** are assumed to be [YAML based](/caronc/apprise/wiki/Config_yaml) while anything else is assumed to be [TEXT based](/caronc/apprise/wiki/Config_text).<br/><br/>**Note:** The `file://` is assumed to be the default schema used in your configuration URL (even if you didn't specify it).  Hence Apprise will also just accept the path as-is such as `/absolute/path/to/apprise.cfg` or `relative/path/to/config.yaml`. |
| **http://** and **https://**    | Retrieves your configuration from a web server (via the HTTP protocol). An example of this might be: `http://localhost/apprise/` or `https://example.com/apprise/config`.<br/><br/>The server response plays a key role in how Apprise interprets the data content. The **Content-Type** residing in the _Response Header_ must identify contain one of the following:<br/><br/>[YAML based](/caronc/apprise/wiki/Config_yaml):<br/>- **text/yaml**<br/>- **text/x-yaml**<br/>- **application/yaml**<br/>- **application/x-yaml**<br/><br/>[TEXT based](/caronc/apprise/wiki/Config_text):<br/>- **text/plain**<br/>- **text/html**<br/><br/>**Note:** Apprise always makes a **POST** to the server(s) in question. All content returned should be encoded as **UTF-8**.

### Configuration Format Override
You can always over-ride the Apprise configuration detection process (whether it is YAML or TEXT formatted) by simply adding `?format=text` or `?format=yaml` to the end of your configuration URL.  This will enforce that the configuration polled is to be interpreted in a specific way. For example:
* `file:///etc/apprise/caronc.cfg?format=yaml` : This forces what would have otherwise been interpreted as a TEXT file (because of the extension) to be interpreted as a YAML one.
* `http://localhost/my/apprise/config?format=text`: Force the processing of the web response to be a TEXT base configuration.

### Apprise API
There is an Apprise API built for hosting your configuration on the cloud; [check it out here](https://github.com/caronc/apprise-api). This is a great cloud solution for centralizing your configuration on your network so it is accessible from anywhere.

## CLI
To get started you can check out this [[dedicated wiki page on the CLI|CLI_Usage]].
The following lines work really with the command line:
*  **--config** (**-c**): so you can manually load configuration files and process the notification URLs from there. You only need to provide this option if you don't have a configuration file already set up in the default search paths (explained below).
*  **--tag** (**-g**):  so you can filter what you notify by the label you assigned to them.

If the Apprise CLI tool is executed without any notification URLs or Configuration based ones specified, then the following local files are tested to see if they exist and can be processed:
* **~/.apprise**
* **~/.apprise.yml**
* **~/.config/apprise**
* **~/.config/apprise.yml**

Microsoft Windows users can find the configuration path as:
* **%APPDATA%/Apprise/apprise**
* **%APPDATA%/Apprise/apprise.yml**
* **%LOCALAPPDATA%/Apprise/apprise**
* **%LOCALAPPDATA%/Apprise/apprise.yml**

**Note:** The configuration locations identified above are ignored if a **--config** (**-c**) argument is specified.

### CLI Examples:
Here are some simple examples:
```bash
# The following will only send notifications to services that has the
# `tv` tag associated with it.
apprise -vvv -b "Notify only Kodi's in house" --tag=tv
```

You can also get your configuration from a web server:
```bash
# website
apprise -vvv --config=https://myserver/my/apprise/config -b "notify everything"

# you can specify as many --config (-c) lines as you want to add more
# and more notification services to be handled:
apprise -vvv --config=https://myserver/my/apprise/config \
 --config=/a/path/on/the/local/pc -b "notify everything"

# Remember to tag everything because the most powerful feature is to
# load all of your services but only trigger the specific ones you're
# interested in notifying:
apprise -vvv --config=https://myserver/my/apprise/config \
 --config=/a/path/on/the/local/pc \
 -b "notify urls tagged with my-admin-team only" \
 --tag=my-admin-team
```

## Developers
For developers, there is a new object called **AppriseConfig()** which works very similar to the **AppriseAsset()** object.  It's just anothr object that can be easily consumed by the Apprise() instance.

Up until now, you would add URLs to Apprise like so:
```python
from apprise import Apprise

# Our object
a = Apprise()

# Add our services (associate a tag with each)
a.add('mailto://user:pass@hotmail.com', tag='email')
a.add('gnome://', tag='desktop')

# This command actually won't notify anything because tags were associated
# with our URLs
a.notify("A message!", title="An Optional Title")

# This however will notify all of them.  It uses the special keyword 'all'
# which disregards any tag names set.
a.notify("A message!", title="An Optional Title", tag="all")

# To notify specific URLs that were loaded, you can match them by their
# tag; the below would only access out mailto:// entry:
a.notify("A message!", title="An Optional Title", tag="email")
```

Well this is how little your code has to change with configuration:
```python
from apprise import AppriseConfig

# Create an AppriseConfig() object
config = AppriseConfig()

# Similar to the Apprise() we add our configuration paths

# Add a configuration file by it's local path
config.add('/local/path/on/your/server/config')

# Same as the above, except it's a good idea to get in the
# habit of locating local files with the file:// prefix.
config.add('file://~.apprise')

# URLs work too http:// an https://
config.add('http://localhost/my/apprise/config/url/path')
config.add('http://example.com/config')

# ---
# Our new config object can be simply added into our apprise
# instance as though it were another notification service
# it were a notification service:
a.add(config)

# Send off our all of our notifications
a.notify("A message!", title="An Optional Title")

# filter our notifications by those associated with the
# devops tag:
a.notify(tag="devops")
```

## :label: Tagging from the CLI:
Tagging (with the **--tag=** (or **-g**) allows you to only notify entries from the configuration you defined that you want to.  You could define hundreds of entries and through tagging, just notify a few (or if any at all).

```bash
# assuming you got your configuration in place; tagging works like so:
apprise -b "has TagA" --tag=TagA
apprise -b "has TagA OR TagB" --tag=TagA --tag=TagB

# For each item you group with the same --tag value is AND'ed
apprise -b "has TagA AND TagB" --tag="TagA, TagB"
apprise -b "has (TagA AND TagB) OR TagC" --tag="TagA, TagB" --tag=TagC
```