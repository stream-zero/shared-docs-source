# Development API
Apprise is very easy to use as a developer. The **Apprise()** object handles everything for you, meanwhile the **AppriseAsset()** Object allows you to stray away from some default configuration to personalize the users experience (and perhaps fit your application better):
* **[[The Apprise Object|Development_API#the-apprise-object]]**
* **[[The Apprise Asset Object|Development_API#the-apprise-asset-object]]**

Some additional functionality is available via the **[[The Apprise Notification Object|Development_API#the-apprise-notification-object]]** for those who want to manage the notifications themselves.

Another useful class that can help you out with sending notifications is the **[[The LogCapture Object|Development_LogCapture]]**. It can be used to capture the events that surrounded the success (and potential failure) of the notifications being delivered so that you can work with them.

## The Apprise Object
The Apprise() object is the heart and soul of this library. To instantiate an instance of the object, one might do the following:
```python
# Import this library
import apprise

# create an Apprise instance and assign it to variable `apobj`
apobj = apprise.Apprise()
```

### add(): Add a New Notification Service By URL(s)
Use the **add()** function to append the notification URLs we want to provide notifications for.
```python
# Add all of the notification services by their server url.
# A sample email notification
isokay = apobj.add('mailto://myemail:mypass@gmail.com')

# add() will return a True if the URL was successfully parsed and added into
# our notification pool.  Otherwise it returns False.

# A sample pushbullet notification
isokay = apobj.add('pbul://o.gn5kj6nfhv736I7jC3cj3QLRiyhgl98b')

# You can additionally add URLs via a list/set/tuple:
isokay = apobj.add([
   # A sample growl service
   'growl://192.168.40.23',

   # Our Microsoft Windows desktop
   'windows://',
])
```

#### Tagging
Tagging is a great way to add a richer experience to the notification flow.
You can associate one or more _tags_ with the notifications you choose to **add()**. Doing so grants you to flexibility to later call _on just some_ (_or all_) of the services you added. It effectively grants you the additional ability to filter notifications based on your workflow.

Here is an example:
```python
# import our library
import apprise

# Create our object
apobj = apprise.Apprise()

# Add a tag by a simple string
apobj.add('json://localhost/tagA/', tag="TagA")

# Add 2 tags by string; the comma and/or space auto delimit
# our entries (spaces and comma's are ignored):
apobj.add('json://localhost/tagAB/', tag="TagA, TagB")

# Add 2 tags using a list; this works with tuples and sets too!
apobj.add('json://localhost/tagCD/', tag=["TagC", "TagD"])
```

### notify() : Send Notification(s)
You can now send a notification to all of the loaded notifications services by just providing it a **title** and a **body** like so:
```python
# Then notify these services any time you desire. The below would
# notify all of the services loaded into our Apprise object.
apobj.notify(
    body='what a great notification service!',
    title='my notification title',
)
```

Developers should know that Apprise passes everything it gets _as is_ which will work for most circumstances.  However sometimes it's useful to let apprise know the data you're feeding it.  This information is used to guarantee that the upstream provider can handle the content, and if it can't, it _will be modified_ so that it does.
```python
# Include the NotifyFormat object
from apprise import NotifyFormat

# our body might be read from a file, it might be just input from
# our end users
body="""
...a lot of content
that could span multiple lines ...
"""

# Now we can send our notification while controlling the input source
# and knowing the upstream plugins will be able to handle it
apobj.notify(
    body=body,
    # Possible formats are TEXT, MARDOWN, and HTML
    body_format=NotifyFormat.TEXT,
)
```
#### Leverage Tagging
If you associated tags with your notification services when you called **add()** earlier, you can leverage it's full potential through the **notify()** function here. Tagging however allows you to trigger notifications only when a criteria is met. The tagging logic can be interpreted as follows:

| apprise.notify(tag=_match_)      | Notify Services Having Tag(s): |
| -------------------------------- | ------------------------------ |
| "TagA"                           |  TagA
| "TagA, TagB"                     |  TagA **OR** TagB
| ['TagA', 'TagB']                 |  TagA **OR** TagB
| [('TagA', 'TagC'), 'TagB']       |  (TagA **AND** TagC) **OR** TagB
| [('TagB', 'TagC')]               |  TagB **AND** TagC

Now that we've added our services and assigned them tags, this is how we can access them:
```python
# Has TagA
apobj.notify(
    body="a body", title='a title', tag="tagA")

# Has TagA OR TagB
apobj.notify(
    body="a body", title='a title', tag=["tagA", "TagB"])

# Has TagA AND TagB
apobj.notify(
    body="a body", title='a title', tag=[("tagA", "TagB")])

# Has TagA OR TagB OR (TagC AND TagD)
apobj.notify(
    body="a body", title='a title', tag=["tagA", "TagB", ["TagC", "TagD"]])

# No reference to tags; alert all of the added services
apobj.notify(body="my body", title="my title")
```

#### Tagging and Categories
Another use case for tagging might be to instead interpret them as categories. A system owner could simply fill their code with clean logic like:
```python
#... stuff happening
apobj.notify(body="a body", title='a title', tag="service-message")

# ... uh oh, something went wrong
apobj.notify(body="a body", title='a title', tag="debug-message")

# ... more stuff happening
apobj.notify(body="a body", title='a title', tag="broadcast-notice")
# ...
```

The idea would be that somewhere when the Apprise Object (_apobj_) was first created, you (as a system owner) would have retrieved the user settings and only load the tags based on what they're interested in:
```python
# import our library
import apprise

# Create our object
apobj = apprise.Apprise()

# Poll our user for their setting and add them
apobj.add('mailto://myuser:theirpassword@hotmail.com', tag=[
   # Services we want our user subscribed to:
   "service-message",
   "broadcast-notice"
])
```
**Takeaway**: In this example (above), the user would never be notified for "_debug-message_" calls. Yet the developer of this system does not need to provide any additional logic around the apprise calls other than the _tag_ that should trigger the notification. Just let _Apprise_ handle the logic of what notifications to send for you.

#### Message Types and Themes
By default, all notifications are sent as type **NotifyType.INFO** using the _default_ theme. The following other types are included with this theme:

| Notification Type    | Text Representation | Image |
| -------------------- | ------------------- | ----- |
| **NotifyType.INFO** | _info_ | [![Build Status](https://github.com/caronc/apprise/blob/master/apprise/assets/themes/default/apprise-info-72x72.png)](https://github.com/caronc/apprise/tree/master/apprise/assets/themes/default) |
| **NotifyType.SUCCESS** | _success_ | [![Build Status](https://github.com/caronc/apprise/blob/master/apprise/assets/themes/default/apprise-success-72x72.png)](https://github.com/caronc/apprise/tree/master/apprise/assets/themes/default) |
| **NotifyType.WARNING** | _warning_ | [![Build Status](https://github.com/caronc/apprise/blob/master/apprise/assets/themes/default/apprise-warning-72x72.png)](https://github.com/caronc/apprise/tree/master/apprise/assets/themes/default) |
| **NotifyType.FAILURE** | _failure_ | [![Build Status](https://github.com/caronc/apprise/blob/master/apprise/assets/themes/default/apprise-failure-72x72.png)](https://github.com/caronc/apprise/tree/master/apprise/assets/themes/default) |

Should you want to send a notification using a different status, simply include it as part of your **notify()** call:
```python
# Import our NotifyType
from apprise import NotifyType

# Then notify these services any time you desire. The below would
# notify all of the services loaded into our Apprise object as a WARNING.
apobj.notify(
    body='what a great notification service!',
    title='my notification title',
    notify_type=NotifyType.WARNING,
)
```

You can alter the theme as well; this is discussed lower down using the [[the Apprise Asset Object|Development_API#the-apprise-asset-object]].

### len(): Returns Number of Notification Services loaded

We can retrieve a list of the active and loaded notification services by using python's built in
**len()** function.
```python
# len(apobj) returns the number of notifications loaded
# the below calls this and prints it to the screen:
print("There are %d notification services loaded" % len(apobj))
```
### clear(): Reset our Apprise Object
If you ever want to reset our Apprise object, and eliminate all of the services we had previously loaded into it, you can use the **clear()** function.
```python
# clears out all of the loaded notification services associated with our
# Apprise Object.
apobj.clear()
```
### details(): Dynamic View Into Available Notification Services Apprise Offers
Developers who wish to be able to generate information based on this library dynamically can use the *details()** function:
```python
# returns an object containing details about the plugin for dynamic integration.
apobj.details()
```
The output will look like:
```json
{
    "version": "0.5.2",
    "asset": {
        "default_extension": ".png",
        "app_desc": "Apprise Notifications",
        "image_path_mask": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-{TYPE}-{XY}{EXTENSION}",
        "app_id": "Apprise",
        "theme": "default",
        "image_url_logo": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-logo.png",
        "image_url_mask": "https://github.com/caronc/apprise/raw/master/apprise/assets/themes/{THEME}/apprise-{TYPE}-{XY}{EXTENSION}"
    },
    "schemas": [
        {
            "service_name": "Boxcar",
            "setup_url": "https://github.com/caronc/apprise/wiki/Notify_boxcar",
            "service_url": "https://boxcar.io/",
            "protocols": null,
            "secure_protocols": [
                "boxcar"
            ]
        },
        {
            "service_name": "Discord",
            "setup_url": "https://github.com/caronc/apprise/wiki/Notify_discored",
            "service_url": "https://discordapp.com/",
            "protocols": null,
            "secure_protocols": [
                "discord"
            ]
        },
        {
            "service_name": "E-Mail",
            "setup_url": "https://github.com/caronc/apprise/wiki/Notify_email",
            "service_url": null,
            "protocols": [
                "mailto"
            ],
            "secure_protocols": [
                "mailtos"
            ]
        },

        "... etc, ..."

    ],
    "details": {
        "templates": {
           ...
        },
        "tokens": {
           ...
        },
        "args": {
           ...
        },
        "kwargs": {
           ...
        },
    },
}
```
The idea behind the **details()** function is that it allows developers to pass details back through their program letting their users know what notifications are supported. Thus as this library deprecates and introduces new notification services, calling front end applications (built around the **details()** function) can automatically serve this information back to their user base.

More detailed information about this object can be found [[here|Development_Apprise_Details]].

## The Apprise Asset Object
The apprise object allows you to customize your alarms by offering it different images, different sources and different themes. Different notification services support different ways of passing images into it (and some don't support images at all).  Apprise offers a way of supporting both local and hosted images and looks after passing the correct one to the correct service (when requested).

Even when you're just using the **Apprise()** object, behind the scenes a generic **AppriseAsset()** object is created which retrieves all of it's information from this path: https://github.com/caronc/apprise/tree/master/apprise/assets/themes/default (which is the _default_ theme directory).

A default **AppriseAsset()** object might have the following defined in it:

| Variable | Default | Type   | Description |
| -------- | ------- | ------ | ----------- |
| **app_id**   | _Apprise_ | String | A Short Identifier defining the name of the application. |
| **app_desc** | _Apprise Notifications_ | String | A brief way of describing your notification system 
| **app_url** | _https://github.com/caronc/apprise_ | String | The URL someone could go to to find more information about your application if they so desired. 
| **image_url_mask** | `https://github.com/caronc/apprise/raw/master`<br/> `/apprise/assets/themes/{THEME}/apprise-{TYPE}-{XY}{EXTENSION}` | String | A URL accessible from the internet that contains the images you want your notifications to reference.  The URL should make use of available TEMPLATES MASKS that are encapsulated in **{}** brackets.
| **image_path_mask** | `abspath(join(` <br/>`   dirname(__file__),`<br/> `   'assets', `<br/> `   'themes', '{THEME}', `<br/> `   'apprise-{TYPE}-{XY}{EXTENSION}',`<br/> `   ))`<br/>  | String | A locally accessible path that contains the images you want your notifications to reference.  The path should make use of available TEMPLATES MASKS that are encapsulated in **{}** brackets. <br/>**Note**: Don't let the python code above confuse you.  It is used to dynamically figure out the path relative to where you installed apprise to so that it can point to the image files the product ships with.

The **AppriseAsset()** object also performs some dynamic _templating_ of the specified image and URL paths. First I'll explain the template values, and then I'll explain how it works:

| Template Value   | Variable | Type | Default | Description |
| ---------------- | -------- | ---- | ------- | ----------- |
| **{THEME}** | **theme** | String | _default_ | The theme to reference. |
| **{EXTENSION}** | **default_extension** | String | _.png_ | The image file extension |
| **{TYPE}** |  |  |   | The type of notification being preformed. For example, if the user calling the notify() function specifies a _notify_type_ of _NotifyType.WARNING_, the string _warning_ would be placed as the _{TYPE}_  |
| **{XY}** |  |  |   | The image size to use which is in the format of **AAxBB** (as an example 72x72). Depending on the notification service being called; this value will vary.  If you plan on defining your own images, you should facilitate the sizes: **32x32**, **72x72**, **128x128**, and **256x256**|

Everytime the **notify()** function is called from the Apprise object, it uses the URL and/or local path and applies all of the templated masked values so that it can figure out what image to display. Here is an example how one might over-ride apprise to suit their own custom project needs:
```python
# Import this library
import apprise

# Create our AppriseAsset and populate it with some of our new values:
asset = apprise.AppriseAsset(
   # The following would allow you to support:
   # C:\Path\To\My\Images\info-32x32.jpeg
   # C:\Path\To\My\Images\warning-72x72.jpeg
   # etc...
   image_path_mask="C:\Path\To\My\Images\{TYPE}-{XY}{EXTENSION}",
   default_extension=".jpeg"
)

# Change our name a bit:
asset.app_id = "My App"
asset.app_desc = "My App Announcement"
asset.app_url = "http://nuxref.com/"

# create an Apprise instance and assign it our asset we created:
apobj = apprise.Apprise(asset=asset)

# At this point you can use the Apprise() object knowing that all of the
# default configuration has been over-ridden.
```

## The Apprise Notification Object
The **[[The Apprise Object|Development_API#the-apprise-object]]** actually already does a really good managing these for you.  But if you want to manage the notifications yourself here is how you can do it:

```python
# Import this library
import apprise

# Instantiate an object. This is what the apprise object
# would have otherwise done under the hood:
 obj = apprise.Apprise.instantiate('glib://')

# Now you can use the notify() function to pass notifications.
# notify() is similar to Apprise.notify() except the overhead of
# of tagging is not present.  There also no handling of the
# the text input type (HTML, MARKUP, etc).  This is on you
# to manipulate before passing in the content.
obj.notify(
    body=u"A test message",
    title=u"a title",
)

# send() is a very low level call which directly posts the
# body and title you specify to the remote notification server
# There is NO data manipulation here, no overflow handling
# nothing.  But this allows you to free form your own
# messages and pass them along using the apprise handling
obj.send(
    body=u"A test message",
    title=u"a title",
)
```