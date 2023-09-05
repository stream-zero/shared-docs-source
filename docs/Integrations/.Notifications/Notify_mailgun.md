## Mailgun Notifications
* **Source**: https://www.mailgun.com/
* **Icon Support**: No
* **Attachment Support**: Yes
* **Message Format**: HTML
* **Message Limit**: 32768 Characters per message

### Account Setup
You can create an account for free [on their website](https://www.mailgun.com/) but it comes with restrictions.

For each domain you set up with them, you'll be able access them all from your dashboard once you're signed in.  Here is a [quick link](https://app.mailgun.com/app/domains) to it. If you're using a free account; at the very least you will be able to see your _sandbox domain_ here. From here you can also acquire your **API Key** associated with each domain you've set up.

### Syntax
Valid syntaxes are as follows:
* **mailgun**://**{user}**@**{domain}**/**{apikey}**/
* **mailgun**://**{user}**@**{domain}**/**{apikey}**/**{email}**/
* **mailgun**://**{user}**@**{domain}**/**{apikey}**/**{email1}**/**{email2}**/**{emailN}**/

You may also identify your region if you aren't using the US servers like so:
* **mailgun**://**{user}**@**{domain}**/**{apikey}**/?**region=eu**

You can adjust what the Name associated with the From email is set to as well:
* **mailgun**://**{user}**@**{domain}**/**{apikey}**/?**From=Luke%20Skywalker**

### Email Extensions
If you wish to utilize extensions, you'll need to escape the addition/plus (+) character with **%2B** like so:<br/>
``mailgun://{user}@{domain}/{apikey}/chris%2Bextension@example.com``

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| apikey      | Yes      | The API Key associated with the domain you want to send your email from. This is available to you after signing into their website an accessing the [dashboard](https://app.mailgun.com/app/domains).
| domain      | Yes      | The Domain you wish to send your email from; this domain must be registered and set up with your mailgun account.
| user        | Yes      | The user gets paired with the domain you specify on the URL to make up the **From** email address your recipients receive their email from.
| email       | No       | You can specify as many email addresses as you wish. Each address you identify here will represent the **To**.<br/>**Note:** Depending on your account setup, mailgun does restrict you from emailing certain addresses.
| region      | No       | Identifies which server region you intend to access. Supported options here are **eu** and **us**. By default this is set to **us** unless otherwise specified. This specifically affects which API server you will access to send your emails from.
| from        | No       | This allows you to identify the name associated with the **From** email address when delivering your email.
| to          | No       | This is an alias to the email variable. You can chain as many (To) emails as you want here separating each with a comma and/or space.
| cc          | No       | Identify address(es) to notify as a Carbon Copy.
| bcc          | No       | Identify address(es) to notify as a Blind Carbon Copy.

#### Example
Send a mailgun notification to the email address bill.gates@microsoft.com
```bash
# Assuming the {domain} we set up with our mailgun account is example.com
# Assuming our {apikey} is  4b4f2918fd-dk5f-8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise mailgun:///noreply@example.com/4b4f2918fd-dk5f-8f91f/bill.gates@microsoft.com
```