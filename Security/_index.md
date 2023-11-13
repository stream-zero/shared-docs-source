---
title: "Security"
linkTitle: "Security"
tags: [security, access rights] 
weight: 106
categories: [Security]
description: >-
  Introduction and "how-to" guide to the {{< param replacables.brand_name  >}} Security and Access Rights Management.

---

## Concept

{{< param replacables.brand_name  >}} takes a multi-layered and integrative approach to security and access rights management, protecting systems, networks, users and data alike.

While the security architecture of {{< param replacables.brand_name  >}} stands alone and operates well in isolation, it is built to integrate with enterprise security systems based on LDAP and Active Directory. 

It supports Single Sign On (SSO) through open protocols such as Auth0 and SAML.

This user guide focuses on the application internal - user controlled - aspects of the seurity functions.


## Approach

{{< param replacables.brand_name  >}} applies the established notion of _Users_, _Roles_ and _Permissions_ and linking them to the application elements such as _Menues_, _Views_ and _Pages_.

This approach enables the breaking of the application into granular elements and organizing them into groups of like access control areas. The ultimate benefit is the implementation of user rights on a strict "need-to-know" basis.


## Security Components

The following sections describe how the security components work and how to set them up for your purpose.

> If you want to follow the instructions and examples, you first need to connect to your {{< param replacables.brand_name  >}} demo instance. 

### Navigation

The Security menu is found on left hand navigation of Ferris. Click on the Security menu to expand it and display all security relevant menu items.

{{< blocks/screenshot color="white" image="/streamzero/images/security/security_navigation.png">}}

**{{< param replacables.brand_name  >}} Security Navigation**

- [**List Users:**]({{< ref "list_users.md" >}}) Setup individual users and assign one or more roles to them. If {{< param replacables.brand_name  >}} is integrated with a company own Single Sign On, here is where all users can be viewed. Each user may be deactivated manually.
- [**List Roles:**]({{< ref "list_roles.md" >}}) Setup and maintain individual roles and assign them viewing, editing, executing and other rights pertinent to the character and scope of the role. Roles can be integrated and inheritet with the company Active Directory.

**For Security Administrators only**
These menu items can only be seen and accessed with the prerequisite *Administrator* rights as granted in the *User* section.

- [**Users Statistics:**]({{< ref "statistics.md" >}}) Useful graphical statistic displaying the login behavior of individual users, such as login count and failed logins.
- [**User Registrations:**]({{< ref "" >}}) Listing pending registration requests.
- [**Base Permissions:**]({{< ref "permissions.md" >}}) Listing the base permissions. 
- [**Views / Menus:**]({{< ref "" >}}) Listing of all Menu and View (aka Pages, UI) items. 
- [**Permissions on Views/Menus:**]({{< ref "" >}}) Listing of the assigned permissions of each Menu and View element. 

> NOTE that it is considered a good practice that security related tasks are provided to only a few dedicated Security Leads within the organization. For that purpose, setting up a dedicated **Security Lead** role is advised.*
