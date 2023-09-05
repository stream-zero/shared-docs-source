## XMPP Notifications
* **Source**: https://xmpp.org/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message

XMPP Support requires **sleekxmpp** to work:
```bash
pip install sleekxmpp
```

### Syntax
Valid syntaxes are as follows:
* `xmpp://{user}/{password}@{hostname}`
* `xmpps://{user}/{password}@{hostname}`
* `xmpp://{user}/{password}@{hostname}/{jid}`
* `xmpp://{user}/{password}@{hostname}/{jid1}/{jid2}/{jidN}`

Secure connections should be referenced using **xmpps://** where as insecure connections should be referenced via **xmpp://**.

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| hostname    | Yes      | The server XMPP is listening on.
| port        | No       | The port the XMPP server is listening on By default the port is **5222** for **xmpp://** and **5223** for the secure **xmpps://** references.
| userid      | No       | The account login used to build the JID with if one isn't specified.
| password    | Yes      | The password associated with the XMPP Server.
| jid         | No       | The JID account to associate/authenticate with the XMPP Server. This is automatically detected/built from the {userid} and {hostname} if it isn't specified.
| xep         | No       | The XEP specifications to include.  By default **xep_0030** (Service Discovery) and **xep_0199** (XMPP Ping) if nothing is specified.
| to          | No       | The JID to notify

#### Example
Send a XMPP notification to our server listening on port 5223:
```bash
# Assuming the xmpp {hostname} is localhost
# Assuming the jid is user@localhost
#  - constructed using {hostname} and {userid}
# Assuming the xmpp {password} is abc123
apprise -vv -t "Test Message Title" -b "Test Message Body" \
   xmpp://user:abc123@localhost
```
