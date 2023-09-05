# A Web Request Apprise Notification Example
This example shows a basic template of how one might build a Notification Service that is required to connect to an upstream web service and send a payload.

It's very important to save the `apprise/plugins/NotifyServiceName.py` to be exactly the name of the `NotifyServiceName` class you define within it.  In this example, the class is `NotifyDemo`.  This implies that the filename to activate this (and make it usable in Apprise) must be called `apprise/plugins/NotifyDemo.py`.

## The Code
```python
import requests
import json
from .NotifyBase import NotifyBase
from ..URLBase import PrivacyMode
from ..common import NotifyType
from ..AppriseLocale import gettext_lazy as _


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

    #
    # Templating Section
    #
    # 1. `templates`: Identify the way you can use your template. Use {tokens}
    #    that map back to what is defined in your `template_tokens` and
    #    `template_arg`. Today this is used for reference only, but in the
    #    future, this could be used to help validate and build easy to use
    #    wizards for people to build their Apprise URL's with.
    #
    # 2. `template_tokens`:  You must identify all `tokens` (except
    #     *args and **kwargs) that are passed into:
    #           def `__init__(self, tokenA, tokenB, tokenN, *args, **kwargs)
    #                                 ^        ^       ^
    #                                 |        |       |
    #
    # 3. `template_args`: This is more applicable to your Apprise URL.
    #     It's similar to the `template_tokens` except you can also identify
    #     alias entries (to ones already found in `template_tokens` here. You
    #     can also identify arguments that are optional (and otherwise take
    #     on a default setting if not otherwise specified. This section is
    #     entirely optional, but by adding it, you can greatly add some
    #     handy features to the yaml configuration.  You also need to handle
    #     your own processing of what you define here in the `parse_url()`
    #     function.
    #
    #     Here is an example Apprise demo:// URL with 2 optional arguments
    #     specified.
    #        demo://user:pass@hostname?option1=value&option2=value
    #                                     ^            ^
    #                                     |            |
    #                                    arg          arg
    #     In the above case, if option1 an option2 are actual valid arguments
    #     that can (optionally) exist on the Apprise URL, then they would be
    #     identified here.
    #
    # 4. `template_kwargs`: This is only needed in some cases and not covered
    #    in this example. This allows you to let your user building your
    #    Apprise URL to define their own arguments (args) AND assign them
    #    values.
    #
    #    An example of why you'd want to do this would be say an HTTP your
    #    service may call.  You may want to let them define their own custom
    #    headers and assign the values.  A great example of when/how this
    #    is used is in the XML and JSON Notification Services.

    templates = (
        '{schema}://{host}/{apikey}',
        '{schema}://{host}:{port}/{apikey}',
        '{schema}://{user}@{host}/{apikey}',
        '{schema}://{user}@{host}:{port}/{apikey}',
        '{schema}://{user}:{password}@{host}/{apikey}',
        '{schema}://{user}:{password}@{host}:{port}/{apikey}',
    )

    # Define our tokens; these are the minimum tokens required required to
    # be passed into this function (as arguments). The syntax appends any
    # previously defined in the base package and builds onto them
    template_tokens = dict(NotifyBase.template_tokens, **{
        # All tokens require:
        # - name: The name of the variable.  It must be wrapped with
        #         the gettext_lazy() function.  Ideallly you should have
        #         the following defined at the head of your Service:
        #
        # - type: The type of data expected from this field.  The options
        #         are (always lowercase):
        #            1. 'string'
        #            2. 'int'
        #            3. 'bool'
        #            4. 'float'
        #
        #         You can also prepend 'list:' or 'choice:' to the types
        #         above (e.g. 'list:string'). When you use these options
        #         you must provide a `values` directive.
        #
        # - required: By default any token is not considered required.
        #             But you can set this value (and set it to True) as
        #             a way of telling the users of your service that they
        #             must provide this option.
        #
        # - min: When using int/float, you can let your users know what
        #        the minimum expected value can be (otherwise there is no
        #        limit if this isn't specifed)
        #
        # - max: When using int/float, you can let your users know what
        #        the maximum expected value can be (otherwise there is no
        #        limit if this isn't specifed)
        #
        # - private: If this token represents a password, or apikey, or just
        #            in general something that no one looking over a shoulder
        #            should see, then set this to True.
        'host': {
            'name': _('Hostname'),
            'type': 'string',
            'required': True,
        },
        'port': {
            'name': _('Port'),
            'type': 'int',
            'min': 1,
            'max': 65535,
        },
        'user': {
            'name': _('Username'),
            'type': 'string',
        },
        'password': {
            'name': _('Password'),
            'type': 'string',
            'private': True,
        },
        'apikey': {
            'name': _('apikey'),
            'type': 'string',
            'private': True,
        },

    })

    # Not to add any confusion, but the following arguments are always
    # automatically set and available to you (always) and therefore
    # do not need to be identified in the __init__() call; they are:
    #   - host     : Always identifies the hostname (if parsed from URL)
    #   - password : Identfies the password (if parsed from URL)
    #   - user     : Identifies the username (if parsed from the URL)
    #   - port     : Identifies the port (if parsed from the URL)
    #   - fullpath : Identifies the full path specified (parsed from URL)
    #
    # For the reasons above, we only need to identify apikey here:
    def __init__(self, apikey, **kwargs):
        """
        Initialize Demo Object

        """
        # Always call super() so that parent clases can set up.  Make
        # sure to only pass in **kwargs
        super(NotifyDemo, self).__init__(**kwargs)

        # At this point we already have access to (this all got parsed
        # automatially from the super() call above:
        #  - self.user
        #  - self.password
        #  - self.host
        #  - self.port

        #
        # Now you can write any initialization you want
        #

        # You may want to save your apikey read from the URL
        # so we can use it later in the `send()` and `url()` function.

        # You will want to raise a TypeError() in the event any of the
        # provided data is invalid:
        self.apikey = apikey
        if not self.apikey:
            msg = 'An invalid Demo API Key ' \
                  '({}) was specified.'.format(apikey)
            self.logger.warning(msg)
            raise TypeError(msg)

        self.apikey = apikey

        return

    def url(self, privacy=False, *args, **kwargs):
        """
        Returns the URL built dynamically based on specified arguments.
        """

        # Always call self.url_parameters() at some point.
        # This allows your Apprise URL to handle the common/global
        # parameters that are used by Apprise. This is for consistency
        # more than anything:
        params = self.url_parameters(privacy=privacy, *args, **kwargs)

        # Basically we need to write back a URL that looks exactly like
        # the one we parsed to build from scratch.

        # If we can parse a URL and rebuild it the way it once was,
        # Administrators who use Apprise don't need to pay attention to all
        # of your custom and unique tokens (from on service to another).
        # they only need to store Apprise URL's in their database.

        # The below uses a combination of the following to rebuild the
        # URL exactly as it was:
        #  - self.user
        #  - self.password
        #  - self.host
        #  - self.port
        #  - self.apikey   <- the one we defined

        # Determine Authentication
        auth = ''
        if self.user and self.password:
            auth = '{user}:{password}@'.format(
                user=self.quote(self.user, safe=''),
                password=self.pprint(
                    self.password, privacy, mode=PrivacyMode.Secret, safe=''),
            )
        elif self.user:
            auth = '{user}@'.format(
                user=self.quote(self.user, safe=''),
            )

        return '{schema}://{auth}{hostname}{port}/{apikey}/?{params}'.format(
            schema=self.protocol,
            auth=auth,
            # never encode hostname since we're expecting it to be a valid one
            hostname=self.host,
            port='' if self.port is None else ':{}'.format(self.port),
            # Always quote/encode any variable you're passing back into the URL
            apikey=self.quote(self.apikey, safe='/'),
            params=self.urlencode(params),
        )

    def send(self, body, title='', notify_type=NotifyType.INFO, **kwargs):
        """
        Perform Demo Notification
        """

        # Prepare our headers
        # In this example, we're going to place the API Key
        # into the payload through the headers:
        headers = {
            'User-Agent': self.app_id,
            'Content-Type': 'application/xml',
            # Here is were we leverage a token provided in the Apprise URL
            # we parsed:
            'Authorization': 'Bearer {}'.format(self.apikey),
        }

        # Now we just assemble some basic auth (if required)
        auth = None
        if self.user:
            auth = (self.user, self.password)

        url = 'http://{}'.format(self.host)
        if isinstance(self.port, int):
            url += ':%d' % self.port

        # Define our payload we plan on sending
        payload = {
            'type': notify_type,
            'title': title,
            'body': body,
        }

        # It helps to add some logging if ou want
        self.logger.debug('Demo POST URL: %s', url)
        self.logger.debug('Demo Payload: %s', str(payload))

        #
        # Always call throttle before any remote server i/o is made
        #
        self.throttle()

        try:
            # A simple request object
            r = requests.post(
                url,
                data=json.dumps(payload),
                headers=headers,
                auth=auth,

                # These variables are defined by the parent
                # classes. The timeout is very important!
                verify=self.verify_certificate,
                timeout=self.request_timeout,
            )

            if r.status_code != requests.codes.ok:
                # We had a problem
                status_str = \
                    self.http_response_code_lookup(r.status_code)

                self.logger.warning(
                    'Failed to send Demo notification: '
                    '{}{}error={}.'.format(
                        status_str,
                        ', ' if status_str else '',
                        r.status_code))

                self.logger.debug('Response Details:\r\n{}'.format(r.content))

                # Return; we're done
                return False

            else:
                self.logger.info('Sent Demo notification.')

        except requests.RequestException as e:
            self.logger.warning(
                'A Connection error occurred sending Demo '
                'notification to %s.' % self.host)
            self.logger.debug('Socket Exception: %s' % str(e))

            # Return; we're done
            return False

        return True

    @staticmethod
    def parse_url(url):
        """
        Parses the URL and returns enough arguments that can allow
        us to re-instantiate this object.

        """
        results = NotifyBase.parse_url(url)
        if not results:
            # We're done early as we couldn't parse the URL
            return results

        # Now fetch our api key from the path in the url.
        # This is identified as a `fullpath` argument in our results
        # we want to extract the first element
        try:
            # We need to store the 'apikey' id because that's what we
            # identified in our __init__() function
            results['apikey'] = \
                NotifyDemo.split_path(results['fullpath'])[0]

        except IndexError:
            # Force some bad values that will get caught in the __init__
            results['apikey'] = None

        # The contents of our results (a dictionary) will become
        # the arguments passed into the __init__() function we defined above.
        return results
```

## Testing
If you pasted the above file correctly into your Apprise library, you can test it with a tool such as netcat (`nc`).

In one terminal window you can set yourself up to listen on port `8080`:
```bash
# Listen on port 80 so we can watch apprise delivery our new payload
nc -l -p 8080
```

While in another terminal window you can test your **NotifyDemo** class using the `demo://` schema:
```bash
# using the `apprise` found in the local bin directory allows you to test
# the new plugin right away. Use the `demo://` schema we defined.  You can also
# set a couple of extra `-v` switches to add some verbosity to the output:
./bin/apprise -vvv -t test -b message demo://localhost:8080/myapikey
```

