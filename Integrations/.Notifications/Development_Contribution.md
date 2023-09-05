# Introduction
Thanks to all who have landed on this page with the intent of contributing to the apprise library.  Any changes you make are going to easily make it upstream as long as there is there are:
* **Unit tests**: apprise is currently sitting at 100% test coverage.  The goal is to keep it this way! :slightly_smiling_face: 
* **PEP8 Compliance**: Following the [PEP 8 Style Guide for Python](https://www.python.org/dev/peps/pep-0008/) is a must.  Most editors have PEP8 plugins and allow you to keep everything compliant as you go.
* **Python 2.7 backwards support**.  I'd like to support Python 2.7 for as long as i can only because there is a huge amount of servers still using this today. When you push your code upstream, a code-runner will test all this for you if you're uncertain.

The following should get you all set up:
```bash
# Install our apprise development requirements
pip install --requirement requirements.txt --requirement dev-requirements.txt
```

# Building Your Own Notification Plugin

It basically boils down to this:
```python
# Whatever your class is called that inherits NotifyBase, make sure
# to also make that the filename as well.  Below is an example of what
# plugins/NotifyFooBar.py might look like:

from .NotifyBase import NotifyBase
from ..AppriseLocale import gettext_lazy as _

class NotifyFooBar(NotifyBase):
    # Define a human readable description of our object
    # _() is wrapped for future language translations
    service_name = _('FooBar Notification')

    # Our protocol:// Apprise will detect and hand off further
    # parsing of the URL to your parse_url() function you write:
    protocol = 'foobar'

    # Where can people get information on how to use your plugin?
    setup_url = 'https://github.com/caronc/apprise/wiki/Notify_FooBar'

    def __init__(self, **kwargs):
       """
       Your class initialization
       """
       super(NotifyFooBar, self).__init__(**kwargs)

    def url(self, privacy=False, *args, **kwargs):
       """
       Always be able to build your Apprise URL exactly the way you parsed
       it in the parse_url() function
       """
       return self.protocol + "://"

    def send(self, body, title='', **kwargs):
        """
        Perform Notification here using the provided body and title
        """

        print("Foobar Notification Sent to STDOUT")

        # always return True if your notification was sent successfully
        # otherwise return False if it failed.
        return True

    @staticmethod
    def parse_url(url):
        """
        The URL that starts with foobar://
        """
        # NotifyBase.parse_url() will make the initial parsing of your string
        # very easy to use. It will tokenize the entire URL for you.  The tokens
        # are then passed into your __init__() function you defined to generate
        # you're object
        tokens = NotifyBase.parse_url(url, verify_host=False)

        # massage your tokens here

        return tokens
```

With respect to the above example:
- You just need to create a single notification python file as `/plugins/NotifyServiceName.py`
- Make sure you call the class inside `NotifyServiceName` and inherit from `NotifyBase`
- Make sure your class object name is the same as the filename you create.  This is very important!
- From there you just need to at a bare minimum define:
  - **the class objects**:
    - `service_name`: A string that acts as a default descriptive name associated with the Notification
    - `service_url`: A string that identifies the platform/services URL.  This is used purely as meta data for those who seek it. But this field is required.
    - `protocol` and/or `secure_protocol`: A string (or can be a list of strings) identifying the scheme:// keyword that apprise uses to map to the Plugin Class it's associated with.  For example, `slack` is mapped to the `NotifySlack` class found in the [`/plugins/NotifySlack.py` file](https://github.com/caronc/apprise/blob/master/apprise/plugins/NotifySlack.py). This must be defined so that people can leverage your plugin. You must choose a protocol name that isn't already taken.
    - `setup_url`:  A string that identifies the URL a user can use to get information on how to use this Apprise Notification.  At this time I'm just creating URLs that point back to my GitHub Wiki page.

  - **the functions**:
     1. `__init__(self, *args, **kwargs)`: Define what is required to initialize your object/notification. Just make sure to cross reference it in the `template*` stuff (explained above).
     1. `send(self, body, title='', *args, **kwargs)` at a bare minimum. See other Notify scripts as to how you can expand on this.  But just take the `body` and `title` and construct your message and send it.  
     1. `url()`.  This function must be able to construct a URL that would re-generate a copy of the exact same object if passed into `parse_url()`
     1. `parse_url(url)`: this is a **staticmethod** that parses the Apprise URL and breaks it into a dictionary of the components.  The dictionary it creates must map up to what the `__init__()` takes as it's arguments
     
  - **Putting it together**:
       ```python
       from Apprise.plugins import NotifyMyService
       import Apprise
       
       # Apprise is nothing but a manager of individual plugins
       a = Apprise()

       # Under the table, add just calls the NotifyMyService.parse_url() and passes
       # the result set into your new services __init__() function.
       a.add('myscheme://details/?more=details&are=optional')

       # There would be one new service added to our manager now:
       assert(len(a), 1)

       # you can directly access the notification services if you wanted to this way:
       # index element 0 exists because we added it successfully above (assuming you properly
       # followed all the rules above):
       assert isinstance(a[0], NotifyMyService)
       
       # So we know we can access the notification, then this would create a second notification service:
       # The only thing add does is match the schema up with the class it should use and then call it's
       # NotifyServiceName.parse_url()
       
       # So parse_url() is in charge of preparing all of the arguments we can use to instantiate our object
       #  With that, it can then do Object(**parse_url_response)
       a.add(a[0].url())

       # Hopefully this is making sense so far.... But now we've called add() twice... so we'll ahve 2 entries
       # and if we built our 3 core functions (__init__, `url()` and `parse_url()` correctly, they should be almost
       # copies of one another (yet 2 instances)
       assert(len(a) == 2)
      
       # URLs are the same
       assert(a[0].url() == a[1].url())
      
       # that's really all there is too it... when you call `a.notify()`; there is some functions and tools
       # that handle some common things, but at the end of the day, it will call your `send()` function
       # you defined.
       ```

  - **Putting it together without the overhead of the Apprise manager**:
       ```python
       from Apprise.plugins import NotifyMyService
       
       # You can do this manually too if you want to test around the overhead
       # of the Apprise manager itself:
       results = NotifyMyService.parse_url('myscheme://details/?more=details&are=optional')

       # A simple dictionary of all of our arguments ready to go:
       assert isinstance(results, dict)

       # Now instantiate your object:
       obj = NotifyMyService(**results)

       # If you build your NotifyMyService correctly, then you should be able
       # to build a copy of the object perfectly using it's url() call
       # Now instantiate your object:
       clone_results = NotifyMyService.parse_url(obj.url())

       # A simple dictionary of all of our arguments ready to go:
       assert isinstance(clone_results, dict)

       # if you did this properly, you'll have a second working instance
       # you can work with (this is a great test to make sure you coded
       # your new notification service perfect)
       clone = NotifyMyService(**clone_results)

       # The best test of all to ensure you did everything well; both the
       # clone and original object you created should produce the same
       # url()
       assert clone.url() == obj.url()
       ```

      Any other functions you want to define can be done to you hearts content (if it helps with organization, structure, etc)
      Just avoid conflicting with any function written in `NotifyBase()` and `URLBase()`

      If your service is really complex (and requires a lot of code), maybe it's easier to split your code into multiple files. This is how i handled the [NotifyFCM plugin i wrote](https://github.com/caronc/apprise/tree/master/apprise/plugins/NotifyFCM) which was based on Google's version.
- Don't be afraid to just copy and paste another already created service and update it for your own usage. 
    - [plugins/NotifyJSON.py](https://github.com/caronc/apprise/blob/master/apprise/plugins/NotifyJSON.py) is a simple reference you use (not too complicated).
    - [plugins/NotifyGitter.py](https://github.com/caronc/apprise/blob/master/apprise/plugins/NotifyGitter.py) is a bit more complicated, but introduces an upstream API interface with attachments.
    - [plugin/NotifyFCM](https://github.com/caronc/apprise/tree/master/apprise/plugins/NotifyFCM) is a much more complex design but illustrates how you can build your notification into smaller components.
    - All in all.... just have a look at the [plugins directory](https://github.com/caronc/apprise/tree/master/apprise/plugins) and feel free to use this as a reference to help structure and solve your own notification service you might be building

You can have a look at the NotifyBase object and see all of the other entries you can define that Apprise can look after for you (such as restricting the message length, title length, handling TEXT -> Markdown, etc). You can also look at how other classes were built.

## Demo Plugins
Some people learn by just working with already pre-written code.   So here are some sample plugins I put together that you can copy and paste and start your own notification service off of.  Each plugin tries to explain with a lot of in-line code comments what is going on and why things are the way they are:

- [A Very Basic Plugin](DemoPlugin_Basic) That simply posts the message to stdout
- [An HTTP Web Request Based Plugin](DemoPlugin_WebRequest)

# Testing
There is a few tools that work right out of the box in the root of any branch you're working in. These tools allow you to clone the Apprise branch and immediately test your changes without having to install anything into your environment.

More details can be found [here](https://github.com/caronc/apprise/tree/master/bin) about them.
