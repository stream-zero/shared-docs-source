---
title: "User Guide"
linkTitle: "User Guide"
tags: [quickstart, user guide]
categories: ["Knowledge Base"]
weight: 106
description: >-
  This section documents the Ferris Management User Interface (UI) in detail, so that you can quickly understand how Ferris is used effectively. Practical examples will further help in obtaining hands-on experience.
---

## The Ferris Management UI

The {{< param replacables.brand_name  >}} Management UI is a light weight front-end, through which all Ferris Components are managed and monitored. The Management UI is intentionally kept simple, with a structure that makes navigation fast and effective.

Extending the user interface is easily possible with the built-in {{< param replacables.brand_name  >}} Application Builder (FAB). This can become very useful for use cases demanding user input.

## Purpose

The primary purpose of {{< param replacables.brand_name  >}} Management UI is for development teams to setup projects and services and orchestrate them to fully fledged applications.

Through the user interface, teams are enabled to perform the following tasks:

- Manage Projects
- Manage and orchestrate Services
- Schedule, trigger and run Jobs
- Integrate with Git Repositories
- Manage Security
- Log and Monitor executions and jobs

## Users and Roles

The {{< param replacables.brand_name  >}} Management UI serves a number of different audiences and roles, namely:

- Development and ebgineering teams, developing applications, uses cases and software projects
- DevOps and GitOps teams, responsible for maintaining, extending, deploying and operating applications
- Security Leads mainintaining users and privileges
- Admins, such as Project Leads maintaining projects

## Ferris Components

The {{< param replacables.brand_name  >}} Platform follows the principles of **Event based Services and Integrations Architecture**. As a result, Ferris observes a strict, yet easy to understand paradigm of **Microservices** based engineering.

In the following section, the Ferris Components used to establish Microservices and Event based Services and Integrations Architecture are explained in more detail:

### Projects

Projects is a purely logical concept within Ferris, serving the purpose of separating services and entire applications, including their development teams from one another.

Within a project, teams can connect to their Git Repos and integrate code snippets, microservices and APIs. The real-time integration of these integrations greatly reduce any deployment overhead and thus make an immediate code evaluation possible.

Secrets may also be setup on a project basis, effectively enabling project level integrations and security.

### Services

Services are one of the core elements of the {{< param replacables.brand_name  >}} Platform. A Service represents one or many code sippets, microservices or APIs. It can be augmented by configuration and manifest files, and together each Service represents a fully fledged process or micro application.

{{< param replacables.brand_name  >}} Services are extremely capable and powerful objects, since they are reusable anywhere and can be triggered by any type of Event, be that:

- Trigger Event, _by any internal or external cloud-based event_
- Cron Schedule, _on a preset schedule_
- Manually, _from within a Service_

### Events

Events are the triggers kicking of a Service. As with Services, Events are kept flexible, and can take any form, such as a manual file upload on some company internal system, a periodic file ingestion process on a data platform, or a high-throughput monitoring of trading executions.

Events may happen anywhere in the realm of global cloud services or internally on legacy inhouse systems. Very often, events happen on a wide variety of such systems and services.

The nature of Events is that each Event a) listens to something particular happening, and then b) triggering one or more services.

Events and Services enter a symbiotic relationship: Events trigger Services, and in turn a completed Service may trigger one or more Events. Thus the relationships between Services and Events can be:

- One to one (1 : 1)
- One to many (1 : n)
- Many to many (n : n)

### Jobs

Jobs are the actual running of Services and Events. As mentioned earlier, Jobs may be triggered either manually, on schedule, or by a trigger event.

{{< param replacables.brand_name  >}} Jobs are powerful because they are universally executable by Developers and DevOps alike:

- Developers: setup and execute Jobs to test Services
- DevOps: integrate Services with (Kafka) event triggers or schedule recuring Jobs through Cron

### Taxonomies

Similar to Projects, Taxonomies or Tags are a logical concept to help facilitate the management of the diverse {{< param replacables.brand_name  >}} elements.

One difference to Projects is though, that Tags may be used across Projects.

### Git

As one of the **first enablers of GitOps**, {{< param replacables.brand_name  >}} provides a secure integration with Git Repos, enabling a direct embedding of code in {{< param replacables.brand_name  >}} Services.

As a result, real-time testing as well as no-code deployment of new Services and APIs is made possible with one simple integration.

> _Note: {{< param replacables.brand_name  >}} supports integrations with GitHub, GitLab and Bitbucket_

### File Uploads and Object Storage

In order to faciliate development and testing, but also embeddable in end user applications, {{< param replacables.brand_name  >}} provides an S3 based file upload mechanism.

### Secrets

The {{< param replacables.brand_name  >}} Platform makes extensive use of Secrets. Secrets may be applied on three levels:

- Services, to be used on a partcular Service only
- Projects, to be used within a project realm, and by the project members only
- Platform, may be used by all projects, services and users of the platform

Secrets are stored within the {{< param replacables.brand_name  >}} Secrets Vault

### Security

{{< param replacables.brand_name  >}} Users and Roles are managed in the Security section. Users and Roles are managed by one or more designated Security Leads.

Roles and Permissions are freely configurable to specific organization, project or application needs.

{{< param replacables.brand_name  >}} integrates with any external Information Access Management (IAM) system, and SSO, Auth0 or SAML method.
