---
title: "User Guide"
linkTitle: "User Guide"
weight: 3
description: >
  {{< param replacables.brand_name  >}} SX User Guide.
---

# {{< param replacables.brand_name  >}} SX Management UI

## Create a Stream Adapter

After a developer has built an image of a stream processing task and stored it to a container register, we can configure and launch it with {{< param replacables.brand_name  >}} Management UI.

On left side menu, open Stream Adapters menu and select "Stream Adapter Definition". 
Fill in the details.

![create_stream_adapter_ui](/images/SX_create_stream_adapter.png)


Go to the "List Stream Adapters" page. You should find your the Stream Adapter that we created on the list. You can start the container by clicking the "Run"-button. The download and start-up of the image can take few minutes. 

![list_stream_adapter_ui](/images/SX_list_stream_adapters.png)


When the Stream Adapter is running you can find it in the list of running adapters.

![list_running_adapters_ui](/images/SX_running_adapters.png)


{{< param replacables.brand_name  >}} also has a list of all the Kafka topics that are currently attached to Stream Adapters or available to Stream Adapters.

![list_topics_ui](/images/SX_list_topics.png)

