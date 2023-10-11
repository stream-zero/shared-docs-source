---
title: "Project and Code Structure"
linkTitle: "Project and Code Structure"
tags: [quickstart, projects]
categories: ["Knowledge Base"]
weight: 205
description: >-
     Understanding the organization of services, repositories, and the various artefacts involved is pivotal for efficient development within the FX platform.
---


## Understanding Projects

Within the FX Platform, a Project serves as a container for multiple Services. Projects don't play a functional role; they primarily aid in organizing services based on functional relationships, solution domains, or user access groups.

A project can be associated with multiple git repositories, each containing a collection of services.


## Repository Structure

In the FX platform, every directory within a repository represents a distinct service. Files located in the root directory of a repository are disregarded.


## Service Artefacts

A service encompasses an assortment of scripts, modules, and assets, including configuration files. The following are the supported types of artefacts along with their respective roles:

Artefact Type | Description
--- | ---
`*.py` | Python scripts form the core of a service. You can include multiple python scripts, and they are executed in the order defined in the `manifest.json` file. These scripts can define classes, static methods, and more.
`*.sql` | SQL files containing SQL statements. They are executed against the default database defined in the platform. These files support a _'jinja'-like_ notation for parameter extraction and embedding program logic within the SQL.
`manifest.json` | The `manifest.json` file serves to describe the service to the platform and other users. It adheres to a predefined structure and is detailed further in the [Your First FX Service](/docs/fx/developer_guide/Creating_and_Configuring_Your_First_FX_Service) section.
`config.json` | This JSON file defines the service's configuration. These values are stored in Consul once imported into the platform. Configuration values can be accessed using the service's 'context' with the `ferris_ef` module.
`secrets.json` | This file outlines the secrets accessible within a specific service. The `secrets.json` file is uploaded via the UI and should not be committed to Git.
`*.txt`, `*.json`, `*.jinja`, etc. | Various assets utilized by the service.
`parameters.json` | Optional. This file defines Micro UIs, which generate forms to trigger a service.

Understanding the components that constitute a service, repository, and project sets the foundation for effective FX service development. With this knowledge, you can seamlessly create, organize, and manage your services within the platform.


Sample Repository and Directory Structure:
```plaintext
Project
│
├── Repository
│   ├── service_1
│   │   ├── app.py
│   │   ├── manifest.json
│   │   ├── config.json
│   │   ├── secrets.json
│   │   ├── asset.txt
│   │   └── ...
│   ├── service_2
│   │   ├── app.py
│   │   ├── manifest.json
│   │   ├── config.json
│   │   ├── secrets.json
│   │   ├── asset.txt
│   │   └── ...
│   └── ...
│
└── Repository ...

```

