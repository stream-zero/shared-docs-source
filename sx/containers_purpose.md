---
title: "Containers + Purpose"
linkTitle: "Containers & Purpose"
weight: 5
description: >
  {{< param replacables.brand_name  >}} SX Containers + Purpose.
---

## Creating a Docker Container

Below is an example of a dockerfile to create a Docker image for some {{< param replacables.brand_name  >}} SX application. The user is free to choose what base python image
to use and then add {{< param replacables.brand_name  >}} module and other libraries.

```
FROM python:3.9-alpine
#RUN pip install -i https://test.pypi.org/simple/ {{< param replacables.brand_name_lower  >}}-sx==0.0.8 --extra-index-url https://pypi.org/simple/ {{< param replacables.brand_name_lower  >}}-sx
RUN pip install {{< param replacables.brand_name_lower  >}}-sx
COPY app.py utils.py
```

After the user have built an image and pushed it to a Docker image regitsry, they can run it in {{< param replacables.brand_name  >}} SX Management UI.
