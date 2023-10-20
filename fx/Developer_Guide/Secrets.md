---
title: "Secrets"
linkTitle: "Secrets"
tags: [quickstart, secrets]
categories: ["Knowledge Base"]
weight: 206
description: >-
  How to integrate Secrets (sensitive configurations) within your services

---

Secrets are sensitive configuration information which you wish to use within your service. These may be a single attribute structures (such as a password) with multiple attributes.

Secrets are the ability to deal with sensitive data through scripts (secrets.json) needed for package execution, such as:

- Database Passwords 
- Secret Keys 
- API Keys
- any other sensitive data

Secrets aren't visible to any users and are passed encrypted to the actual script at the predefined package execution time. Once the script (secrets.json) is uploaded to the platform, the data is read and securely (double encryption) stored in the database.

## Secret Scopes

The platform supports the following scopes for a secret.

| Scope                 | Description                                                  |
| --------------------- | ------------------------------------------------------------ |
| Service secrets       | Service Scope secrets are only available to the specific service within which the secret was defined. They are managed by uploading a secrets.json file on the service management UI. While they can also by synced from GIT, this is not a preferred approach in order to avoid having secrets in git. |
| Project Secrets       | Secrets that are accessible to any service within a specific project. These are created by uploading a JSON file on the project secrets tab on the UI. |
| Platform Secrets      | Secrets that are accessible to any service running on the platform. These are created by uploading JSON file on the Vault->Secrets page. |

*When accessing secrets using `fx_ef.context.secrets.get('secret_name')` it will first lookup for `secret_name` within service secrets, then project and finally platform*

### The secrets.json File

To add service scope secrets you can upload a `secrets.json` file.

Those values are stored double encrypted in the database and can only be accessed within the executing script. A sample `secrets.json`

```json
{
    "DB_NAME": "test_db",
    "DB_PASS": "supersecretpas$"
}
```

### Accessing secrets

With `fx_ef.context.secrets` you can access secrets stored on at the platform, project or service scope.   

```python
from fx_ef import context
context.secrets.get('secret_name')
```

This command will first lookup for the secret named `secret_name` within package secrets (defined in `secrets.json` file of the package). If such key doesn't exist it will look for it within project secrets, and finally within the platform's secrets. If a secret with such name doesn't exist `None` will be returned.

Can be accessed using `fx_ef.context.secrets.get('secret_name'). Can be set using `context.secrets.set("secret_name", {"somekey":"someval"}, "project")`

Can be accessed using `fx_ef.context.secrets.get('secret_name')`. Can be set using `context.secrets.set("secret_name", {"somekey":"someval"}, "platform")`

### Setting secrets

Using the `fx_ef.context.secrets.set(name, value, context)` method you can set secrets on project and platform level.

```python
from fx_ef import context

context.secrets.set(name="platform_secret", value={"somekey":"someval"}, context="platform")
```

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| name | Name of the secret to be set. If secret with the same name already exist it will be updated |
| value | Value of the secret that should be set |
| context | Context of the secret. Possible values are `platform` and `project` |


## Create a new package

Note that the package creation is presented in another submenu of the User Guide, so only the needed parameters will be filled in the package to showcase the Secrets functionality.

1. Click on Executions in the left side menu and on Packages

2. Click on Add to create a new package

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/create_package_secrets.png">}}

3. Name the package
4. Click on choose file and add the python scrypt (test_secrets.py)
5. Click on Add more scripts and click on choose file to add the JSON script (secrets.json)
6. Click on Save to save the package

{{< blocks/screenshot color="white" image="/streamzero/images/developer_guide/save_package_secrets.png">}}

#### test_secrets.py script

This is an example script that shows how secrets from the `secrets.json` file can be accessed from a script at execution time using the `get_secret()` helper function from the `fx_ef` package.

```python
from fx_ef import context

print(f"DB NAME: {context.secrets.get('DB_NAME')}")
print(f"DB PASS: {context.secrets.get('DB_PASS')}")

print(f"PACKAGE NAME: {context.params.get('package_name')}")
```