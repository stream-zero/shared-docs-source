---
title: "Logging and Monitoring"
linkTitle: "Logging and Monitoring"
tags: [quickstart, log, monitor]
categories: ["Knowledge Base"]
weight: 208
description: >-
     Development Lifecycle of an FX Service.
---

{{< param replacables.brand_name  >}} FX aggregates all operational data into Elasticsearch. Most operational data and events are transported through Kafka from which it is placed in Elasticsearch by Elasticsearch Sink containers. 

The following are the Kex Data and The matching Elasticsearch Indexes


## Logs 

Contains Logs from all applications. Elasticsearch index is XYZ


## Events

All events that are transported through the ferris.events Topic are loaded into Elasticsearch Index.


## Checking Logs

{{< param replacables.brand_name  >}} Logs are in logstash format. The logs can be aggregated from the application by using the ferris_cli library. 

The following is a sample log entry with extended descriptions below. 

Logs are identified by the app_name attribute which provides you with an indication of the application from which it was generated. 

To Filter Application Logs use the following

App_name: 


## Checking Events

Events are in form of cloud events. The data section of an event is schema less i.e. the data provided in the attributes may vara from event type to event type. If you require custom extractions for specific event types the best is to tap into the 


## Event Name Spaces

