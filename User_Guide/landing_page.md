---
title: "Landing Page (Dashboard)"
linkTitle: "Landing page (Dashboard)"
weight: 201
description: >-
  Overview of the {{< param replacables.brand_name  >}} FX Dashboard.
---

The {{< param replacables.brand_name  >}} FX Landing Page provides insights and analytics around typical platform related metrics mostly related to DevOps and DataOps and detailed event handling. It can be finetuned and tailored to customer specific needs.

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/dashboard_landing_page.png">}}

In this specific use case the insights and analytics of the {{< param replacables.brand_name  >}} FX Platform are highlighted as follows:

- In the first row, the last 18 executions and the last 18 executions with failed state

  - the last 18 executions showcase the following details:

    - Package (name)
    - Status
    - Execution time
    - Finished

  - the last 18 executions with failed state showcase the following details:

    - Package (name)
    - Status failed
    - Triggered time 

    It allows users of the platform to verify why the triggered package has failed executing.

- In the second row, the executions statuses per day (last 7 days) and the executions by status (last 7 days)

  - Completed
  - Failed
  - Pending
  - In_progress

- In the third row, the exectuions trigger type per day (last 7 days) and the exectuions by trigger type (last 7 days)

  - triggered
  - scheduled
  - manual

- In the 4th row, the average execution time per day (last 7 days) and the most recently updated packages

  - the details of the most recently updated packages are divided as follows:
    - Package
    - Project
    - Updated on (date and time)

- In the 5th row, the most frequently executed packages in the last 7 days with the following details:

  - Package (name)
  - Number of exections