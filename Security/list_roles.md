---
title: "Roles"
linkTitle: "Roles"
tags: [security, access rights, roles] 
categories: [Security]
weight: -14
description: >-
  Introduction of the Roles concept, including the meaning and application of permissions.

---

## Roles

Roles represent a collection of permissions or rights that can be performed within Ferris. They can be directly associated with the job of job a [#User]({{< ref "list_users.md" >}}) performs.

> To get to the the Users page, navigate to: Security > List Roles

{{< blocks/screenshot color="white" image="/streamzero/images/security/list_roles_page.png">}}

*Example: List of {{< param replacables.brand_name  >}} Roles*

Besides displaying the list of all available Roles, the Roles page offers a number of capabilities:

- Add Role ![Add User](/images/add_icon.png) 
- Actions ![Add User](/images/actions_icon.png) 
- Show Roles ![](/images/view_icon.png)
- Edit Roles ![](/images/edit_icon.png)
- Delete Roles ![](/images/delete_icon.png)

*Note that each of these capabilities depends on the Permissions given to your Role. Some roles may be given full rights (e.g. add, show, edit, delete), where others may only be given viewing rights (e.g. show). As a result, some users may only be seeing the "Show Roles" magnifying glass icon.*

### Add new Role

Adding a new Role can be done directly within {{< param replacables.brand_name  >}} by any person who has the necessary permissions to do so. This is normally a designated Security Lead. 

Often times, adding new Roles is done by integrating {{< param replacables.brand_name  >}} with the corporate Identity Access Management (IAM) and Active Directory (AD). 

> Click on the plus sign ![Add Role](/images/add_icon.png) to add a new user.

{{< blocks/screenshot color="white" image="/streamzero/images/security/add_role_page.png">}} 

*Example: Adding a new Role and Permissions*

- **Name:** Use a meaningful name for the role, and consider applying naming standards for all Roles

- **Permissions:** Chose from the previously setup list of [#Permissions]({{< ref "permissions.md" >}})

*Note that it possible, and common practice, to apply multiple roles to a user. Therefore it is a good idea to keep the number of permissions within one role to a minimum. This enables the enforcement of the **"need-to-know"** basis for each role.*

### Actions

In order to apply an Action, first select the Role you want the action to apply to.

- Select a Role then click Actions > Copy Role > click **Yes** to confirm
- The Role is now copied and can be found in the list of Roles as **"[original role name] copy"**



