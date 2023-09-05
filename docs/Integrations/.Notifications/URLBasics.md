# Apprise URL Basics

## The Apprise URL

Apprise URLs are the blueprints used let the application know where to relay your notification(s) through. They follow a simple convention:
* `service://configuration/?parameters`

### Service
The `service://` you specify determines which Apprise plugin will get loaded.  For example, an Email address uses the service id of `mailto://` (and `mailtos://` for secure emails).

[[Click here|Home#notification-services]] to see a list of supported services supported by Apprise.

### Configuration
Most services require a different set of configuration (depending on what it is).  All configuration can be found right after the `service://` declaration.  You need to read up on the notification you're trying to set up to know what you set here.  This can contain anything from _API Keys_, _passwords_, _hostnames_, etc.

## Parameters
These are completely optional to use; but sometimes they grant you more abilities.
Additional parameters always start after the first question mark (**?**) defined in the Apprise URL.  Here is where you can over-ride some global system settings in addition to treating it as an alternative to _Core Configuration_ options. 

### Global Parameter Breakdown
| Variable    | Description
| ----------- | -----------
| overflow    | This parameter can be set to either `split`, `truncate`, or `upstream`.  This determines how Apprise delivers the message you pass it. By default this is set to `upstream` <br/> :information_source: `upstream`: Do nothing at all; pass the message exactly as you received it to the service.<br/> :information_source: `truncate`: Ensure that the message will fit within the service's documented upstream message limit.  If more information was passed then the defined limit, the overhead information is truncated.<br/> :information_source: `split`: similar to truncate except if the message doesn't fit within the service's documented upstream message limit, it is split into smaller chunks and they are all delivered sequentially there-after.
| format      | This parameter can be set to either `text`, `html`, or `markdown`.  Some services support the ability to post content by several different means.  The default of this varies (it can be one of the 3 mentioned at any time depending on which service you choose).  You can optionally force this setting to stray from the defaults if you wish. If the service doesn't support different types of transmission formats, then this field is ignored.
| verify      | External requests made to secure locations (such as through the use of `https`) will have certificates associated with them.  By default, Apprise will verify that these certificates are valid; if they are not then no notification will be sent to the source.  In some occasions, a user might not have a certificate authority to verify the key against or they trust the source; in this case you will want to set this flag to `no`.  By default it is set to `yes`.
| cto         | This stands for Socket Connect Timeout. This is the number of seconds Requests will wait for your client to establish a connection to a remote machine (corresponding to the _connect()_) call on the socket. The default value is 4.0 seconds.
| rto         | This stands for Socket Read Timeout. This is the number of seconds the client will wait for the server to send a response. The default value is 4.0 seconds.