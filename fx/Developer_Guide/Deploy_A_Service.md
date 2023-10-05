---
title: "Deploy a Service"
linkTitle: "Deploy a Service"
tags: [quickstart, services, deploy]
categories: ["Knowledge Base"]
weight: 204
description: >-
     Follow these step-by-step instructions to setup a real-time and responsive integration between GitHub and the Ferris Platform.
---

## Deploying Services: A Step-by-Step Overview

In this section, we provide you with a concise yet comprehensive overview of the steps required to deploy a service or a collection of services onto the FX platform. Following these steps ensures a smooth transition from development to deployment.

### Step 1: Check Services into Git

Before anything else, ensure your collection of services is properly versioned and checked into a Git repository. This guarantees version control and a reliable source of truth for your services.

### Step 2: Create a Project in the UI

In the FX Platform UI, initiate the process by creating a project. Projects serve as containers for your services, aiding in organization and management.

### Step 3: Add Git Repository to the Project

Once your project is in place, seamlessly integrate your Git repository with it on the _Git Repositories_ tab. This connection allows the platform to access and manage your services' source code.

### Step 4: Sync the Repository to the Platform

The final step involves syncing the repository you've connected to your project with the FX platform. This synchronization imports the services' code, configurations, and other relevant assets into the platform environment. To do this, enter the Git Repo in Search mode and click _Sync Now_.

By following these four fundamental steps, you're well on your way to deploying your services onto the FX platform. Each of these steps plays a vital role in ensuring that your services are seamlessly integrated, accessible, and ready for execution within the FX ecosystem.


## Detailed Deployment Process: From Git to FX Platform

This section breaks down the steps outlined earlier for deploying services onto the FX platform in detail, starting with checking services into Git.

### Check Services into Git

Since familiarity with Git is assumed, we'll briefly touch on this step. Within the FX platform, each directory within a Git Repository represents a distinct service. Files placed directly in the root directory of a Repository are not considered part of any service.

### Create a Project in the UI

Creating Projects and Linking with Git Repository:

1. **Create a New Project:**
   - Navigate to the "Projects" section on the left menu, then select "List Projects."
   - Click "+Add" to create a new project.

   {{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/create_project_git_int.png">}}

2. **Name the Project:**
   - Provide a name for the project.
   - Save the project.
{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/git_int_created_project.png">}}

3. **View Project Details:**
   - Click the magnifying glass icon to access the project's details page.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/loupe_git_created_project.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/git_project_details_page.png">}}

4. **Add a GitHub Repository:**
   - Access the "Git Repositories" tab.
   - Click "+Add" to add an SSH repository URL.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/add_git_repo.png">}}

5. **Copy GitHub Repo:**
   - Generate a public SSH key _(if not done previously)._
   - Login to your GitHub account.
   - Go to the repository you want to link.
   - Click the green "Code" button to reveal repository URLs.
   - Copy the SSH URL.

  {{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/github_copy_ssh_url.png">}}

6. **Paste SSH URL:**
   - Paste the copied SSH URL into the platform.
   - Save to set up the repository.
   - A pop-up will display a platform-generated public key. This key should be added to the GitHub Repo's Deploy Keys to enable syncing.

   {{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/create_git_repo.png">}}

7. **Add Public Key to GitHub:**
   - Return to GitHub.
   - Go to Settings > Deploy Keys.
   - Click "Add Deploy Key."
   - Paste the generated public key, name it, and add the key.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/add_public_key_git.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/check_saved_key_git.png">}}

8. **Synchronize the Repository:**
   - Return to the FX platform, in Search mode.
   - Click "Sync Now" to sync the platform with the Git Repository.
   - Check the synchronized details page; branches will be added, and status changes.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/sync_now_button.png">}}

9. **Check the Synced Packages:**
   - Verify imported packages by clicking the "List Packages" tab.
   - Note that the main branch is automatically synchronized. As development continues and multiple branches are used, they can also be synced individually.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/synced_repos.png">}}

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/list_packages_git_import.png">}}

10. **Change Git Branch on the Platform:**
    - Users can choose a specific branch to work on or test.
    - Access the Edit Repository details page.
    - Select the desired branch from the dropdown (e.g., "dev").
    - Save the selection and synchronize packages.

  {{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/edit_repo_branch.png">}}

11. **Verify Synced Packages on Dev Branch:**
    - Check the "List Packages" tab to confirm successful synchronization from the dev branch.

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/list_packages_git_import.png">}}

### Managing Public Keys for Security and Access

It's important to understand the dynamics of managing public keys to ensure security and controlled access within the FX platform environment. Here's a breakdown of key considerations:

1. **Regenerating Public Keys:**
   - You can regenerate a public key at any time if there's a concern that unauthorized access might have occurred.
   - Regenerated keys must be added to GitHub again and synchronized on the platform afterward.

2. **Ensuring Synchronization:**
   - Whenever a new public key is generated, it must be added to the respective GitHub repository.
   - Failure to complete this step will result in synchronization issues on the platform.

3. **Synchronization and Key Addition:**
   - When generating a new key, add it to GitHub's Deploy Keys.
   - Afterward, ensure the key is synchronized on the platform to maintain access.

4. **Revoking Access:**
   - If a situation arises where platform access should be revoked, keys can be deleted directly on GitHub.

The meticulous management of public keys is essential for maintaining the security and integrity of your FX services. By being proactive in regenerating keys, properly adding them to GitHub, and ensuring synchronization on the platform, you're taking steps to uphold a secure development and deployment environment.

Integrate these insights into your documentation, adapting the content to match your documentation's tone and style. This note aims to provide users with a clear understanding of how to manage public keys effectively within the FX platform ecosystem.

