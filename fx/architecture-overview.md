---
title: "Architecture Overview"
linkTitle: "Architecture"
tags: []
weight: 201
description: >-
     An comprehensive overview of the architecture of {{< param replacables.brand_name  >}} FX.
---

## Concepts

{{< param replacables.brand_name  >}} FX is based on two simple concepts - **Services** and **Events**

**On FX you are effectively writing large applications by connecting “blocks” of code through Events.** 

![image-20211024081829495](/images/image-20211024081829495.png)

Each Service is a self contained piece of functionality such as loading a file, running a database view rebuild or launching a container. You can link and re-link the blocks of code at anytime. The source code can be as big or as tiny as you like.

Each Service is triggered by an Event. Each Service also emits Events, thereby allowing other Services to be triggered following (or during) the execution of a Service.

A Service can respond to multiple Event types, and a single Event Type may trigger multiple Services - Thereby allowing you to also extend your Application(s) on the fly with ease.

![image-20211024080659941](/images/image-20211024080659941.png)

You are not required to think in terms of pre-defined DAGs (Directed Acyclic Graph) and can rapidly and iteratively build, test and deploy your applications. 

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_add_roboto.png">}}


### Services

**SERVICES** are collections of scripts and modules which are executed in sequence by the **FX Executor**. 

Services are triggered by **EVENTS**, which are JSON messages which carry a header and payload. A Service can be Linked to one or more events.

Each script is provided with the Payload of the Event that triggered it. It is the job of the **FX Router** to send Events to the appropriate Service.

The following is a basic Service which parses the event sent to it and prints the payload.

```python
from fx_ef import context

# The context.params object carries the payload of the incoming event
param_value = context.params.get('param_name')

# And this is how a service sends an event
my_event_type = "com.test.my_event_type"
data = {"my attribute": "my_value"}

context.events.send(my_event_type, data)


```

### Events

Events are messages passed through the platform which are generated either by Services or by the {{< param replacables.brand_name  >}} Manager (in the case of manually triggered runs and scheduled runs).

Events are in the form of JSON formatted messages which adhere to the CloudEvents format. 

Events carry a Header which indicates the event type and a Payload (or Data section) which contain information about the event. 

The following is a sample Event.

```json
{
    "specversion" : "1.0",
    "type" : "com.example.someevent", // The Event Type
    "source" : "/mycontext",
    "subject": null,
    "id" : "C234-1234-1234",
    "time" : "2018-04-05T17:31:00Z",
    "datacontenttype" : "application/json",
    "data" : {                       // The event payload as JSON
        "appinfoA" : "abc",
        "appinfoB" : 123,
        "appinfoC" : true
    }
}
```

### Service Triggering

Services can be triggered in the following ways:

- Manually: By clicking the 'Run' button on the {{< param replacables.brand_name  >}} FX Management UI.
- On Schedule: As a cron job whereas the Cron expression is in the service manifest.
- On Event: Where a package is configured to be triggered by the FX Router when a specific type of event(s) is encountered on the platform - also configured in the service manifest.

Irrespective of how a Service is triggered it is always triggered by an Event. In the case of Manual and Scheduled triggering it is the FX Platform that generates the trigger event.

### Late Linking

One of the most important features of the FX Platform is that you are not required to link the Service to an Event during the course of development. And you can also change the Trigger Event(s) post-deployment. 

This approach gives you a great flexibility to: 

* not having to think of pre-defined flows but to build the Flow as well as the Services iteratively.
* maintain and test multiple versions of the same Service in parallel.



## The {{< param replacables.brand_name  >}} FX Flow

At the core of the FX Platform messages (Events) are passed through **Apache Kafka**. These 'events' are JSON formatted messages which adhere to the CloudEvents format. 

![image-20211024083411584](/images/image-20211024083411584.png)

Each **Event** consists of what may be simplified as Headers and Payload. The headers indicate the type of event and other attributes. Whereas the payload are the attributes or parameters that are sent out by Services in order to either provide information about their state or for usage by downstream Services.

The **FX Router(s)** is listening on the stream of Events passing through Kafka. Based on the configuration of the platform which is managed in the **{{< param replacables.brand_name  >}} Management UI** the Router decides if a Service requires to be executed based on the Event contents. On finding a configured Handler the gateway sends a message to the Executor and informs it of which packages or scripts are required to be run.

The **FX Executor(s)** executes the **Service**. The Service may use any Python module that is embedded in the Executor and also uses the platform internal configuration management database(at present Consul) for storing its configurations. The Executor sends a series of Events on Service execution. These are once again processed by the FX Router.

![image-20211024084807506](/images/image-20211024084807506.png)

The FX Executor provides infrastructure which tracks logs and maintains a record of service metrics and operational data. The Operational information is first sent to appropriate Kafka Topics from where they are picked up by Ops-Data Sinks whose role it is to store data within a *log storage system* - such as Elasticsearch, Splunk or any other storage system of choice - and in some cases also filter the data for the purpose of alerting or anomaly tracking. All operational data may be viewed and queried through tools such as **Kibana** and is also viewable on the **FX Management UI**.



## Required Infrastructure

The following are the infrastructure components required for a {{< param replacables.brand_name  >}} FX installation

| Component         | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| Apache Kafka      | Apache Kafka serves as the backbone to pass events and operational data within a {{< param replacables.brand_name  >}} FX Installation. |
| PostgreSQL        | Postgres is used as the database for the {{< param replacables.brand_name  >}} FX Manager Application. |
| Consul            | Consul is the configuration store used by the {{< param replacables.brand_name  >}} FX platform. It is also used by the services to store their configurations. |
| MinIO             | Minio provides the platform internal storage for scripts and assets used by the Services. |
| Elasticsearch     | Elasticsearch is used as a central store for all operational data. Thereby making the data easiliy searchable. |
| Kibana            | Kibana is used to view and query the data stored in Elasticsearch. |
| {{< param replacables.brand_name  >}} FX Management UI  | {{< param replacables.brand_name  >}} FX Management UI is where the setup, management, orchestration, execution, testing and monitoring of the {{< param replacables.brand_name  >}} FX platform takes place. |
| {{< param replacables.brand_name  >}} FX Router   | The Router container is responsible for listenting to events flowing through the system and forwarding the events to the appropriate micro-services that you create. |
| {{< param replacables.brand_name  >}} FX Executor | The executor container(s) is where all code and services are orchestrated and executed.   |

