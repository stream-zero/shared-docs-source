---
title: "{{< param replacables.brand_name  >}} SX"
linkTitle: "{{< param replacables.brand_name  >}} SX"
weight: 103
description: >
  The following section provides a short overview of key features, concepts and architecture of {{< param replacables.brand_name  >}} SX.
---

## Overview

{{< param replacables.brand_name  >}} SX is a **streaming automation solution for the {{< param replacables.brand_name  >}} Platform**. It utilizes Apache Kafka, the distributed message broker used by thousands of companies, to enable data processing across the data mesh.

**{{< param replacables.brand_name  >}} SX drastically simplifies the creation of data pipelines and deployment of data streams**, speeding up the time it takes to build stream processing applications.

**It automates sourcing, streaming, and data management**, and widely reduces the need for engineers’ involvement in topics management, DevOps, and DataOps.

### What is Stream-Processing

Stream processing is a data management technique that involves ingesting a continuous data stream to quickly analyze, filter, transform or enhance the data in real time. Apache Kafka is the most popular open-source stream-processing software for collecting, processing, storing, and analyzing data at scale.

Most known for its excellent performance and fault tolerance, Kafka is designed to deliver high throughput and at the same time maintain low latency for real-time data feeds. It can handle thousands of messages per second with an average latency of 5–15ms.

Kafka serves as an ideal platform for building real-time streaming applications such as online streaming analytics or real-time message queue.

Apache Kafka has several advantages over other tools. Some notable benefits are:

- Building data pipelines.
- Leveraging real-time data streams.
- Enabling operational metrics.
- Data integration across countless sources.


### Common Struggles For Companies Trying to Implement Kafka as an Integration Pattern
Now, while Kafka is great for building scalable and high-performance streaming applications, it’s actually hard to implement and maintain.

1. For one thing, the system is large and complex, which is why most companies fail to meet their goals.
2. On top of that, integrating client systems with Kafka brings additional challenges that can be difficult even for experienced teams, because there are many different technical complexities that could potentially cause hiccups in your integration strategy. -> Data schema, supported protocol and serialization are just some of the examples.
3. As a result, Kafka requires a dedicated team with advanced knowledge and varying skill sets to handle its adoption — engineers, DevOps specialists, DataOps engineers, and GitOps experts.
4. Moreover, due to the complexity of the applications, especially the concern of scalability, it can take a significant time to build each application.

There are many steps involved: from defining and writing business logic, setting up Kafka and integrating it with other services, to automating and deploying the applications.

### How Does {{< param replacables.brand_name  >}} SX Address And Solve These Issues?

{{< param replacables.brand_name  >}} SX takes streaming automation to a whole new level. And the way it works is simple. It removes the complexity of Kafka connections, integrations, setups, automation, deployments and gives the end user the opportunity to focus on building client applications instead of losing time learning how to manage Kafka.

But how exactly does {{< param replacables.brand_name  >}} SX solve the common issues and pitfalls mentioned above? By simplifying all processes:

- It is easy to adop and therefore has a low learning curve: Users can start working with {{< param replacables.brand_name  >}} SX and experience first results within an hour.
- It removes the all complexities of Kafka: Engineers focus strictly on business logic for processing messages. The {{< param replacables.brand_name  >}} SX python package takes care of configuration, Kafka connections, error handling, logging, and functions to interact with other services inside {{< param replacables.brand_name  >}}.
- It is flexible. {{< param replacables.brand_name  >}} SX allows using different underlying images and install additional components or pip modules.
- It enables connecting services code automatically to Streams and Topics.
- It helps you to quickly iterate on your service architecture. With {{< param replacables.brand_name  >}} SX, once the images are deployed and the services are running, results are displayed right away.
- It takes care of all the underlying core processes. This means that you don’t need to worry about any technical or operational considerations.
- It is highly scalable and provides flexibility to up- or down-scale at any time, adjusted to the user’s needs and the number of topic partitions.

With the experience and knowledge gained over the past 7 years, the {{< param replacables.brand_name  >}} Labs team has built an out-of-the-box module that lets developers concentrate on coding while taking care of all the complex processes that come with stream-processing data integrations.
