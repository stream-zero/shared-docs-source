## XML HTTP POST Notifications
* **Source**: n/a
* **Icon Support**: No
* **Message Format**: XML
* **Attachment Support**: yes
* **Message Limit**: 32768 Characters per message

This is just a custom Notification that allows you to have this tool post to a web server as a simple XML string. This is useful for those who want to be notified via their own custom methods.

The format might look something like this:
```xml
<?xml version='1.0' encoding='utf-8'?>
<soapenv:Envelope
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <soapenv:Body>
        <Notification xmlns:xsi="http://nzbget.lead2gold.org/notify/NotifyXML-1.0.xsd">
            <Version>1.0</Version>
            <Subject>What A Great Movie Downloaded Successfully</Subject>
            <MessageType>info</MessageType>
            <Message>Plenty of details here...</Message>
       </Notification>
    </soapenv:Body>
</soapenv:Envelope>
```
The *MessageType* will be one of the following:
* **info**: An informative type message
* **success**: A successful report
* **failure**: A failure report
* **warning**: A warning report

### Syntax
Valid syntax is as follows:
* `xml://{hostname}`
* `xml://{hostname}:{port}`
* `xml://{user}:{password}@{hostname}`
* `xml://{user}:{password}@{hostname}:{port}`

The secure versions:
* `xmls://{hostname}`
* `xmls://{hostname}:{port}`
* `xmls://{user}:{password}@{hostname}`
* `xmls://{user}:{password}@{hostname}:{port}`

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The Web Server's hostname
| port        | No       | The port our Web server is listening on. By default the port is **80** for **xml://** and **443** for all **xmls://** references.
| user        | No       | If you're system is set up to use HTTP-AUTH, you can provide _username_ for authentication to it.
| password    | No       | If you're system is set up to use HTTP-AUTH, you can provide _password_ for authentication to it.
| method      | No       | Optionally specify the server http method; possible options are `post`, `put`, `get`, `delete`, and `head`.  By default if no method is specified then `post` is used.

#### Example
Send a XML notification to our web server listening on port 80:
```bash
# Assuming our {hostname} is xml.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   xml://xml.server.local
```
### Header Manipulation
Some users may require special HTTP headers to be present when they post their data to their server.  This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
```bash
# Below would set the header:
#    X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "xml://localhost:8080/path/?+X-Token=abcdefg"

# Multiple headers just require more entries defined:
# Below would set the headers:
#    X-Token: abcdefg
#    X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   "xml://localhost:8080/path/?+X-Token=abcdefg&+X-Apprise=is%20great"
```