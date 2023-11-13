---
title: "Projects"
linkTitle: "Projects"
weight: 202
description: >
  Projects are used to define logical teams and separate definitions and access of like services. Projects control member access to services and executions as well as to Git Repos and Secrets.
---

Following, we walk you through the Projects setup and maintenance:

1. Click on *Projects* in the menu on the left side to open dropdown and then on List Projects
2. Click on *"+Add"*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_add_roboto.png">}}

1. Name the new project
2. Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/create_project_roboto.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_created_roboto.png">}}

{{< param replacables.brand_name  >}} Projects form the overarching organizational bracket for different types of objects. All users, packages, scripts, parameters, secrets and other elements are organized into projects to ease enterprise data management. The default owner for new projects is the Platform Admin (PA).

Once created, a project consists of the following components, each represented by a separat tab:

- Details
- Charts
- Project Users
- Services
- Git Repositories
- Secrets

## Details
This tab acts as an overview page to the project. 

A number of predefined widgets show the status of the project and its latest executions. 

Clicking the _edit_ button, the project name may be changed.

<!--
{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/edit_project_button.png">}}
-->

## Charts
Charts are useful graphical widgets that summarize the hostory and health of any particular service or execution.

New charts can be added by any user to a project.

Charts creation is documented in the User Guide > _Charts_

## Project Users
The creator of a new Project is automatically assigned the _Project Owner_ role. There are multiple roles available within a project. These are defined as follows:

- **Project Owner** -  has all permissions on the project and related components (packages, users), including the deletion of the project, its repos, services, secrets and users. By default it is the user that created project. However, there can be multiple Project Owners assigned to one project.
- **Project Admin** - has all permissions as Owner except deletion
- **Project User** - has only list / view permissions

> Note that users with an assigned _Administrator_ role (see _Security_ section), may see all projects, even those that they are not a member of. Standard users do not see any projects and packages they are not assigned to. 

All rights of a project role are translated to package level. A user with a _Project User_ role will therefore not be able to edit packages of that project, but only to list and view them and run a (manual) execution.

## Services
This tab contains all _Services_ that belong to the project. 

A Service may belong to only one Project. However, multiple Services may belong to one Project.

### Git Repositories
One of the {{< param replacables.brand_name  >}} core strength is its direct and real-time integration to Git. By connecting a Git Repository with {{< param replacables.brand_name  >}}, any code snippet may be executed as soon as it is checked into the repo. 

Integrations may be done on a branch and environment basis. For example: The Git _Main_ branch may be mapped to the {{< param replacables.brand_name  >}} _Production_ environment, while the Git _Dev_ branch is mapped to {{< param replacables.brand_name  >}} _Dev / Test_.

Connecting and integrating Git Repos is fully secured and transparent by using _Key Value Pairs_, stored in Git and {{< param replacables.brand_name  >}}.

### Secrets
Project level _Secrets_ may inlcude API key, digital certificates or passwords. By definition, these are only available to __Services__ and _Users_ within the project.


<!--
1. Click on the magnifying glass to open Project details page

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_loupe_roboto.png">}}

2. Click on *"+Add"* to add a new user to the project

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/click_add_new_user_roboto.png">}}

3. Choose a user from the drowdown 
4. Choose a user role from dropdown (Owner; Admin; User)
5. Click Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/add_new_project_user_roboto.png">}}

- Check that the user has been created

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/check_all_users_new.png">}}

Now that the users have been added to the project, it's time to assign Services. A project is assigned to an existing Service as follows:

1. Click on *Executions* to open the dropdown and then *Services* in the menu on the left
2. Click on edit

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/edit_package_to_add_project_roboto.png">}}

3. Choose a project from dropdown
4. Click Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/added_project_to_package_roboto.png">}}

Once that a project was assigned to a package, the users created within that project will be able to perform their chores.


##### Project Owner

1. Log in as *"Project Owner"*
2. Click on *Projects* to open dropdown and then List Projects

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_as_projectowner_roboto.png">}}

As defined above, a Project Owner can add new projects, view, edit and delete the projects he belongs to.

3. Click on *Executions* to open dropdown and then on *Packages*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/view_packages_as_project_owner.png">}}

As Project Owner, one can add new packages, view, edit, delete and trigger manual runs and delete the packages within the projects the user belongs to.

##### Project Admin

1. Log in as *"Project Admin"*
2. Click on *Projects* to open dropdown and then *List Projects*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_as_projectadmin_roboto.png">}}

As defined above, a Project Admin can add new projects, view and edit the projects he belongs to but can not delete anything.

3. Click on *Executions* to open dropdown and then on *Packages*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/view_packages_as_projectadmin_roboto.png">}}

As Project Admin, one can add new packages, view, edit and trigger manually runs within the projects the user belongs to. The Project Admin can not delete the packages, runs or related elements.

**Project User**

1. Log in as "Project User"
2. Click on *Projects* to open dropdwon and then *List Projects*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_as_projectuser_roboto.png">}}

As defined above, a Project User can only view the projects he belongs to. He can neither edit, nore delete anything. 

3. Click on *Executions* to open dropdown and then on *Packages*.

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/view_packages_as_projectuser_roboto.png">}}

As Project User, one can view packages and trigger manually runs within the projects the user belongs to. The Project User can not delete or edit packages, runs or related elements.
-->
