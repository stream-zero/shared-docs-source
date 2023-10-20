---
title: "Executions - Packages"
linkTitle: "Executions - Packages"
weight: 206
description: >-  
  How to use the Executions/Packages Framework for script automation and package (execution) triggering.
---

The Executions/Packages is an event oriented framework that allows enterprise organizations the automation of script processing which can be triggered by:

- Manually: By clicking the ‘Run’ button on the {{< param replacables.brand_name  >}} FX Management Server.
- On Schedule: As a cron job whereas the Cron expression is added on the UI.
- On Event: Where a package is configured to be triggered bt the FX Router when a specific type of event is observed on the platform.

It allows users to deploy their locally tested scripts without DevOps specific changes or the need to learn complex DSL (description and configuration language). In tandem with Git integrated source code management FX allows distributed and fragmented tech teans to easily deploy and test new versions of code in an agile way with changes being applied immediately. 

Contiuous Change Integration / Change Deployment becomes a component based and building block driven approach, where packages can be configurable and parametrised. All scripts and their parameters like secrets and environment variables form packages which makes them reusable for similar jobs or event chains. Event based package triggering allows users to run multiple packages in parallel as a reaction to the same event.

# Executions - Packages

Primary entities for "Executions" are packages which are composed by scripts that are executed in a predefined order.

## Executions -> Packages

This Use Case defines how to create and run a new package.

1. Click on *Executions* on the left side of the dashboard menu to open drop-down
2. Click on *Packages*
3. Click on *+Add* to create a package

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/executions_packages_add_roboto.png">}}

## Create Package

| **Field name**                | **Steps & Description**                                      |
| :---------------------------- | ------------------------------------------------------------ |
| 1. Name                       | 1. Name the package                                          |
| 2. Description                | 2. Descripe the package                                      |
| 3. Project                    | 3. Select the project to which the package will be bound     |
| 4. Tags                       | 4. Add Tags of choice manually or select from predefined tags |
| 5. Schedule                   | 5. Schedule cron job -> "Cron like schedule definition. NOTE: day of week start on Monday (0 - Monday, 6 - Sunday) example: "20****" -> **The whole definition of [Cron Jobs](/docs/user-guide/cronjob/ "CronJob") can be found in the next sub-category of this UserGuide** |
| 6. Trigger Event Type         | 6. Select Value -> select event type to trigger the exectution of the package -> please visit the sub-category [Events](/docs/user-guide/events/ "Events") to get a better understanding of how to set event triggers. |
| 7. Allow Manual Triggering    | 7. Checkbox -> click to allow manual triggering of the package |
| 8. Active                     | 8. Checkbox -> click to set the package to active            |
| 9. File Upload (choose file)  | 9. Click on Choose file (Optional) to upload a script -> upload a JSON "config.json" script to configure the package |
| 10. File Upload (choose file) | 10. Click on Choose file (Optional) to upload a script -> upload a python "test_scr.py" script to pull the configuratio from config file and print all items |
| 11. Save                      | 11. Click Save to save packages                              |
| *Supported File upload Types* | 4 different file types are supported: <br />**1. ".py file"** -> A PY file is a program file or script written in Python, an interpreted object-oriented programming language. <br />**2. ".json file"** -> A JSON file is a file that stores simple data structures and objects in JavaScript Object Notation (JSON) format, which is a standard data interchange format. <br />**3. ".sql file"** -> A (SQL) file with .sql extension is a Structured Query Language (SQL) file that contains code to work with relational databases. <br />**4. ".csv file"** -> A CSV (comma-separated values) file is a text file that has a specific format which allows data to be saved in a table structured format. |

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/create_package_with_configs_roboto.png">}}

##### config.json script

The `config.json` file contains key/value configuration pairs that can be accessed in scripts at execution time.

```json
{"somekey":"some value 2"}
```

##### test_scr.py script

This is an example script that shows how configuration from `config.json` file can be accessed from a script. `package_name` will be passed to the script as argument and then can be used for fetching configuration using `ApplicationConfigurator` from `ferris_cli` python package.

```python
import sys, json
from ferris_cli.v2 import ApplicationConfigurator

fa = json.loads(sys.argv[1])

package_name = fa['package_name']
config = ApplicationConfigurator.get(package_name)

for k, v in config.items():
    print(f"{k} -> {v}")
    print(v)
```

## Check Created Package

The created package should be triggered every 20 minutes of every hour but can also be run manually.

- Click on the magnifying glass icon to open the package's details page

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/click_loupe_package_roboto.png">}}

1. Check details page
2. Click on "Show Trigger Event"

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/package_details_show_trigger_event_roboto.png">}}

1. Check the triggered event details
2. Close

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/triggered_event_details_roboto.png">}}

## Package Executions / Runs

- Click on the "Run" button down the page to run the package manually

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/run_button_manual_package.png">}}

It will automatically transfer you to the "List Package Executions" tab

1. Check runs/package executions to see if you manually triggered execution was processed
2. Click on the magnifying glass icon of your latest manually triggered run to open details page of the exectuion

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/manual_run_check_loupe_details_roboto.png">}}

1. Check the details "Show Package Execution" of the run/exection
2. Click on "List Steps" tab to see the steps of the execution

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/exection_manual_run_details_roboto.png">}}

1. Check the steps of the run and status (completed; pending; unprocessed; failed)
2. Click on "Show Results" to verify the script for failed executions

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/manual_run_list_steps_roboto.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/script_manual_run_execution.png">}}

- Close window

**Note that currently only python and sql handlers are available, files of different type will be unprocessed.**

## Save a Run/Execution

1. Go back to the "List Package Executions" tab 
2. Click on the edit icon to open make the run/execution editable

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_package_executions_edit_manual_run_roboto.png">}}

1. Name the execution/run
2. Describe the execution/run
3. Click "Saved" check box
4. Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/save_execution_run_roboto.png">}}

1. Click on Executions to open dropdown
2. Click on Saved Executions to check the saved run

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/check_saved_run_roboto.png">}}

**In the next section "UI Generator", the importance of the saved run will be showcased**.