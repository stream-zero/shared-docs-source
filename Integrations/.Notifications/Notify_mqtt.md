## MQTT Notifications
* **Source**: https://mqtt.org/
* **Icon Support**: No
* **Message Format**: Text
* **Message Limit**: 268435455 Characters per Message

MQTT Support requires **paho-mqtt** to work:
```bash
pip install paho-mqtt
```

### Syntax
Valid syntax is as follows:
- `mqtt://{host}/{topic}`
- `mqtt://{host}:{port}/{topic}`
- `mqtt://{user}@{host}:{port}/{topic}`
- `mqtt://{user}:{password}@{host}:{port}/{topic}`

For a secure connection, just use `mqtts` instead.
- `mqtts://{host}/{topic}`
- `mqtts://{host}:{port}/{topic}`
- `mqtts://{user}@{host}:{port}/{topic}`
- `mqtts://{user}:{password}@{host}:{port}/{topic}`

Secure connections should be referenced using **mqtts://** where as insecure connections should be referenced via **mqtt://**.

### Parameter Breakdown
| Variable    | Required | Description
| ----------- | -------- | -----------
| user        | no       | The user associated with your MQTT server.
| password    | no       | The password associated with your MQTT server.
| hostname    | Yes      | The MQTT server you're sending your notification to.
| port        | No       | The port the MQTT server is listening on. By default the port is **1883** for **mqtt://** and **8883** for all **mqtts://** references.
| qos     | No      | The MQTT Quality of Service (Qos) setting.  By default this is set to **0** (_zero_).
| version       | No       |  The MQTT Protocol Version to use.  By default this is set to **v3.1.1**. The other possible values are **v3.1** and **v5**.
| client_id     | No      | The MQTT client identifier to use when establishing a connection with the server.  By default this is not set and a unique ID is generated per message.
| session     | No      | The MQTT session to maintain (associated with the client_id).  If no client_id is specified, then this value is not considered.  By default there is no session established and each connection made by apprise is unique.  If you wish to enforce a session (associated with a provided client_id) then set this value to True.

### Example
```bash
# Assuming we're just running an MQTT Server locally on your box
# Assuming we want to post our message to the topic: `my/topic`
apprise -vvv -b "whatever-payload-want" "mqtt://localhost/my/topic"
```

#### Sample Service Setup
I did the following to test this service locally (using docker):
```bash
# Pull in Mosquitto (v2.x at the time) - 2021 Sept 16th
docker pull eclipse-mosquitto

# Set up a spot for our configuration
mkdir mosquitto
cd mosquitto
cat << _EOF > mosquitto.conf
persistence false
allow_anonymous true
connection_messages true
log_type all
listener 1883
_EOF

# Now spin up an instance (we can Ctrl-C out of when we're done):
docker run --name mosquitto -p 1883:1883 \
   --rm -v $(pwd)/mosquitto.conf:/mosquitto/config/mosquitto.conf \
   eclipse-mosquitto

# All apprise testing can be done against this systems IP such as:
# apprise -vvv -b "my=payload" mqtt://localhost/a/simple/topic
```