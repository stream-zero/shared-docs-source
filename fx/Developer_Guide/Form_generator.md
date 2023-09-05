---
title: "Form Generator"
linkTitle: "Form Generator"
weight: 207
description: >-
  How to generate Forms that trigger services.
---

Occasionally you will come across use cases where you are required to provide a frontend for trigerring a service - usually by a non-technical person. FX and K8X both provide the ability to define Forms using a simple JSON structure. 

The Forms are generated automatically by the {{< param replacables.brand_name  >}} Management UI based on the 'parameters.json' file. 

When a service directory contains a parameters.json file the 'Run' Button on th Management UI will automatically change the icon to a 'Form' icon.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/run_UI_package_roboto.png">}}

The parameters.json file can be added to an existing service directory. When doing so you need to ensure that within the manifest.json file the 'allow_manual_trigerring' is set to 'true'

The following is a template for a parameters.json file.


## The parameters.json file

The *parameters.json* file contains a JSON definition of fields that will be rendered and presented to user upon manually triggering a package execution in order to gather the parameter values for running the package. This way, same package can be easily adapted and reused by different scenarios or environments simply by sending different parameter values to the same package.

```json
{
  "fields": [
    {
      "type": "text",
      "label": "Some Text",
      "name": "some_text",
      "required": true,
      "description": "This field is required"
    },
    {
      "type": "textarea",
      "label": "Some Textarea",
      "name": "some_textarea"
    },
    {
      "type": "file",
      "label": "Some File",
      "name": "some_file",
      "data": {
        "bucket": "testbucket",
        "async": true
      }
    },
    {
      "type": "int",
      "label": "Some Number",
      "name": "some_number",
      "default": 1,
      "min": 0,
      "max": 10
    },
    {
      "type": "float",
      "label": "Some Float",
      "name": "some_float",
      "placeholder": "0.01",
      "step": 0.01,
      "min": 0,
      "max": 10
    },
    {
      "type": "select",
      "label": "Some Select",
      "name": "some_select",
      "default": "value 2",
      "choices": [
        {
          "title": "Choice 1",
          "value": "value 1"
        },
        {
          "title": "Choice 2",
          "value": "value 2"
        },
        {
          "title": "Choice 3",
          "value": "value 3"
        }
      ]
    },
    {
      "type": "multiselect",
      "label": "Some MultiSelect",
      "name": "some_multiselect",
      "default": ["value 2", "value 3"],
      "choices": [
        {
          "title": "Choice 1",
          "value": "value 1"
        },
        {
          "title": "Choice 2",
          "value": "value 2"
        },
        {
          "title": "Choice 3",
          "value": "value 3"
        }
      ]
    },
    {
      "type": "radio",
      "label": "Some Radio",
      "name": "some_radio",
      "choices": [
        {
          "title": "Choice 1",
          "value": "value 1"
        },
        {
          "title": "Choice 2",
          "value": "value 2"
        },
        {
          "title": "Choice 3",
          "value": "value 3"
        }
      ]
    }
  ]
}
```

The above template will display a form which looks as below.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/run_parameters_UI_roboto.png">}}

When the form values and entered and the 'Run' Button is clicked the form parameters and values will be sent to the service on trigger and these will be available to the service just as if it were trigerred by an event with the same payload as the form values. 

The following is a sample script that extracts the parameters (you will notice it is no different from an event trigerred script). The only exception are the text areas which are dealt with as String data type and therefore should be converted using the relevant JSON library. 

```python

from fx_ef import context
import json

event_type = context.params.get("sample_event_type")
event_source = context.package.name
data = json.loads(context.params.get("sample_payload"))

context.events.send(event_type, event_source, data=data)

```