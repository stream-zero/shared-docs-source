---
title: Apache Druid
hide_title: true
sidebar_position: 7
version: 1
---

## Apache Druid

Use the SQLAlchemy / DBAPI connector made available in the
[pydruid library](https://pythonhosted.org/pydruid/).

The connection string looks like:

```
druid://<User>:<password>@<Host>:<Port-default-9088>/druid/v2/sql
```

### Customizing Druid Connection

When adding a connection to Druid, you can customize the connection a few different ways in the
**Add Database** form.

**Custom Certificate**

You can add certificates in the **Root Certificate** field when configuring the new database
connection to Druid:

<img src={useBaseUrl("/img/root-cert-example.png")} />{" "}

When using a custom certificate, pydruid will automatically use https scheme.

**Disable SSL Verification**

To disable SSL verification, add the following to the **Extras** field:

```
engine_params:
{"connect_args":
	{"scheme": "https", "ssl_verify_cert": false}}
```

