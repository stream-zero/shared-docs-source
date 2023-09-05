---
title: "Projects"
linkTitle: "Projects"
weight: 302
description: >
  How to create Projects and Users for new projects.
---

This subcategory explains the creation of new projects and users withtin these projects.

## Project 

1. Click on *Projects* in the menu on the left side to open dropdown and then on List Projects
2. Click on *"+Add"*

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_add_roboto.png">}}



1. Name the new project
2. Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/create_project_roboto.png">}}


{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_created_roboto.png">}}



Project on the {{< param replacables.brand_name  >}} Platform form the overarching organizational bracket for different types of objects. All users, packages, scripts, parameters, secrets and other elements are organized into projects to ease enterprise data management. The default owner for new projects is the Platform Admin (PA).  

## User creation within the project

Since the Platform Administrator created the Project, he is automatically assigned as the Project Owner. All user roles on the project level are defined in detail as follows:

- **Project Owner** -  has all permissions on project and related entities (packages, users) including deletion of project(s) (and users) created by the PO. By default it is the user that created project
- **Project Admin** - has all permissions as Owner except deletion
- **Project User** - has only list / view permissions

**Please note that users without Platform Administrator role, do not see any projects and packages they are not assigned to. All project role rights are translated to package level also, eg. a user with Project User role will not be able to edit packages of that project, only to list/view them and run a (manual) execution**

1. Click on the magnifying glass to open Project details page


{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/list_projects_loupe_roboto.png">}}


2. Click on *"+Add"* to add a new user to the project

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/click_add_new_user_roboto.png">}}



3. Choose a user from the drowdown 
4. Choose a user role from dropdown (Owner; Admin; User)
5. Click Save

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/add_new_project_user_roboto.png">}}


- Check the user has been created

{{< blocks/screenshot color="white" image="/streamzero/images/user_guide/check_all_users_new.png">}}



Since new users were created, no package(s) are yet assigned to the project. A project needs to be assigned to an existing package as follows:

1. Click on *Executions* to open dropdown and then *Packages* in the menu on the left
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

