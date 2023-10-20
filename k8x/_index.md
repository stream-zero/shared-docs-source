---
title: "{{< param replacables.brand_name  >}} K8X"
linkTitle: "{{< param replacables.brand_name  >}} K8X"
weight: 102
description: >
  Overview and in-depth introduction to {{< param replacables.brand_name  >}} Event Driven Kubernetes.
---


## What is {{< param replacables.brand_name  >}} K8X?

{{< param replacables.brand_name  >}} K8X brings event driven automation to Kubernetes. 

With K8X you can create service flows which span multiple containers written in different programming languages. K8X takes over the responsibility of launching the right container when an event arrives that is mapped to the container. Further it provides the container with the incoming parameters, the service specific configurations and secrets injected into the container environment.

Since each service or container is invoked upon an event trigger, they (service, container) are dormant and require no compute resources.

The event driven nature of K8X makes it not only easy to use and is fast to deploy, it brings unprecedented levels of resources efficiency as well as decreased resource contention to any Kubernetes Cluster.

## Benefits of K8X

K8X shares the benefits provided by {{< param replacables.brand_name  >}} FX in that it enables easy to build and operate an event-driven microservices platform. In contrast to FX it is no more limited to the services built in the Python Programming language - i.e. the services (and containers) may be written in any lanuage. These can leverage the simple approach of FX to retreive event parameters, service configurations and secrets.

* K8X's first and foremost benefit is that it significantly decreases developer time to develop event-driven microservices. 
* K8X provides a very low learning curve.
* K8X significantly decreases time spent on deployments and CI/CD by offering a built in deployment mechanism.
* K8X improves observability by allowing easy viewing of the status as well as logs of the associated containers.


## How it works
The following is a brief explanation of how K8X works:

* Edge Adapters are responsible for sourcing events from external systems, converting the incoming events into cloud events and forwarding them to the appropriate topic in Kafka. 
* These events are consumed by the K8X Hub which looks up the mapping of the event to the target services.
* The K8X Hub then deploys the appropriate service/container and injects the event parameters, service configs and secrets to the container environment.
* The container executes the service.
* The K8X Hub collects the logs from the container for monitoring of the container status.