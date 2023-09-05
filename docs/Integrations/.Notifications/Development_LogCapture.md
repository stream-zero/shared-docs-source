# LogCapture
`apprise.LogCapture()` allows you to capture all of the logging information within your program.  You may wish to relay the information to screen, or maybe you just want to have a look at it's contents when one or more notifications fail to be delivered.

The class can capture information into a temporary (or permanent) log file, or you can just capture it straight into memory.  It's incredibly easy to use too.

## Learn by Example
### Capture to Memory
**Your code changes from this:**
```python
import apprise

# Instantiate our object
apobj = apprise.Apprise()

# add your configuration
apobj.add('mailto://user:pass@example.com')
apobj.add('kodi://kodi.example.com')

# Send our notification
apobj.notify(title="hello", body="world")
```

**To this:**
```python
import apprise

# Instantiate our object
apobj = apprise.Apprise()

# add your configuration
apobj.add('mailto://user:pass@example.com')
apobj.add('kodi://kodi.example.com')

# Prepare a LogCapture() that sets logging to INFO. This means your
# logs will include all INFO, WARNING, ERROR, and CRITICAL entries
with apprise.LogCapture(level=apprise.logging.INFO) as output:
    # Send our notification
    apobj.notify(title="hello", body="world")

    # At this point of our code, we can have a look at our output
    # to see all of the logging that surrounded our notification(s)
    # Note that `output` is a StringIO object:
    print(output.getvalue())
```

### Capture to File
The class can write directly to memory (as you saw above) where content was written into a `io.StringIO` object.  You can also write content into a temporary file as well:
```python
# In this example:
# - we write to a log file /tmp/apprise.tmp
# - we only capture WARNING, ERROR, and CRITICAL entries
# - we assume that `apobj` is an Apprise object already loaded with a few notification
#   services.
with apprise.LogCapture(path='/tmp/apprise.tmp', level=apprise.logging.WARNING) as output:
    # Send our notification
    apobj.notify(title="hello", body="world")

    # At this point of our code, we can have a look at our output
    # to see all of the logging that surrounded our notification(s)
    # Note that `output` is a File object because we specified the `path` above
    print(output.read())

# What is VERY important to note is that whatever was specified with the `path=` above
# entry (in this case /tmp/apprise.tmp) will no longer exist at this point (outside of the
# `with` block).
```

If you want to write to a file and have it persist after your `with` block has completed, the syntax is very similar, you just need to add `delete=False` to the **LogCapture()** initialization like so:
```python
# In this example:
# - we write to a log file /tmp/apprise.tmp
# - we only capture WARNING, ERROR, and CRITICAL entries
# - we assume that `apobj` is an Apprise object already loaded with a few notification
#   services.
with apprise.LogCapture(
        path='/tmp/apprise.persistent', level=apprise.logging.WARNING,
        delete=False) as output:

    # Send our notification
    apobj.notify(title="hello", body="world")

    # At this point of our code, we can have a look at our output
    # to see all of the logging that surrounded our notification(s)
    # Note that `output` is a File object because we specified the `path` above
    print(output.read())

# tmp/apprise.persistent will exist still on disk at this point
```

## Class Details

- By default if no `level=` is specified, then the log level you set globally in your program is used.


### Tricks
Format your logs for HTML:
```python
# The default fmt for LogCapture() is: '%(asctime)s - %(levelname)s - %(message)s'

# But you can use this to leverage how you want the content formatted; so you can
# build your HTML content in advance here if you like:
fmt = '<li><i class="log_time">%(asctime)s</i>' \
    '<i class="log_level">%(levelname)s</i>:' \
    '<p class="log_msg">%(message)s</p></li>'

# Now specify our format (and over-ride the default):
with apprise.LogCapture(level=apprise.logging.WARNING, fmt=fmt) as logs:
     apobj.notify("hello world")

     # Wrap logs in `<ul>` tag:
     html = '<ul class="logs">{}</ul>'.format(logs.getvalue())

     # Now `html` consists of a formatted code; keep in mind that
     # this solution isn't bulletproof as `%(message)s` isn't
     # pre-escaped/encoded.
```
