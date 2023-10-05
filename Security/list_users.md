---
title: "Users"
linkTitle: "Users"
tags: [security, access rights, users] 
categories: [Security]
weight: -14
description: >-
  Understanding the meaning, role and setup of Users within {{< param replacables.brand_name  >}}.

---

## Users

This is us - humans - using {{< param replacables.brand_name  >}} on a day to day basis. And in this section each user is listed with the most important attributes defininig name, e-mail, status and - most importantly - the associated roles.

> To get the the Users page, navigate to: Security > List Users

{{< blocks/screenshot color="white" image="/streamzero/images/security/list_users_page.png">}} 

*Example: List of {{< param replacables.brand_name  >}} Users*

Besides displaying the list of all current users, the Users page offers a number of capabilities:

- Add User ![Add User](/images/add_icon.png) 
- Show User ![](/images/view_icon.png)
- Edit User ![](/images/edit_icon.png)
- Delete User ![](/images/delete_icon.png)

*Note that each of these capabilities depends on the Permissions given to your Role. Some roles may be given full rights (e.g. add, show, edit, delete), where others may only be given viewing rights (e.g. show). As a result, some users may only be seeing the "Show User" magnifying glass icon.*

### Add new User

Adding a new User can be done directly within {{< param replacables.brand_name  >}} by any person who has the necessary permissions to do so. This is normally a designated Security Lead. 

Most often though, adding new Users is done by integrating {{< param replacables.brand_name  >}} with the corporate Identity Access Management (IAM) and Single Sign On (SSO) system.

> Click on the plus sign ![Add User](/images/add_icon.png) to add a new user.

{{< blocks/screenshot color="white" image="/streamzero/images/security/add_user_page.png">}} 

*Example: Adding a new {{< param replacables.brand_name  >}} User*

- **First Name, Last Name**: Full first and last name of the user

- **User Name:** Apply any name or e-mail, but it is advised to adhere to a standard applied to all users.

  *Possible options may include: Email, Company User ID, first name only or full name*

- **Is Active**: Keep this boxed checked as long as the user is actively using Ferris.

  *Uncheck the box once a user is no longer using Ferris. Delete the user after a prolonged period of inactivity.*

- **Email:** The users email is the primary means of identification and communication.

- **Role**: This is where one or more roles - and therefore permissions - are associated with each user.

  *Roles are setup in advance, and only already existing roles may be selected. A user may be associated to multiple roles.*

- **Save:** Always save!

### Show User

>  Click on the spyglass icon ![Add User](/images/view_icon.png) in front of the user you want to look at.

{{< blocks/screenshot color="white" image="/streamzero/images/security/view_user_page.png">}} 

*Example: View only List of {{< param replacables.brand_name  >}} Users*

**User Info**

- **User Name:** displays user name
- **Is Active:** shows whether the user is set to active or inactive. Note that an inactivated user may not be able to loginto Ferris
- **Role:** Associated roles 
- **Login Count:** Count of how many times the user has logged in in total

**Personal Info**

- **First Name:** First name as given during setup. This name may also be provided from the corporate directory
- **Last Name:** Last name as given during setup. This name may also be provided from the corporate directory
- **Email:** Email as given during setup. This email may also be provided from the corporate directory

**Audit Info**

- **Last login:** Last successful login date and time
- **Failed login count:** Number of unsuccessful login attempts
- **Created on:** Exact date and time this user was created (manually or via corporate SSO)
- **Created by:** {{< param replacables.brand_name  >}} User or corporate integration service
- **Changed on:** Exact date and time this user was edited (manually or via corporate SSO)
- **Changed by:** {{< param replacables.brand_name  >}} User or corporate integration service

**Edit User**: Depending on your user rights (permission level) you may be able to enter the **Edit** function.

**Back arrow**: go back to the List Users page.

### Edit User

Editing User details such as name, email or even Role(s) may be done here. 

*Note though that if the {{< param replacables.brand_name  >}} Security is integrated with the corporate Identity Access Management (IAM), adding or removing Roles should be done there in order to ensure the change is permanent and not overwritten at the next syncronization.*

> Click on the edit icon ![Add User](/images/edit_icon.png) in front of the user you want to apply changes to.

### Delete User

Delete Users permanetly from Ferris.

*Note though that if the {{< param replacables.brand_name  >}} Security is integrated with the corporate Identity Access Management (IAM), deleting users should be done there in order to ensure the change is permanent and not overwritten at the next syncronization.*

*Also note that before permanetly deleting a user from Ferris, it is advised that the status of the user is first set to "inactive" for a period of time, and until it is sure that the user will not be reactivatet.*

> Click on the delete icon ![Add User](/images/delete_icon.png) in front of the user you want to delete.

---

