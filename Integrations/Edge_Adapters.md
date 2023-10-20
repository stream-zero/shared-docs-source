---
title: "Edge Adapters"
linkTitle: "Edge Adapters"
ags: [quickstart, events, adaptors]
categories: ["Knowledge Base"]
weight: 210
description: >-
  A Guide to Integrations Using the {{< param replacables.brand_name  >}} Edge Adapter.
---

The Event Source Adapter enables easy integration of external event streams to Ferris.  

The role of the Event Source Adapter is to receive events from external streams, convert them into Cloud Events and push them to the ferris.events Kafka Topic.  The Cloud Events that are generated will contain an indicator of the source, one or more specific event types (depending on the type of source and the use case) and the content of the source event in the payload of the output Cloud Event.


## Example Event Source Adapters

The following are a couple of examples of source adapters:

Generic Webhook Adapter : Exposes a webhook end point outside the cluster which may be used to submit events as webhook requets. The generic adapter may source multiple event types and does not filter the content. It may be used for example to simultaneously accept AWS EventBrige CouldEvents and GitHub Webhooks. It is the role of a package to filter or split events as is suited for the use case.

Twitter Adapter: Streams twitter based on configured hash tags and converts them to cloud events.

IBM MQ Adapter

Kafka Adapter: Sources data from JSON streams within kafka and converts them to Cloud Events.

Azure MessageBus Adapter:

Amazon SQS Adapter

MQTT Adapter

Redis Queue Adapter

ActiveMQ Source

Amazon CloudWatch Logs Source

Amazon CloudWatch Metrics Sink

Amazon DynamoDB Sink

Amazon Kinesis Source

Amazon Redshift Sink

Amazon SQS Source

Amazon S3 Sink

AWS Lambda Sink

Azure Blob Storage Sink

Azure Cognitive Search Sink

Azure Cosmos DB Sink

Azure Data Lake Storage Gen2 Sink

Azure Event Hubs Source

Azure Functions Sink

Azure Service Bus Source

Azure Synapse Analytics Sink

Databricks Delta Lake Sink

Datadog Metrics Sink

Datagen Source (development and testing)

Elasticsearch Service Sink

GitHub Source

Google BigQuery Sink

Google Cloud BigTable Sink

Google Cloud Functions Sink

Google Cloud Spanner Sink

Google Cloud Storage Sink

Google Pub/Sub Source

HTTP Sink

IBM MQ Source

Microsoft SQL Server CDC Source (Debezium)

Microsoft SQL Server Sink (JDBC)

Microsoft SQL Server Source (JDBC)

MongoDB Atlas Sink

MongoDB Atlas Source

MQTT Sink

MQTT Source

MySQL CDC Source (Debezium)

MySQL Sink (JDBC)

MySQL Source (JDBC)

Oracle Database Sink

Oracle Database Source

PagerDuty Sink

PostgreSQL CDC Source (Debezium)

PostgreSQL Sink (JDBC)

PostgreSQL Source (JDBC)

RabbitMQ Sink

RabbitMQ Source Connector

Redis Sink

Salesforce Bulk API Source

Salesforce CDC Source

Salesforce Platform Event Sink

Salesforce Platform Event Source

Salesforce PushTopic Source

Salesforce SObject Sink

ServiceNow Sink

ServiceNow Source

SFTP Sink

SFTP Source

Snowflake Sink

Solace Sink

Splunk Sink

Zendesk Source


## Generic Webhook Adapter

The Edge Adapter exposes a single endpoint for Webhooks. The webhook may be used for a large number of incoming integrations. Some examples are provided below. 

> To see the API please visit webhook.edge.YOURDOMAIN.COM/ui
> _Example webhook.edge.ferris.ai/ui_

In order to use the end point you must first generate a token to be used when submitting to the endpoint. To generate a token please follow instructions in the Secrets section.

{{< blocks/youtube color="white" video="https://www.youtube.com/embed/vJDATHEaeK8">}} 


## How it Works

The {{< param replacables.brand_name  >}} Edge Adapter is an edge service which is exposed to services outside the network for incoming integrations with external services. It exposes a single token protected endpoint which accepts a JSON payload within a POST request. 

The payload encapsulated within the POST is forwarded to the ferris.events topic with the data encapsulated in the Cloud Events 'data' section. The event type is 'ferris.events.webhook.incoming' . 

The platform may host any number of packages which then process the webhooks based on parsing the data section. 

The {{< param replacables.brand_name  >}} Edge Adapter is one of the few services exposed to the Internet.

**Ferris Edge Adapter**
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="791px" viewBox="-0.5 -0.5 791 361" content="&lt;mxfile host=&quot;app.diagrams.net&quot; modified=&quot;2022-03-05T13:19:23.526Z&quot; agent=&quot;5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36&quot; etag=&quot;gZI6pTrMld-1zDmk83Rd&quot; version=&quot;16.6.6&quot; type=&quot;device&quot;&gt;&lt;diagram id=&quot;NCeLZd7OVaFKNnc5RCcu&quot; name=&quot;Page-1&quot;&gt;7Zpdc6IwFIZ/jTO7F+0AEdBLRGzd2uqKte0lK6mwg8SNsWp//QYIn1HLtip2tl605s2Hycl5kpxADeiz9RW25s4tsqFXkwR7XQPtmiQ16wr9GwibSKirjUiYYteOJCEVTPcVRqIYq0vXhgumRRJByCPuPC9OkO/DCclpFsZolS/2jDw7J8ytKeQEc2J5vPrg2sSJ1Iakpvo1dKdO/Mui0oxyZlZcmI1k4Vg2WmUkYNSAjhEi0bfZWodeYLu8XTo7cpOOYeiTMhUGy1u3AcBj92qsbTz4+vOH2b6QQNTMi+Ut2YhZb8kmNgFGS9+GQStiDbRWjkugObcmQe6KzjnVHDLzWPYz8omOPITDuqATfgLd9bxY95FPK7dsa+EkzSbWEWiC9QliAtc7RysmNqS+B9EMEryhRVgFOXYg5nfJNKzSWZSaTHMyM5gUtJjnTJO2U+PSL8y+/2Brsc6ZFtrU2VgSYeKgKfItz0jVVqr2EJozY/2GhGwYK9aSoPwUwLVLHjPfnwKrXsos1V4zI4eJTZzw6Qgfs4lMrSCZVgtTm9xMBcPYP0901GiJJ3CfeRjdFp5Csq8c2D7xGHoWcV/yHTn8JG7hRfEI8/xwIYqdX/mzDNimNgLP4ScrKdPgf8cYDrtm3MIvHOtG+8rgVa2tDUbGMM6g/Y9+M8rlncvz6CoJ32bWWsyjpfPZXQdA5mANIQb0cxgu6zEFjEtR5blsbMGycTQqBd5wn53KyRK/JCvrARGVyiJaJaESR6j2sA2xsXE34uXWsBuy95E98ACYiM389iU2eExEaQsnyrE4aXA2OXMI3qb4WJiAkphIH8SEVR0gN9x51gVXYa6jFjwi6harVHCKpBfv9xP+QBniJ5hgD1TCaaAqMFUvyRQ42t4jcjb52nt22Kp+or1nO1SgsB6fmqo6R9VVd3R93+I3sAejdd3v35zdDpbsTJXtYCIf2n7RtsNW8n9Nm8zRNnro9nrd/o5jpDkaGtrt52FRFKpmsfmFYlkUlUpPk5JQQLF4GDoyigqHYnC8bdVAh6rsZGkMx13dMM/tfClVf75UPgFmYnU3jmUDNVH+IFsfm0U+pPph9u8upAu9179v77jI0Pt3Y2MYXhdWjIWs5rnYdpUhb8GiLh/LoPxdxlGxEN6DRWH3UU/JRenTn1olF8mDtU80jWc5i81KVzf+sH2jdW60XUdtWnTUH3T16pe1YpAiV76uqZwpB5p+owX32YK2x2CniUIUQc4ZDIDKz0fNPQbjH6hVbrCyDwGOZjDpPVcoucDozIO4A66/yesqJ7lD0TC2NpkC8yAgW2RaLl6xFJ4SALXw9sgb5eNgJ/WmqAcHDf7iUWcfJtw97blnKWaw0JA28S0IFHsU7svLy+98wcpZL17RgLLB4zuuaGgyfe0omqv03S1g/AU=&lt;/diagram&gt;&lt;/mxfile&gt;" onclick="(function(svg){var src=window.event.target||window.event.srcElement;while (src!=null&amp;&amp;src.nodeName.toLowerCase()!='a'){src=src.parentNode;}if(src==null){if(svg.wnd!=null&amp;&amp;!svg.wnd.closed){svg.wnd.focus();}else{var r=function(evt){if(evt.data=='ready'&amp;&amp;evt.source==svg.wnd){svg.wnd.postMessage(decodeURIComponent(svg.getAttribute('content')),'*');window.removeEventListener('message',r);}};window.addEventListener('message',r);svg.wnd=window.open('https://viewer.diagrams.net/?client=1&amp;page=0&amp;edit=_blank');}}})(this);" style="cursor:pointer;max-width:100%;max-height:361px;"><defs/><g><rect x="500" y="140" width="290" height="220" rx="33" ry="33" fill="none" stroke="rgb(0, 0, 0)" stroke-dasharray="3 3" pointer-events="all"/><path d="M 484 130 L 512 130 Q 522 130 522 120 L 522 32.5 Q 522 22.5 532 22.5 L 553.63 22.5" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 558.88 22.5 L 551.88 26 L 553.63 22.5 L 551.88 19 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><ellipse cx="444" cy="130" rx="40" ry="40" fill="#ff3333" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 78px; height: 1px; padding-top: 130px; margin-left: 405px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;"><font color="#ffffff">FERRIS<br />EDGE<br />ADAPTER</font></div></div></div></foreignObject><text x="444" y="134" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">FERRIS...</text></switch></g><path d="M 300 130 Q 300 130 397.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 402.88 130 L 395.88 133.5 L 397.63 130 L 395.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="180" y="100" width="120" height="60" rx="9" ry="9" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 130px; margin-left: 181px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AWS<br />EVENT<br />BRIDGE</div></div></div></foreignObject><text x="240" y="134" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AWS...</text></switch></g><path d="M 120 75 Q 150 75 150 102.5 Q 150 130 173.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 178.88 130 L 171.88 133.5 L 173.63 130 L 171.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="0" y="60" width="120" height="30" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 75px; margin-left: 1px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AWS S3</div></div></div></foreignObject><text x="60" y="79" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AWS S3</text></switch></g><path d="M 300 210 Q 352 210 352 170 Q 352 130 397.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 402.88 130 L 395.88 133.5 L 397.63 130 L 395.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="180" y="180" width="120" height="60" rx="9" ry="9" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 210px; margin-left: 181px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">GITHUB<br />WEBHOOK</div></div></div></foreignObject><text x="240" y="214" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">GITHUB...</text></switch></g><path d="M 300 50 Q 352 50 352 90 Q 352 130 397.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 402.88 130 L 395.88 133.5 L 397.63 130 L 395.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="180" y="20" width="120" height="60" rx="9" ry="9" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 50px; margin-left: 181px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">TWILLIO<br />EVENTSTREAM<br />WEBHOOK</div></div></div></foreignObject><text x="240" y="54" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">TWILLIO...</text></switch></g><path d="M 120 175 Q 150 175 150 152.5 Q 150 130 173.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 178.88 130 L 171.88 133.5 L 173.63 130 L 171.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="0" y="160" width="120" height="30" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 175px; margin-left: 1px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">80+? AWS SERVICES</div></div></div></foreignObject><text x="60" y="179" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">80+? AWS SERVICES</text></switch></g><path d="M 710 22.5 L 740 22.5 Q 750 22.5 750 32.5 L 750 182.5 Q 750 192.5 743.18 192.5 L 736.37 192.5" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 731.12 192.5 L 738.12 189 L 736.37 192.5 L 738.12 196 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="560" y="0" width="150" height="45" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 148px; height: 1px; padding-top: 23px; margin-left: 561px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">JSON-2-CLOUDEVENT<br />CONVERTER</div></div></div></foreignObject><text x="635" y="26" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">JSON-2-CLOUDEVENT...</text></switch></g><path d="M 580 192.5 L 570 192.5 Q 560 192.5 560 202.5 L 560 262.5 Q 560 272.5 570 272.5 L 588.63 272.5" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 593.88 272.5 L 586.88 276 L 588.63 272.5 L 586.88 269 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 580 192.5 L 570 192.5 Q 560 192.5 560 202.5 L 560 305 Q 560 315 570 315 L 588.63 315" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 593.88 315 L 586.88 318.5 L 588.63 315 L 586.88 311.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="580" y="170" width="150" height="45" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 148px; height: 1px; padding-top: 193px; margin-left: 581px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">KAFKA<br />EVENTS TOPIC</div></div></div></foreignObject><text x="655" y="196" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">KAFKA...</text></switch></g><rect x="595" y="250" width="120" height="30" rx="4.5" ry="4.5" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 265px; margin-left: 596px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">PACKAGE A</div></div></div></foreignObject><text x="655" y="269" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">PACKAGE A</text></switch></g><rect x="595" y="300" width="120" height="30" rx="4.5" ry="4.5" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 315px; margin-left: 596px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">PACKAGE B</div></div></div></foreignObject><text x="655" y="319" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">PACKAGE B</text></switch></g><path d="M 300 290 Q 370 290 370 210 Q 370 130 397.63 130" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 402.88 130 L 395.88 133.5 L 397.63 130 L 395.88 126.5 Z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><rect x="180" y="260" width="120" height="60" rx="9" ry="9" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 118px; height: 1px; padding-top: 290px; margin-left: 181px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">ANY<br />WEBHOOK<br />SERVICE ( SLACK...)<br /></div></div></div></foreignObject><text x="240" y="294" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">ANY...</text></switch></g></g><switch><g requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"/><a transform="translate(0,-5)" xlink:href="https://www.diagrams.net/doc/faq/svg-export-text-problems" target="_blank"><text text-anchor="middle" font-size="10px" x="50%" y="100%">Text is not SVG - cannot display</text></a></switch></svg>


## Integrations

The following sections document details on some of the possible integrations.


### AWS EventBridge

{{< blocks/youtube color="white" video="https://www.loom.com/embed/7ec1542c166f4dbb941510f4dbf5c2f0">}} 

### AWS S3 ( please switch images)

A pre-requisite is to ensure that EventBridge is sending Events to Ferris. Please see this section on how to set it up.

Create a bucket and switch to the Properties Tab of the UI

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/image-20220305125600033.png">}}

Scroll to the bottom and turn on Event Bridge Notfications by clicking on the Edit button below the section Amazon EventBridge

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/image-20220305125800254.png">}}

### GitHub Integration

To be notified on changes to a GitHub Repo please follow the steps below.

Click on the 'Settings' icon for the repo

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/image-20220305123206740.png">}}

Select the Webhooks menu on the left of the 'Settings' page. Then click on the 'Add webhook' button.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/image-20220305123425675.png">}}

Add the URL of your edge adapter end point. And ensure the content type is application/json. Finally add the api token generated on the {{< param replacables.brand_name  >}} Management UI. Further in the page you may select what event types should be sent. If unsure please maintain the default settings.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/image-20220305123919206.png">}}

Test your integration by pushing an update to the repository.