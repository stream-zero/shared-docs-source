---
title: Databricks
hide_title: true
sidebar_position: 37
version: 1
---

## Databricks

To connect to Databricks, first install [databricks-dbapi](https://pypi.org/project/databricks-dbapi/) with the optional SQLAlchemy dependencies:

```bash
pip install databricks-dbapi[sqlalchemy]
```

There are two ways to connect to Databricks: using a Hive connector or an ODBC connector. Both ways work similarly, but only ODBC can be used to connect to [SQL endpoints](https://docs.databricks.com/sql/admin/sql-endpoints.html).

### Hive

To use the Hive connector you need the following information from your cluster:

- Server hostname
- Port
- HTTP path

These can be found under "Configuration" -> "Advanced Options" -> "JDBC/ODBC".

You also need an access token from "Settings" -> "User Settings" -> "Access Tokens".

Once you have all this information, add a database of type "Databricks (Hive)" in {{< param replacables.brand_name  >}}, and use the following SQLAlchemy URI:

```
databricks+pyhive://token:{access token}@{server hostname}:{port}/{database name}
```

You also need to add the following configuration to "Other" -> "Engine Parameters", with your HTTP path:

```
{"connect_args": {"http_path": "sql/protocolv1/o/****"}}
```

### ODBC

For ODBC you first need to install the [ODBC drivers for your platform](https://databricks.com/spark/odbc-drivers-download).

For a regular connection use this as the SQLAlchemy URI:

```
databricks+pyodbc://token:{access token}@{server hostname}:{port}/{database name}
```

And for the connection arguments:

```
{"connect_args": {"http_path": "sql/protocolv1/o/****", "driver_path": "/path/to/odbc/driver"}}
```

The driver path should be:

- `/Library/simba/spark/lib/libsparkodbc_sbu.dylib` (Mac OS)
- `/opt/simba/spark/lib/64/libsparkodbc_sb64.so` (Linux)

For a connection to a SQL endpoint you need to use the HTTP path from the endpoint:

```
{"connect_args": {"http_path": "/sql/1.0/endpoints/****", "driver_path": "/path/to/odbc/driver"}}
```
