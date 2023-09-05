# Apprise details()
```python
{
    "version": "X.Y.Z",
    "asset": { ... },
    "schemas": [ ... ],
}
```

A call to the **Apprise().details()** object returns a list of supported notification services available. It's syntax can be broken down into 3 major categories:
* **version**: A string representation of the current version of the Apprise library.
* **asset**: Some developers will provide their own [[Apprise Asset Object|Development_API#the-apprise-asset-object]] tailored to their own system.  This is merely a view into the current loaded configuration.
* **schemas**: This is a identifying all of the supported notification services and a very high level point of reference to them such as their official documentation, the apprise documentation, and the name of the service itself.

A simple way to look at all of the data available to you can be done like so:
```python
import apprise
from json import dumps

# Our Apprise Object
a = apprise.Apprise()

# Our details we've always used in the past but now provide much more
# detail. The below shows how you can simply view them for yourself as
# this is all explained below
print(dumps(a.details(), indent=2)
```

## Version
This is just a simple string that you can use as a reference to help identify what version of Apprise is loaded.  The version identified here can have a direct impact on what notification services have been made available to you and additions to this very API.

While there is no intent to change the API at this time, the API IS subject to potentially be structured differently or _could_ include potential breaking changes _IF the major changes_. Hence given a version of **X**.Y.Z, **X** would be identified as _the major_.

In all other circumstances, content may be added to the API, but NEVER removed or changed in such a way it would break systems referencing it.

## Asset
[[The Apprise Asset Object|Development_API#the-apprise-asset-object]] during the initialization of Apprise can be altered to conform to different products.  The Asset object really just defines some static globals that are referenced through-out the entire life of the Apprise object itself.

This section of the JSON response simply allows one to review what was set/specified. By default, the output might look like this:
```python
    "asset": {
        "app_id": "Apprise",
        "app_desc": "Apprise Notifications",

        "theme": "default",
        "default_extension": ".png",

        "image_path_mask": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-{TYPE}-{XY}{EXTENSION}",
        "image_url_logo": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-logo.png",
        "image_url_mask": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-{TYPE}-{XY}{EXTENSION}"
    },
```

## Schemas
Here is where all of the supported notification services are identified and all of the details you need to know about in order to use one.

Below is an example of what the output  would look like:
```python
    "schemas": {
            "service_name": "Boxcar",
            "service_url": "https://boxcar.io/",

            "setup_url": "https://github.com/caronc/apprise/wiki/Notify_boxcar",
            "protocols": null,
            "secure_protocols": [
                "boxcar"
            ],
            # Only available if show_disabled=True (otherwise ONLY
            # enabled plugins are returned in this response)
            "enabled": true,
            # Details are discussed a bit lower since there is a lot of information
            # here.
            "details": {...},
            # Requirements are only shown if show_requirements=True
            "requirements": {...}
         },
        {
            "service_name": "Discord",
            "service_url": "https://discordapp.com/",

            "setup_url": "https://github.com/caronc/apprise/wiki/Notify_discored",
            "protocols": null,
            "secure_protocols": [
                "discord"
            ],
            # Only available if show_disabled=True (otherwise ONLY
            # enabled plugins are returned in this response)
            "enabled": true,
            # Details are discussed a bit lower since there is a lot of information
            # here.
            "details": {...},
            # Requirements are only shown if show_requirements=True
            "requirements": {...}
        },
```
* `service_name` gives you a general description of the notification service itself.
* `service_url` provides information to the official source of the notification service.
* `setup_url` provides the URL you can reference to see examples on how to construct your Apprise URL.
* `protocols` identifies the accepted schema for non-encrypted references to the service. It is not uncommon to have this field set to `null` simply stating that there simply isn't a non-encrypted form of using this service.
* `secure_protocols` identifies the accepted schema for encrypted references to the service. 
* `enabled` is set to either True or False if the service/plugin is available (based on administrative/platform/environment dependencies).  This field is ONLY present if you specified `show_disabled=True` on your call to **details()**
* `requirements` provides details on what is required for a plugin to be functional (With respect to the platform/environment.  This field is ONLY present if you specified `show_requirements=True` on your call to **details()**
* `details` goes into a much more granular view of the protocol.  This is covered in the next section.

All services will have _AT LEAST_ one protocol/schema you can use to access it by.

The details function can also take a few keyword arguments that generate a little more overhead, but can additionally provide you information on services Apprise supports that you do not have access to (due to your Platform/Environment).
```python
import apprise
from json import dumps

# Our Apprise Object
a = apprise.Apprise()

# Get our details and include all other services available to us as well:
details = apprise.details(show_disabled=True)
```
The payload from the above call will look almost identical as it did except that it will additionally include a variable called **enabled** which is set to either `True` or `False`.  One difference is that the call without this flag set ONLY returns enabled plugins.

### Details
This identifies a much more granular view of the schema object itself. There is enough details in here on every single supported notification service that an end user could ask for simple to read arguments like `token`, `password`, `target_users` and dynamically construct the URL on their own.  You can also just feed these tokens into the [[Apprise Notification Object|Development_API#the-apprise-notification-object]] directly for those using this product at a very low level.

This section was the newest addition to what is provided. There are 4 core sections within the `details` part of the of the JSON output:

1. **templates**: Identifies the URL structure associated with the specific service, eg:
```json
    {
      "service_name": "Discord", 
      ...
      "details": {
        "templates": [
          "{schema}://{webhook_id}/{webhook_token}", 
          "{schema}://{botname}@{webhook_id}/{webhook_token}"
        ]
      ...
     }
...
```
2. **tokens**: This provides the full mappings of each entry identified in the **templates** (identified above).  It gives some data to easily build a web page and/or application from by allowing developers to dynamically generate the Apprise URLs.<br/> It also provides a **map_to** argument which maps the token directly to the Apprise Notification Class (should you want to manually initialize it this way instead of via a URL). Some tokens can be combined into one single token (as a list).  The **map_to** argument additionally provides this connection as well.  This is discussed more below.
```json
    {
      "service_name": "Discord", 
      ...
      "details": {
        ...
        "tokens": {
          "webhook_token": {
            "map_to": "webhook_token", 
            "required": true, 
            "type": "string", 
            "name": "Webhook Token", 
            "private": true
          }, 
          "schema": {
            "name": "Schema", 
            "default": "discord", 
            "required": true, 
            "private": false, 
            "map_to": "schema", 
            "values": [
              "discord"
            ], 
            "type": "choice:string"
          }, 
          "botname": {
            "type": "string", 
            "required": false, 
            "map_to": "user", 
            "name": "Bot Name", 
            "private": false
          }, 
          "webhook_id": {
            "map_to": "webhook_id", 
            "required": true, 
            "type": "string", 
            "name": "Webhook ID", 
            "private": true
          }
        }
      ...
     }
...
``` 
3. **args**: This identifies any URL arguments you want to define.  The arguments reside after the URL is defined, such as `http://path/?arg=val&arg2=val2`.  URL arguments are never mandatory for a URL's construction with Apprise and merely provide extended options.  A continued example (with respect to Discord) would look like this:
```json
...
    {
      "service_name": "Discord", 
      ...
      "details": {
        ...
        "args": {
          "footer": {
            "name": "Display Footer", 
            "default": false, 
            "required": false, 
            "private": false, 
            "map_to": "footer", 
            "type": "bool"
          }, 
          "tts": {
            "name": "Text To Speech", 
            "default": false, 
            "required": false, 
            "private": false, 
            "map_to": "tts", 
            "type": "bool"
          }, 
          "format": {
            "name": "Notify Format", 
            "default": "text", 
            "type": "choice:string", 
            "required": false, 
            "private": false, 
            "map_to": "format", 
            "values": [
              "text", 
              "html", 
              "markdown"
            ]
          }, 
          "footer_logo": {
            "name": "Footer Logo", 
            "default": true, 
            "required": false, 
            "private": false, 
            "map_to": "footer_logo", 
            "type": "bool"
          }, 
          "avatar": {
            "name": "Avatar Image", 
            "default": true, 
            "required": false, 
            "private": false, 
            "map_to": "avatar", 
            "type": "bool"
          }, 
          "overflow": {
            "name": "Overflow Mode", 
            "default": "upstream", 
            "type": "choice:string", 
            "required": false, 
            "private": false, 
            "map_to": "overflow", 
            "values": [
              "upstream", 
              "truncate", 
              "split"
            ]
          }
        }
      ...
     }
...
``` 
4. **kwargs**: Simiar to args, these are never required, the subtle difference between **args** and **kwargs* is with **args** the key names are already defined.  with **kwargs** the user defines both the key and it's value when building the `?+key=value&-key2=value`.  Custom **kwargs** in Apprise are _ALWAYS_ prefixed with a plus (**+**) or minus (**-**) symbol; for this reason there will ALWAYS be a **prefix** field that identities which symbol is applicable.  There are very few notification services at this time that use this, but to support them, you'll find them here. JSON and XML URLs for example allow one to set the _HTTP Headers_ passed to the server they _POST_ to.

```json
...
    {
      "service_name": "JSON", 
      ...
      "details": {
        ...
        "kwargs": {
          "headers": {
            "name": "HTTP Header", 
            "required": false, 
            "private": false, 
            "prefix": "+", 
            "map_to": "headers", 
            "type": "string"
          }
        }
      ...
     }
...
```
## Argument Breakdown
Here I'll break down the arguments a bit more and what they mean:

| Argument  | Values        | Description  |
| --------- |:-------------:| ------------ |
| **type**  | **int**, **float**, **bool**, **string**<br/>**list:int**, **list:float**, **list:string**<br/>**choice:int**, **choice:float**, **choice:string** | The **type** field will always be present except if an **alias_of** exists. It will allow you to determine what the expected object should be. Many of the additional arguments that can reside in this new section will be completely conditional on the type. |
| **name**  | **string** | This is a fully translatable string. That said, at this time this pull request only supports English; but opens the door for others who want to translate this into other languages. The **name** field will always be present except if an **alias_of** exists.
| **values**  | **list()**| The **values** field **ONLY** exists if the **type** was a **choice:** or **bool** (choice:bool is redudant). This provides the actual choices that are explicitly allowed.
| **required**  | **bool**| This is only set if you can be rest assured the plugin will fail to initialize if this value isn't set.
| **default**  | _some value_ | To simplify a users life; sometimes it's easier to pre-provide default values they can use.
| **private**  | **bool** | This is set to **True** if the argument contains something that would otherwise be private to the user making the notification.  This could be something such as a password, or a private token, an authentication key, etc.  If you're building a website, it might be kind of you to place the **password** input type on these.
| **min**  | **int** / **float** | When the **type** is of **int** or **float** this would identify the minimum value that would be accepted. The **min** will not always be present if there are no restrictions set.  This is just a field that the developer can use to help with some early verification.
| **max**  | **int** / **float** | When the **type** is of **int** or **float** this would identify the maximum value that would be accepted. The **max** will not always be present if there are no restrictions set.  This is just a field that the developer can use to help with some early verification.
| **delim**  | **list** | If we are dealing with a **list:** type, then we are accepting more then one element.  For that we need a way to separate one element from another.  This identifies one or more entries that are acceptable as delimiters. The **delim** argument will only be present if the type is of **list:**.
| **regex**  | **(regex, options)** | If we are dealing with a **string** type (this includes a **list:string**), then we provide a regular expression the developer can optionally use to validate the strings specified.  The result is always returned as a tuple where index zero (0) is the actual regex string and index one (1) is the regex options as a string ('i' = case insensitive, etc). It's important to note that not all **string** entries have this entry.  So you shouldn't depend on it's presence.
| **prefix**  | **string** | Some arguments are identified by apprise based on a prefix value placed in front of them.  For example with slack, the at (@) symbol identifies a user where as pound/hashtag (#) identifies a channel.  If a prefix is identified, it _usually_ means that the attribute has a **map_to** argument causing to map to a shared list. It's important to make sure the prefix exists when constructing the URL and/or passing the argument directly into the Apprise Plugin for it to be effective.
| **alias_of**  | **string** | If you see this, then you won't even see a **type** block.  In fact **alias_of** is a lone wolf and when it exists it merely points to a **token** entry (_never another **arg**_) where you can get the details of this item from.  Think of it as a _symbolic-link_; to make apprise easy to work with, some Notification services have more than one way to provide the same information.  **apprise_of** prevents ambiguity of defining the same thing twice.
| **map_to**  | **string** | This has one core meaning and one helping one.   First off, it's primary reason for existence is for those people who don't want to build URLs from the **templates** and want to directly _instantiate_ their own instance of the Notification service manually (using the class object).  **map_to** always points to the function argument name.<br/> The other use of this is in cases where the **prefix** is used.  You should always check the **token** table to see if the **map_to** can be mapped back to an element already identified here.

## Using The Tokens
So, let's presume you built your website and/or application and provided all of these options to the user.  They provided you with all of these options/tokens populated with their data and now you need to send a notification for them.

No problem, the **Apprise.add()** function now supports dictionaries of URL arguments (not just the URL strings themselves).
```python
import apprise

# First you'll get your details which will provide your app with all the information you need
# to get the data you need from the user with any supported notification service.
a = apprise.Apprise()
apprise_details = a.details()

# work your magic and get the user to populate the tokens associated with the
# notification services
results = your_code_that_gets_input_from_user(apprise_details)

# Presuming you have all of your tokens now from one of the notification services:
# for example, for email you might have:
# results = {
#   'schema': 'mailto',
#   'host': 'google.com',
#   'user': 'myuser',
#   'password': 'mypassword',
# }
#
# Simply add your results:
a.add(results)

# Done!
```
**Note:** The dictionary keys that you pass into Apprise.add() must be based on the **map_to** directive.

## Internationalization
Full I18n support is built into this pull request allowing the **name** directive to be translated into other languages (making the **details()** support people who've built their website around multi-language support).

The language is automatically translated on the fly to each call to **details()**.  At this time only English is supported, but I welcome anyone wishing to help with translations into other languages.

Here is how it works:
```python
import apprise

# Our Apprise Object
a = apprise.Apprise()

# Get our details in the local language detected from the OS
# apprise is installed on
details = a.details()

# Get our details in English
details = a.details('en')

# Get our details in French
# Note: While this is possible, i need the translations still
details = a.details('fr')
```

Here is how you can help if you want to.  Let's say you want to help translate apprise into another language:
```bash
# First checkout your own copy of apprise and change into the directory
# it downloaded to

# Next prepare your language (the below prepares the French - fr)
python setup.py init_catalog -l fr

# Now have a look at a new file that appeared; with respect to the
# above command it will be:  apprise/i18n/fr/LC_MESSAGES/apprise.po
# Use your favorite editor to edit this file:
code apprise/i18n/fr/LC_MESSAGES/apprise.po
# or #
gvim apprise/i18n/fr/LC_MESSAGES/apprise.po
# or #
notpad apprise/i18n/fr/LC_MESSAGES/apprise.po
# or #
emacs apprise/i18n/fr/LC_MESSAGES/apprise.po
# you get the idea...
# add your translations and pass them back; it's that easy
```