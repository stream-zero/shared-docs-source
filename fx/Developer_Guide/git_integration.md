---
title: "Git Integration"
linkTitle: "Git Integration"
tags: [git, integrations]
categories: ["Knowledge Base"]
weight: 212
description: >-
  How to integrate a Git Repository with the {{< param replacables.brand_name  >}} Platform.
---

The Git Integration is the capability to generate a connection from a Git Repository to Projects and synchronise the Packages from the Executor with the Git Repository. The goal is to execute it through the {{< param replacables.brand_name  >}} FX Platform. It provides another, more fluent way for connecting scripts with the {{< param replacables.brand_name  >}} FX Platform without the necessity to upload files directly to the platform.

A new Project is created to showcase the capabilty of the git integration:


## Create a new project

1. Click on Projects in the left side menu to open drop-down and then on List Projects
2. Click on +Add to create a new project

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/create_project_git_int.png">}}

3. Name the project
4. Save the new project

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/git_int_created_project.png">}}

## Check the created project

1. Click on the magnifying glass to open the details page of the project

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/loupe_git_created_project.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/git_project_details_page.png">}}

## Add a GitHub Repository to the created project

1. Click on the Git Repositories tab
2. Click on +Add to add a SSH repository URL

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/add_git_repo.png">}}

## Copy GitHub Repo

*Note that before adding your GitHub Repository to the platform, a public SSH key needs to be generated.*

1. Login to your GitHub account
2. Go to the Repository you want to add to the project, in this use case "ferris-packages"
3. Click on the the green Code button to showcase the repository URLs
4. Copy the SSH URL

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/github_copy_ssh_url.png">}}

## Paste SSH URL

1. Paste the copied SSH URL from your repo
2. Click save to create the repository on the platform

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/create_git_repo.png">}}

*Note that a pair of  public and private keys are generated for each repository which is safed on the {{< param replacables.brand_name  >}} FX platform. The private key is encrypted and stored safely in the database and will never be presented to anyone, whereas the public key should be copied and added to the git repository in order to provide the {{< param replacables.brand_name  >}} FX access to the repository and the possibility to clone packages.*

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/public_key_repo.png">}}

## Add the public key to GitHub

1. Return to your GitHub account
2. Click on Settings in the top menu bar
3. Click on deploy keys
4. Click on Add deploy key

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/add_public_key_git.png">}}

5. Paste the generated public key
6. Name the public key
7. Click on Add key 

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/save_public_key_git.png">}}

8. Check the saved public key

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/check_saved_key_git.png">}}

## Synchronise the repository

1. Return to the {{< param replacables.brand_name  >}} FX platform
2. Click the Sync Now button to synchronise the platform with the GitHub

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/sync_now_button.png">}}

3. Check the synchronised details page

*Note that the branches (main; dev) were added and the status has changed (synced).*

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/synced_repos.png">}}

4. Click on the List Packages tab to verify that the packages were imported

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/list_packages_git_import.png">}}

## Change Git Branch on the platform

*If a user wants to test or work on a specific branch, he can select the branch required to do so. The main branch is selected by default.*

1. Click on the edit button to open the Edit Repository details page

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/edit_repo_branch.png">}}

2. Click in the drop-down to select the branch, in thise case "dev"
3. Click on Save to save the selected branch

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/save_branch.png">}}

4. Click on Sync to synchronise the packages from the dev branch

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/sync_dev_branch.png">}}

5. Click on the List Packages tab to verify the packages have been synced from the dev branch

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/list_packages_dev.png">}}

*Note that a public key can be regenerated at any moment if in doubt that someone has access to it. If a new key gets generated, it needs to get added to GitHub again and synced on the platform afterwards. If the step of adding the key is missed, the synchronisation will fail. Keys can also be deleted directly on GitHub if the platform access shouldn't be granted anymore.*

