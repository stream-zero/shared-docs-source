---
title: "Solutions snippets / explain problem solved / link to relevant use case"
linkTitle: "Solutions"
weight: 4
description: >
  The following section provides {{< param replacables.brand_name  >}} SX solutions snippets / explain problem solved / link to relevant use case.
---

## Twitter message processing example

The first example application is using {{< param replacables.brand_name  >}}-sx python library to implement stream processor to count the number of words in incoming messages. The messages are queried from Twitter API with specific filter condition and then fed to the processor. The results are sent to a Kafka topic.  
```python
import json
from {{< param replacables.brand_name_lower  >}}_sx.core import app
from {{< param replacables.brand_name_lower  >}}_sx.utils import sx_producer


def process(message):
    message_new = dict()
    message_new['text'] = message['text']
    message_new['word_count'] = len(message['text'].split(' '))
    message_new_json = json.dumps(message_new)
    print(message_new_json)
    sx_producer.send(topic="twitter_feed_wc", value=message_new_json.encode('utf-8'))


app.process = process

```