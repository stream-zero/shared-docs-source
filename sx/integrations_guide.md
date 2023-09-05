---
title: "Integrations Guide"
linkTitle: "Integrations Guide"
weight: 2
description: >
  {{< param replacables.brand_name  >}} SX Integrations Guide.
---

## How does it Work?

There are two main approaches to implementing the external notifications support.

* Implementation within a {{< param replacables.brand_name  >}} SX container
* Implementation in an Exit Gateway

The 2nd option is used in platforms which are behind a firewall and therefore require the gateway to be outside the firewall for accessing external services. In these cases the adapter runs as a separate container. 

Irrespective of the infrastructure implementation the service internal API (as illustrated above) does not change.
