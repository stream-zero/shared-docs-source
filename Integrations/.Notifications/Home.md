## Introduction
Apprise lets you send notifications to a large number of support notification services. The lightweight framework can be easily integrated into an of your python applications.  Or you can simply send notifications right from the command line.

It's primary design was to eliminate the inconsistencies in usage from one notification service to another. By harnessing a simple URL string, you can drive any of the 70+ supported services.

## Notification Services:
All of the notification services supported by Apprise can be found in this section.

**Legend**
* :books: : *Supports File Attachments*
* :calling: : *SMS Based Services*

Detailed instructions on how to connect your notification service(s) up with Apprise can be acquired by clicking on the appropriate link(s) below:
1. [[Apprise API|Notify_apprise_api]]
1. [[AWS SES :books:|Notify_ses]]
1. [[AWS SNS :calling:|Notify_sns]]
1. [[Boxcar|Notify_boxcar]]
1. [[ClickSend :calling:|Notify_clicksend]]
1. [[DAPNET|Notify_dapnet]]
1. [[DingTalk :calling:|Notify_dingtalk]]
1. [[Discord :books:|Notify_discord]]
1. [[D7 Networks :calling:|Notify_d7networks]]
1. [[E-Mail :books:|Notify_email]]
1. [[Emby|Notify_emby]]
1. [[Enigma2 Devices|Notify_enigma2]]
1. [[Faast|Notify_faast]]
1. [[FCM - (Google) Firebase Cloud Messaging|Notify_fcm]]
1. [[Flock|Notify_flock]]
1. [[Gitter|Notify_gitter]]
1. [[Google Chat|Notify_googlechat]]
1. [[Gotify|Notify_gotify]]
1. [[Growl|Notify_growl]]
1. [[Home Assistant|Notify_homeassistant]]
1. [[IFTTT|Notify_ifttt]]
1. [[Join|Notify_join]]
1. [[Kavenegar :calling:|Notify_kavenegar]]
1. [[KODI|Notify_kodi]]
1. [[Kumulos|Notify_kumulos]]
1. [[LaMetric Time/Clock|Notify_lametric]]
1. [[Mailgun :books:|Notify_mailgun]]
1. [[Matrix|Notify_matrix]]
1. [[Mattermost|Notify_mattermost]]
1. [[MessageBird :calling:|Notify_messagebird]]
1. [[Microsoft Teams|Notify_msteams]]
1. [[MQTT|Notify_mqtt]]
1. [[MSG91 :calling:|Notify_msg91]]
1. [[Nexmo :calling:|Notify_nexmo]]
1. [[Nextcloud Messaging|Notify_nextcloud]]
1. [[Nextcloud Talk|Notify_nextcloudtalk]]
1. [[Notica|Notify_notica]]
1. [[Notifico|Notify_notifico]]
1. [[Office 365|Notify_office365]]
1. [[OneSignal|Notify_onesignal]]
1. [[Opsgenie|Notify_opsgenie]]
1. [[Parse Platform|Notify_parseplatform]]
1. [[Popcorn Notify|Notify_popcornnotify]]
1. [[Prowl|Notify_prowl]]
1. [[PushBullet :books:|Notify_pushbullet]]
1. [[Pushed|Notify_pushed]]
1. [[Pushjet|Notify_pushjet]]
1. [[Pushover :books:|Notify_pushover]]
1. [[PushSafer :books:|Notify_pushsafer]]
1. [[Reddit|Notify_reddit]]
1. [[Rocket.Chat|Notify_rocketchat]]
1. [[Ryver|Notify_ryver]]
1. [[SendGrid|Notify_sendgrid]]
1. [[ServerChan|Notify_serverchan]]
1. [[SimplePush|Notify_simplepush]]
1. [[Sinch|Notify_sinch]]
1. [[Slack :books:|Notify_slack]]
1. [[SMTP2Go :books:|Notify_smtp2go]]
1. [[SparkPost :books:|Notify_sparkpost]]
1. [[Spontit|Notify_spontit]]
1. [[Streamlabs|Notify_streamlabs]]
1. [[Syslog|Notify_syslog]]
1. [[Techulus Push|Notify_techulus]]
1. [[Telegram :books:|Notify_telegram]]
1. [[Twilio :calling:|Notify_twilio]]
1. [[Twist|Notify_twist]]
1. [[Twitter|Notify_twitter]]
1. [[XBMC|Notify_xbmc]]
1. [[XMPP|Notify_xmpp]]
1. [[Webex Teams|Notify_wxteams]]
1. [[Zulip|Notify_zulip]]

### Custom Notification Services
The following are just some general notification services you can configure to have posted to any website of your choice.  From there you can decide what actions you want to take.
1. [[FORM :books:|Notify_Custom_Form]]
1. [[JSON :books:|Notify_Custom_JSON]]
1. [[XML :books:|Notify_Custom_XML]]

### Desktop Notification Services
The following services work locally on the same PC they're ran on.
1. Linux Notifications:
   1. [[Gnome|Notify_gnome]]
   1. [[Qt|Notify_dbus]]
   1. [[DBus|Notify_dbus]]
1. [[MacOS X Notifications|Notify_macosx]]
1. [[Windows Notifications|Notify_windows]]

## Configuration
Configuration can be retrieved via a flat file on your local system or from a remote server via the http(s) protocol. You can learn more about this here:
* [[General Configuration|config]]

The following configuration formats are supported:
* [[TEXT|config_text]]
* [[YAML|config_yaml]]

## Installation
Apprise can be installed as easy as:
```bash
pip install apprise
```

## Other
* :mega: [[Using the CLI|CLI_Usage]]
* :gear: [[Configuration Help|config]]
* :bulb: [[Contributing|Development_Contribution]]
* :wrench: [[Troubleshooting|Troubleshooting]]
* :earth_americas: [Apprise API/Web Interface](https://github.com/caronc/apprise-api)
* :heart: [[Apprise Sponsors|Sponsors]]
* :skull: [[Notification Graveyard|Notification_Graveyard]]