---
title: "State Management"
linkTitle: "State Management"
tags: [state]
categories: ["Knowledge Base"]
weight: 207
description: >-
  A Guide to Managing State across Runs.
---

One key aspect in reactive applications is how to manage state between runs. 

With {{< param replacables.brand_name  >}} FX this is simple. Each Service has a state object available at run time. All you need to do is the following.

```python
from ferris_cli import context

my_state = context.state.get() # returns a state previously set
some_value = my_last_state.get('key')
context.state.put('Key','Value')

```

The state is stored across Service runs. A state log is also maintained and stored for reference and reload.


## How it works

When a Service is started the state is loaded from the Consul key store.

When a state is stored it is placed in Consul as well as sent to Kafka. The Kafka stream maintains an audit log of the state. And also serves to retreive state after a system shut down.

