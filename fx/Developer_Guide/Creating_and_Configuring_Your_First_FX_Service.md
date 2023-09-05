---
title: "Creating and Configuring Your First FX Service"
linkTitle: "Your First FX Service"
tags: [quickstart, connect, register] 
weight: 202
categories: ["Knowledge Base"]
description: >-
     Creating and Configuring Your First FX Service
---

**Creating and Configuring Your First FX Service in a Local Environment**

{{% alert title="No Infrastructure Required!" color="warning" %}}
When it comes to developing FX services, there's no need for complex infrastructure setups. Nearly all of the platform's essential features can be replicated in your local development environment. 
{{% /alert %}}

This guide provides a clear walkthrough of the process for creating and simulating services, all within the comfort of your desktop IDE. By following these steps, you'll be able to seamlessly generate and define services, and then simulate their behavior before taking them live.

**Step 1: Create a Virtual Environment**

Before you start working on your FX service, it's a good practice to create a virtual environment to isolate your project's dependencies. A virtual environment ensures that the packages you install for this project won't conflict with packages from other projects. You can create a virtual environment using a tool like `virtualenv`:

```bash
# Replace "my_fx_project" with your desired project name
virtualenv my_fx_project-env
```

Activate the virtual environment:

```bash
source my_fx_project-env/bin/activate
```

**Step 2: Set Environment Variable**

Set the `EF_ENV` environment variable to "local" to indicate that you're working in a local development environment:

```bash
export EF_ENV=local
```

**Step 3: Project Directory Setup**

Create a directory that will serve as the main project directory. Inside this directory, you will organize multiple services. For example:

```bash
mkdir my_fx_project
cd my_fx_project
```

**Step 4: Create Service Directory**

Within the project directory, create a subdirectory for your specific service. This directory should have a name that consists of alphanumeric characters in lowercase, along with underscores (`_`) and hyphens (`-`) – no spaces allowed:

```bash
mkdir my-service-name
cd my-service-name
```

**Step 5: Create app.py**

Inside the service directory, create an `app.py` file. This file will serve as the entry point for your FX service. In this file, import the necessary context from the `fx_ef` (core library) for your service:

```python
# app.py
from ferris_ef import context

# Your service code starts here
```

**Step 6: Run app.py**

Run the `app.py` file. This step generates two JSON files:
- `ef_env.json`: Simulates the parameters, secrets, and configurations of the service.
- `ef_package_state.json`: Holds the execution state of the service.

The above 2 files are used to simulate the service environment and are not used at runtime. They should not be checked in to git. A sample .gitignore for FX projects is provided here <a href>The GitIgnore File</a>

```bash
python app.py
```

**Step 7: Expand Your Service**

With the initial setup done, you can now expand the `app.py` file with your actual service logic. Build and implement your FX service within this file.

**Step 8: Module Placement**

It's important to note that any modules (additional Python files) your service relies on should be placed within the same directory as the `app.py` file. FX does not support nested directories for modules.

By following these steps, you'll be able to create your first FX service in a local environment, set up the necessary configurations, and start building your service logic. Remember to activate your virtual environment whenever you work on this project and customize the `app.py` file to match the functionality you want your FX service to provide.



Adding a `manifest.json` file to describe your FX service to the platform is an essential step for proper integration and communication. Here's how you can create and structure the `manifest.json` file:

**Step 9: Create manifest.json**

Inside your service directory, create a `manifest.json` file. This JSON file will contain metadata about your service, allowing the FX platform to understand and interact with it.

```json
{
  "name": "My FX Service",
  "version": "1.0.0",
  "description": "A brief description of my FX service.",
  "author": "Your Name",
  "entry": "app.py",
  "configuration": "ef_env.json",
  "executionState": "ef_package_state.json",
  "modules": [
    "app.py"
  ]
}
```

- `"name"`: Provide a name for your FX service.
- `"version"`: Specify the version of your FX service (e.g., "1.0.0").
- `"description"`: Add a brief description of what your service does.
- `"author"`: Add your name or the author's name.
- `"entry"`: Point to the entry point of your service (usually `app.py`).
- `"configuration"`: Reference the `ef_env.json` file that holds service parameters, secrets, and configurations.
- `"executionState"`: Reference the `ef_package_state.json` file that holds the execution state of the service.
- `"modules"`: List the modules that your service relies on. In this case, it's just `"app.py"`.

**Step 10: Manifest Structure**

The `manifest.json` file provides vital information about your FX service, making it easier for the platform to understand and manage your service's behavior and dependencies.

By including this file and its necessary attributes, your service can be properly registered, tracked, and executed within the FX platform. This manifest file essentially acts as a contract between your service and the platform, enabling seamless integration.

**Understanding manifest.json: Defining Your Service**

The `manifest.json` file plays a crucial role in describing your application to the DX Platform, as well as to fellow users and developers. Below is a sample `manifest.json` file along with an explanation of its parameters:

**`manifest.json` Example:**

```json
{
  "description": "Service with manifest file",
  "entrypoint": "app.py",
  "execution_order": ["app_1.py", "app.py"],
  "tags": ["devops"],
  "trigger_events": ["ferris.apps.minio.file_uploaded"],
  "schedule": "54 * * * *",
  "allow_manual_triggering": true,
  "active": true
}
```

**Parameters and Descriptions:**

| Parameter              | Description                                                                                                      |
|------------------------|------------------------------------------------------------------------------------------------------------------|
| `description`          | A brief description of the service.                                                                             |
| `entrypoint`           | The script that will be executed when the service is triggered.                                                |
| `execution_order`      | An array indicating the sequence of scripts to be executed. If both `entrypoint` and `execution_order` are defined, `entrypoint` will be used. |
| `tags`                 | An array of tags that categorize the service.                                                                  |
| `trigger_events`       | An array of events that will trigger the service's execution.                                                  |
| `schedule`             | Optional. A cron-like definition for scheduling service executions.                                           |
| `allow_manual_triggering` | Indicates whether the service can be triggered manually.                                                      |
| `active`               | Indicates whether the service is active or inactive.                                                          |

This `manifest.json` file provides essential metadata about your service, making it easier for both the platform and other users to understand its purpose, behavior, and triggers. By customizing these parameters, you tailor the service's behavior to your specific requirements.

Feel free to integrate this explanation into your documentation. Adapt the content to match your documentation's style and format. This section aims to provide users with a comprehensive understanding of the `manifest.json` file and its significance in defining FX services.



**Step 11: Expand ef_env.json**

The `ef_env.json` file plays a crucial role in simulating your service's environment during development. While on the FX platform, parameters, configs, and secrets are managed differently, in the local environment, you can define these elements within this JSON file for simulation purposes.

```json
{
  "parameters": {
    "param1": "value1",
    "param2": "value2"
  },
  "secrets": {
    "secret_key1": "secret_value1",
    "secret_key2": "secret_value2"
  },
  "configs": {
    "config_key1": "config_value1",
    "config_key2": "config_value2"
  }
}
```

- `"parameters"`: In the local environment, you can define parameters directly within this dictionary. These parameters are typically accessed within your service code using the `fx_ef` library.

- `"secrets"`: Similarly, you can define secret values in this section. While on the platform, secrets will be managed through the UI and loaded into your service securely. During local simulation, you can include sample secret values for testing.

- `"configs"`: For configuration values, you can specify them in this dictionary. However, on the FX platform, configuration values are usually managed through an external `config.json` file. This is done to keep sensitive configuration data separate from your codebase.

**Important Note**: Keep in mind that the `ef_env.json` file is only for simulation purposes. On the FX platform, parameters are passed through trigger event payloads, configurations come from the `config.json` file, and secrets are managed through the platform's UI.

By expanding your `ef_env.json` file with the appropriate parameters, secrets, and sample configuration values, you'll be able to effectively simulate your service's behavior in a local environment. This allows you to test and refine your service logic before deploying it on the FX platform, where parameters, secrets, and configurations are handled differently.


**Step 12: Exploring the `fx_ef` Library**

In the following section, we'll delve into the capabilities of the `ferris_ef` library. This library serves as a bridge between your FX service and the platform, allowing you to seamlessly implement various platform features within your service's logic.

The `fx_ef` library encapsulates essential functionalities that enable your service to interact with the FX platform, handling triggers, events, and more. By leveraging these features, you can create robust and responsive FX services that seamlessly integrate with the platform's ecosystem.

Here's a sneak peek at some of the functionalities offered by the `fx_ef` library:

1. **Event Handling**: The library facilitates event-driven architecture, allowing your service to react to various triggers from the platform. Whether it's an incoming data event or an external signal, the library provides the tools to manage and respond to events effectively.

2. **Parameter Access**: While on the FX platform, parameters are passed through trigger event payloads. The library offers methods to access these parameters effortlessly, enabling your service to make decisions and take actions based on the provided inputs.

3. **Configuration Management**: Although configuration values are typically managed through a separate `config.json` file on the platform, the `fx_ef` library simplifies the process of accessing these configurations from within your service code.

4. **Secrets Handling**: On the platform, secrets are managed securely through the UI. The library ensures that your service can access these secrets securely when running on the platform.

5. **Service State Tracking**: The library also assists in managing your service's execution state, tracking its progress and ensuring smooth operation.

By tapping into the capabilities of the `fx_ef` library, you can build powerful and versatile FX services that seamlessly integrate with the FX platform's functionalities. In the next section, we'll dive deeper into the specifics of how to utilize these features in your service logic.

Stay tuned as we explore the `fx_ef` library in depth, unraveling the tools at your disposal for creating impactful and responsive FX services.

Feel free to adapt this content to your documentation's style and structure. It's designed to introduce users to the significance of the `fx_ef` library and prepare them for a deeper dive into its features and usage.