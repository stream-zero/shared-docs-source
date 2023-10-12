---
title: "CronJob"
linkTitle: "CronJob"
weight: 204
description: >-
  How to use CronJob to schedule regularly recurring actions.
---

CronJobs are used to schedule regularly recurring actions such as backups, report generation and similar items. Each of those tasks should be configured to recur for an indefinite period into the future on a regular frequency (for example: once a day / week / month). The user also can define the point in time within that interval when the job should start.

## Example:

This example CronJob manifest would execute and trigger an event every minute:

```json
schedule: "*/1 * * * *"
```

## Cron Schedule Syntax

```json
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *
```

For example, the line below states that the task must be started every Friday at midnight, as well as on the 13th of each month at midnight:

```
0 0 13 * 5
```

To generate CronJob schedule expressions, you can also use web tools like [crontab.guru](https://crontab.guru/).



### Useful Cron Patterns



| Entry                  | Description                                                | Equivalent to |
| ---------------------- | ---------------------------------------------------------- | ------------- |
| @yearly (or @annually) | Run once a year at midnight of 1 January                   | 0 0 1 1 *     |
| @monthly               | Run once a month at midnight of the first day of the month | 0 0 1 * *     |
| @weekly                | Run once a week at midnight on Sunday morning              | 0 0 * * 0     |
| @daily (or @midnight)  | Run once a day at midnight                                 | 0 0 * * *     |
| @hourly                | Run once an hour at the beginning of the hour              | 0 * * * *     |



## 20 Useful Crontab Examples

Here is the list of examples for scheduling cron jobs in a Linux system using crontab.

##### 1. Schedule a cron to execute at 2am daily.

This will be useful for scheduling database backup on a daily basis.

```shell
0 2 * * *
```

- Asterisk (*) is used for matching all the records.

##### 2. Schedule a cron to execute twice a day.

Below example command will execute at 5 AM and 5 PM daily. You can specify multiple time stamps by comma-separated.

```
0 5,17 * * *
```

##### 3. Schedule a cron to execute on every minutes.

Generally, we don’t require any script to execute on every minute but in some cases, you may need to configure it.

```
* * * * *
```

##### 4. Schedule a cron to execute on every Sunday at 5 PM.

This type of cron is useful for doing weekly tasks, like log rotation, etc.

```
0 17 * * sun
```

##### 5. Schedule a cron to execute on every 10 minutes.

If you want to run your script on 10 minutes interval, you can configure like below. These types of crons are useful for monitoring.

```
*/10 * * * *
```

***/10:** means to run every 10 minutes. Same as if you want to execute on every 5 minutes use */5.

##### 6. Schedule a cron to execute on selected months.

Sometimes we required scheduling a task to be executed for selected months only. Below example script will run in January, May and August months.

```
* * * jan,may,aug
```

##### 7. Schedule a cron to execute on selected days.

If you required scheduling a task to be executed for selected days only. The below example will run on each Sunday and Friday at 5 PM.

```
0 17 * * sun,fri
```

##### 8. Schedule a cron to execute on first sunday of every month.

To schedule a script to execute a script on the first Sunday only is not possible by time parameter, But we can use the condition in command fields to do it.

```
0 2 * * sun  [ $(date +%d) -le 07 ] && /script/script.sh
```

##### 9. Schedule a cron to execute on every four hours.

If you want to run a script on 4 hours interval. It can be configured like below.

```shell
0 */4 * * *
```

##### 10. Schedule a cron to execute twice on every Sunday and Monday.

To schedule a task to execute twice on Sunday and Monday only. Use the following settings to do it.

```shell
0 4,17 * * sun,mon
```

##### 11. Schedule a cron to execute on every 30 Seconds.

To schedule a task to execute every 30 seconds is not possible by time parameters, But it can be done by schedule same cron twice as below.

```shell
* * * * * /scripts/script.sh
* * * * *  sleep 30; /scripts/script.sh
```

##### 13. Schedule tasks to execute on yearly ( @yearly ).

@yearly timestamp is similar to “**0 0 1 1 \***“. It will execute a task on the first minute of every year, It may useful to send new year greetings 🙂

```shell
@yearly /scripts/script.sh
```

##### 14. Schedule tasks to execute on monthly ( @monthly ).

@monthly timestamp is similar to “**0 0 1 \* \***“. It will execute a task in the first minute of the month. It may useful to do monthly tasks like paying the bills and invoicing to customers.

```shell
@monthly /scripts/script.sh
```

##### 15. Schedule tasks to execute on Weekly ( @weekly ).

@weekly timestamp is similar to “**0 0 \* \* mon**“. It will execute a task in the first minute of the week. It may useful to do weekly tasks like the cleanup of the system etc.

```shell
@weekly /bin/script.sh
```

##### 16. Schedule tasks to execute on daily ( @daily ).

@daily timestamp is similar to “**0 0 \* \* \***“. It will execute a task in the first minute of every day, It may useful to do daily tasks.

```shell
@daily
```

##### 17. Schedule tasks to execute on hourly ( @hourly ).

@hourly timestamp is similar to “**0 \* \* \* \***“. It will execute a task in the first minute of every hour, It may useful to do hourly tasks.

```shell
@hourly
```

