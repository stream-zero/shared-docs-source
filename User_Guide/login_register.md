---
title: "Login and Registration"
linkTitle: "Login and Registration"
weight: 201
description: >-
  Logging into Ferris, registering a new or performing self-service actions.
---

Connecting to {{< param replacables.brand_name  >}} done through the Home URL. In the case of the public demo instance, it is [home.ferris.ai](https://home.ferris.ai). However, in most cases, it will be a URL that is unique to your own organization and domain.

### Identity Access Management

The {{< param replacables.brand_name  >}} Identity and Access Management backbone is managed by Keycloak, a powerful open source IAM service. Depending on the configuration, users may authenticated via:

- Local provisioning
- SSO, SAML, Auth0

Keycloak also supports self-service capabilities such as:

- User Registration
- Password Reset

