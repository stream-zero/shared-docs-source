# A Basic Apprise Notification Example
This example shows a basic template of how one might build a Notification Service that does a task as simple as writing to `stdout` (Standard Out)

It's very important to save the `apprise/plugins/NotifyServiceName.py` to be exactly the name of the `NotifyServiceName` class you define within it.  In this example, the class is `NotifyDemo`.  This implies that the filename to activate this (and make it usable in Apprise) must be called `apprise/plugins/NotifyDemo.py`.

## The Code
```python
# -*- coding: utf-8 -*-
from .NotifyBase import NotifyBase
from ..AppriseLocale import gettext_lazy as _
from ..common import NotifyType


class NotifyDemo(NotifyBase):
    """
    A Sample/Demo Notifications
    """

    # The default descriptive name associated with the Notification
    # _() allows us to support future (language) translations
    service_name = _('Apprise Demo Notification')

    # The default protocol/schema
    # This will be what triggers your service to be activated when
    # protocol:// is specified (in example demo:// will activate
    # this service).
    protocol = 'demo'

    # A URL that takes you to the setup/help of the specific protocol
    # This is for new-comers who will want to learn how they can
    # use your service.  Ideally you should point to somewhere on
    # the 'https://github.com/caronc/apprise/wiki/
    setup_url = 'https://github.com/caronc/apprise/wiki/Notify_Demo'

    # This disables throttling by default for this simple plugin.
    request_rate_per_sec = 0

    #
    # Templating Section
    #
    # 1. `templates`: Identify the way you can use your plugin.
    #    This example is rather simple, so there isn't really much to do
    #    here.  Check out the other demo's to see where this gets a bit more
    #    advanced.
    #
    templates = (
        '{schema}://',
    )

    # For the reasons above, we only need to identify apikey here:
    def __init__(self, **kwargs):
        """
        Initialize Demo Object

        """
        # Always call super() so that parent clases can set up.  Make
        # sure to only pass in **kwargs
        super(NotifyDemo, self).__init__(**kwargs)

        #
        # Now you can write any initialization you want; if you have nothing to
        # initialize then you can skip the definition of the __init__()
        # function all together.
        #
        return

    def url(self, *args, **kwargs):
        """
        Returns the URL built dynamically based on specified arguments.
        """

        # Always call self.url_parameters() at some point.
        # This allows your Apprise URL to handle the common/global
        # parameters that are used by Apprise. This is for consistency
        # more than anything:
        params = self.url_parameters(*args, **kwargs)

        # Basically we need to write back a URL that looks exactly like
        # the one we parsed to build from scratch.

        # If we can parse a URL and rebuild it the way it once was,
        # Administrators who use Apprise don't need to pay attention to all
        # of your custom and unique tokens (from on service to another).
        # they only need to store Apprise URL's in their database.

        return '{schema}://?{params}'.format(
            schema=self.protocol,
            params=self.urlencode(params),
        )

    def send(self, body, title='', notify_type=NotifyType.INFO, **kwargs):
        """
        Perform Demo Notification
        """

        #
        # Always call throttle before any remote server i/o is made
        #
        self.throttle()

        # Perform your notification here; in this example, we just send the
        # output to `stdout`:
        print('{type} - {title} - {body}'.format(
            type=notify_type, title=title, body=body))

        return True

    @staticmethod
    def parse_url(url):
        """
        Parses the URL and returns enough arguments that can allow
        us to re-instantiate this object.

        """
        # If you're URL does not define what is considered a valid host after
        # your' schema/protocol such as this plugin example (demo://) where the
        # hostname isn't even required, then set the verify_host to False
        results = NotifyBase.parse_url(url, verify_host=False)
        if not results:
            # We're done early as we couldn't parse the URL
            return results

        # Handle any additional parsing here if you want
        # make sure to write all your changes/updates back into the results
        # dictionary

        # The contents of our results (a dictionary) will become
        # the arguments passed into the __init__() function we defined above.
        return results
```

## Testing
You can test your **NotifyDemo** class using the `demo://` schema:
```bash
# using the `apprise` found in the local bin directory allows you to test
# the new plugin right away. Use the `demo://` schema we defined.  You can also
# set a couple of extra `-v` switches to add some verbosity to the output:
./bin/apprise -vvv -t test -b message demo://
```