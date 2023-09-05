---
title: "Release 1.0.3"
tags: ["releases"] 
categories: ["Release Notes"]
linkTitle:
weight: 100
description: >-
     New features, improvements and fixes provided to you in the 3rd Quarter of the year 2021.

---






## New <img src="/images/added_blue.png" alt="added_blue" style="zoom:25%;" />

- [x] We have introduced a **Tagging** capability, which enables users to tag almost any data element on the platform making it easy and user friendly to navigate through the application and find items.
- [x] The **Checks Framework** greatly improves the data quality monitoring around any kind of data sources, data types and event types. 
- [x] The **Topics & Consumer Monitor** listens in on Kafka and provides an up-to-the-second view of data sourcing and streaming.
- [x] New **Service Logs** can be used to track all services running within the network as well as their logs and events that occur between them. Each log or event have their own data stored within elasticsearch and can be filtered by numerous fields.
- [x] **Jupyter Auto Deploy** makes the onboarding of new users even faster and self-serviced.
- [x] **Events** are stored and managed in the new Event Registry.

---

## Changed <img src="/images/changed_yellow.png" alt="changed_yellow" style="zoom:25%;" />

- no changes to report

---

## Improved <img src="/images/improved_green.png" alt="improved_green" style="zoom:25%;" />

- [x] We have improved elements of the **Security and Access Rights Management** in the areas of User and Access Management (Keycloak), Certificates Management as well as Authentication and Authorization (OpenID). Each role has its own set of permissions, which makes it possible to restrict users access to specific areas of the platform based on their role.
- [x] Parametrised **Workflows** can be defined with by users with easy json files by following a specific set of rules. Complex use cases are supported such as chaining multiple actions one by another and having control over what happens in a different scenarios. Built in approval capability for each workflow action is supported and easy to implement by default.
- [x] The new **{{< param replacables.brand_name  >}} Executor** has become even better and more powerful. Add any Python, SQL or JSON to execute any type of jobs.
- [x] The **Scheduler** is now fully embedded with the Executor.
- [x] **Files Upload** has improved and is integrated with the Workflow and Approvals functionality. Files have type specific validation and are stored in different buckets. Bucket creation can be done within the same FAB module. 
- [x] The **{{< param replacables.brand_name  >}} Application Builder (FAB)** is now capable of auto generating new pages (UI) on the fly.

---

## Fixed <img src="/images/fixed_red.png" alt="fixed_red" style="zoom:25%;" />

- no fixes to report

---



