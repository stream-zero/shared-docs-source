---
title: "Developer Guide"
linkTitle: "Developer Guide"
weight: 2
description: >-
  {{< param replacables.brand_name  >}} SX Developer Guide
---

## Overview

**{{< param replacables.brand_name  >}}** is a container level solution for building highly scalable, cross-network  sync or async applications.

Using the {{< param replacables.brand_name  >}} SX platform to run and manage stream processing containers utilizing {{< param replacables.brand_name  >}} messaging infrastructure significantly reduces the cost of deploying enterprise application and offers standardized data streaming between workflow steps.  This will simplify the development and as result create a platform with agile data processing and ease of integration.

## Getting started with Stream Processors

Take a look at this library for creating Stream Processors on top of Kafka and running them inside {{< param replacables.brand_name  >}} platform:
[StreamZero-SX](https://pypi.org/project/StreamZero-sx/) 

## Example of a Stream Processor

Below you can find an example application that is using StreamZero-sx python library functions to count the number of words in incoming messages and then sending the result to *twitter_feed_wc* Kafka topic.  
```python
import json
from StreamZero_sx.core import app
from StreamZero_sx.utils import sx_producer


def process(message):
    message_new = dict()
    message_new['text'] = message['text']
    message_new['word_count'] = len(message['text'].split(' '))
    message_new_json = json.dumps(message_new)
    print(message_new_json)
    sx_producer.send(topic="twitter_feed_wc", value=message_new_json.encode('utf-8'))


app.process = process

```

## Creating Docker Container

Below is an example of a dockerfile to create a Docker image for the Twitter Word Count application shown in the previous section. The user is free to use whatever base python image
and then add {{< param replacables.brand_name  >}} module and other libraries.

```
FROM python:3.9-alpine
#RUN pip install -i https://test.pypi.org/simple/ StreamZero-sx==0.0.8 --extra-index-url https://pypi.org/simple/ StreamZero-sx
RUN pip install StreamZero-sx
COPY twitter_word_count.py app.py
```

After the user have built an image and pushed it to some Docker image regitry, he can run it in {{< param replacables.brand_name  >}} SX UI.
