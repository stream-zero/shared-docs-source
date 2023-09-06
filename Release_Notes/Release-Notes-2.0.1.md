---
title: "Release 2.0.1"
tags: ["releases"] 
categories: ["Release Notes"]
linkTitle:
weight: 100
description: >-
     New features, improvements and fixes provided to you in the 1st Quarter of the year 2022.


---





## New <img src="/images/added_blue.png" alt="added_blue" style="zoom:25%;" />

- [x] We have introduced the **Simple {{< param replacables.brand_name  >}} Dashboard** (Landing Page/Dashboard) developed in ReactJS to provide insights and analytics around typical platform related metrics mostly related to Data Ops and detailed event handling. It can be finetuned and tailored to customer specific needs. The details can be found under the [Landing Page(Dashboard)](/docs/user-guide/landing_page/ "LandingPage") subcategory in the User Guide.
- [x] The first version of the **Open API REST Server - Generator** has been built which can be used for generating standardised REST APIs from the OpenAPI specification.
- [x] Created **Dashboard API** which is used for feeding various charts on **{{< param replacables.brand_name  >}} Dashboard** including statistics for Executions by status, trigger type, average time of executions, number of executions per package etc.
- [x] Introduction of **manifest.json** files which can be uploaded with a package and used to define package execution entrypoint (name of the script that will be executed), order of scripts execution, schedule, tags, trigger event, etc.
- [x] Added **Execution Context** to fx_ef package which is accessible to any .py script at runtime and can be used for fetching configuration, secrets, parameters, information of the executing package and for manipulating the package state.

---

## Changed <img src="/images/changed_yellow.png" alt="changed_yellow" style="zoom:25%;" />

- [x] **PostgreSQL wrapper** was added to **{{< param replacables.brand_name  >}} CLI** 

---

## Improved <img src="/images/improved_green.png" alt="improved_green" style="zoom:25%;" />

- [x] Overall performance of the UI was enhanced

---

## Fixed <img src="/images/fixed_red.png" alt="fixed_red" style="zoom:25%;" />

- [x] Synchronisation of Git Repositories that contain empty packages
