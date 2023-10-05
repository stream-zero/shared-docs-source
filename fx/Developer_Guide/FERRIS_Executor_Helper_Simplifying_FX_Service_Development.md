---
title: "FX Core Lib: Simplifying FX Service Development"
linkTitle: "The FX Platform Lib"
tags: [quickstart, connect, register] 
weight: 203
categories: ["Knowledge Base"]
description: >-
     FX Core Lib: Simplifying FX Service Development
---

## FX Core Lib: Simplifying FX Service Development

The FX Helper package, available through the `fx_ef` library, offers an array of convenient functions that streamline the development of FX services. This guide walks you through the different ways you can leverage this package to access service configurations, parameters, secrets, and state within your service logic.


## Accessing Package Configuration

Retrieve configuration values that influence your service's behavior by using the `context.config.get()` method:

```python
from fx_ef import context

value = context.config.get('some_configuration_key')
```


## Accessing Execution Parameters

Access parameters that affect your service's execution using the `context.params.get()` method:

```python
from fx_ef import context

param_value = context.params.get('param_name')
```


## Accessing Secrets

Easily access secrets stored on platform, project, or package levels with the `context.secrets.get()` method:

```python
from fx_ef import context

secret_value = context.secrets.get('secret_name')
```


## Setting Secrets

Set secrets on project and platform levels using the `context.secrets.set()` method:

```python
from fx_ef import context

context.secrets.set(name="platform_secret", value={"somekey": "someval"}, context="platform")
```


## Accessing Package ID and Name

Retrieve your package's ID and name using the `context.package.id` and `context.package.name` attributes:

```python
from fx_ef import context

package_id = context.package.id
package_name = context.package.name
```


## Accessing and Updating Package State

Manage your service's execution state with `context.state.get()` and `context.state.put()`:

```python
from fx_ef import context

state_data = context.state.get()
context.state.put("some_key", "some_value")
```


## Logging

Leverage logging capabilities at different levels - DEBUG, INFO (default), ERROR, WARNING, and CRITICAL:

```python
from fx_ef import context

context.logging.setLevel('INFO')

context.logging.debug("debug msg")
context.logging.info("info msg")
context.logging.error("error msg")
context.logging.warning("warning msg")
context.logging.critical("critical msg")
```


## Scheduling Retry of Service Execution

Use the `context.scheduler.retry()` method to schedule the next execution of your service from within your script:

```python
from fx_ef import context

# Retry in 3 minutes
job_id = context.scheduler.retry(minutes=3)

# Retry in 3 hours
job_id = context.scheduler.retry(hours=3)

# Retry in 3 days
job_id = context.scheduler.retry(days=3)

# Retry on the 56th minute of the next hour
job_id = context.scheduler.retry(cron_expression="56 * * * *")
```

This guide provides insight into the powerful functionalities offered by the `fx_ef` library, making FX service development more efficient and intuitive. These tools empower you to create responsive and feature-rich FX services with ease.