---
title: "Database Integration"
linkTitle: "Database Integration"
tags: [quickstart, database, integration]
categories: ["Knowledge Base"]
weight: 209
description: >-
  How to integrate a Database with the {{< param replacables.brand_name  >}} Platform.
---

## Install Database Drivers

{{< param replacables.brand_name  >}} requires a Python DB-API database driver and a SQLAlchemy dialect to be installed for each datastore you want to connect to within the executor image.


## Configuring Database Connections

{{< param replacables.brand_name  >}} can manage preset connection configurations. This enables a platform wide set up for both confidential as well as general access databases. 

{{< param replacables.brand_name  >}} uses the SQLAlchemy Engine along with the URL template based approach as connection management. The connection configurations are maintained as secrets within the platform and are therefore not publicly accessible. Meaning, access is provided for administrators only.


## Retrieving DB Connections

The following is how to retrieve a named connection. The sample assumes that the connection identifier key is uploaded to the package as a secrets.json.

```python
from fx_ef import context
import sqlalchemy as db

db_url = context.secrets.get('my_connection')
engine = db.create_engine(db_url)

connection = engine.connect()
metadata = db.MetaData()

```
In the above example the db_url is set up as a secret with name `'my_connection'`.

Depending on whether this is a service, project or platform level secret there are different approaches to set up the secret. For service level secrets, the following is a sample set up for a `secrets.json` file of the package.

```json
{
  "my_connection" = "mysql://scott:tiger@localhost/test"
}
```
* For Project scope use the `'secrets'` tab of the Project Management UI. 
* For Platform scope secrets use the `Vault UI` in the FX Manager Application.


## Database Drivers

The following table provides a guide on the python libs to be installed within the Executor docker image. For instructions on how to extend the Executor Docker image please check this page: /docs/extending_executor_image

You can read more here about how to install new database drivers and libraries into your {{< param replacables.brand_name  >}} FX executor image.

Note that many other databases are supported, the main criteria being the existence of a functional SQLAlchemy dialect and Python driver.

> _Note: Searching for the keyword "sqlalchemy + (database name)" should help get you to the right place._

If your database or data engine isn't on the list but a SQL interface exists, please file an issue so we can work on documenting and supporting it.


A list of some of the recommended packages:

| Database                                                     | PyPI package                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Amazon Athena](/docs/integrations/database_guide/databases/athena) | `pip install "PyAthenaJDBC>1.0.9` , `pip install "PyAthena>1.2.0` |
| [Amazon Redshift](/docs/integrations/database_guide/databases/redshift) | `pip install sqlalchemy-redshift`                            |
| [Apache Drill](/docs/integrations/database_guide/databases/drill) | `pip install sqlalchemy-drill`                               |
| [Apache Druid](/docs/integrations/database_guide/databases/druid) | `pip install pydruid`                                        |
| [Apache Hive](/docs/integrations/database_guide/databases/hive) | `pip install pyhive`                                         |
| [Apache Impala](/docs/integrations/database_guide/databases/impala) | `pip install impyla`                                         |
| [Apache Kylin](/docs/integrations/database_guide/databases/kylin) | `pip install kylinpy`                                        |
| [Apache Pinot](/docs/integrations/database_guide/databases/pinot) | `pip install pinotdb`                                        |
| [Apache Solr](/docs/integrations/database_guide/databases/solr) | `pip install sqlalchemy-solr`                                |
| [Apache Spark SQL](/docs/integrations/database_guide/databases/spark-sql) | `pip install pyhive`                                         |
| [Ascend.io](/docs/integrations/database_guide/databases/ascend) | `pip install impyla`                                         |
| [Azure MS SQL](/docs/integrations/database_guide/databases/sql-server) | `pip install pymssql`                                        |
| [Big Query](/docs/integrations/database_guide/databases/bigquery) | `pip install pybigquery`                                     |
| [ClickHouse](/docs/integrations/database_guide/databases/clickhouse) | `pip install clickhouse-driver==0.2.0 && pip install clickhouse-sqlalchemy==0.1.6` |
| [CockroachDB](/docs/integrations/database_guide/databases/cockroachdb) | `pip install cockroachdb`                                    |
| [Dremio](/docs/integrations/database_guide/databases/dremio)  | `pip install sqlalchemy_dremio`                              |
| [Elasticsearch](/docs/integrations/database_guide/databases/elasticsearch) | `pip install elasticsearch-dbapi`                            |
| [Exasol](/docs/integrations/database_guide/databases/exasol)  | `pip install sqlalchemy-exasol`                              |
| [Google Sheets](/docs/integrations/database_guide/databases/google-sheets) | `pip install shillelagh[gsheetsapi]`                         |
| [Firebolt](/docs/integrations/database_guide/databases/firebolt) | `pip install firebolt-sqlalchemy`                            |
| [Hologres](/docs/integrations/database_guide/databases/hologres) | `pip install psycopg2`                                       |
| [IBM Db2](/docs/integrations/database_guide/databases/ibm-db2) | `pip install ibm_db_sa`                                      |
| [IBM Netezza Performance Server](/docs/integrations/database_guide/databases/netezza) | `pip install nzalchemy`                                      |
| [MySQL](/docs/integrations/database_guide/databases/mysql)    | `pip install mysqlclient`                                    |
| [Oracle](/docs/integrations/database_guide/databases/oracle)  | `pip install cx_Oracle`                                      |
| [PostgreSQL](/docs/integrations/database_guide/databases/postgres) | `pip install psycopg2`                                       |
| [Trino](/docs/integrations/database_guide/databases/trino)    | `pip install sqlalchemy-trino`                               |
| [Presto](/docs/integrations/database_guide/databases/presto)  | `pip install pyhive`                                         |
| [SAP Hana](/docs/integrations/database_guide/databases/hana)  | `pip install hdbcli sqlalchemy-hana or pip install apache-Feris[hana]` |
| [Snowflake](/docs/integrations/database_guide/databases/snowflake) | `pip install snowflake-sqlalchemy`                           |
| SQLite                                                       | No additional library needed                                 |
| [SQL Server](/docs/integrations/database_guide/databases/sql-server) | `pip install pymssql`                                        |
| [Teradata](/docs/integrations/database_guide/databases/teradata) | `pip install teradatasqlalchemy`                             |
| [Vertica](/docs/integrations/database_guide/databases/vertica) | `pip install sqlalchemy-vertica-python`                      |
| [Yugabyte](/docs/integrations/database_guide/databases/yugabytedb) | `pip install psycopg2`                                       |

------

```











