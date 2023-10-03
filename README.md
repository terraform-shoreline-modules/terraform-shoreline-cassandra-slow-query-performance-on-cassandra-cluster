
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Slow Query Performance on Cassandra Cluster.
---

This incident type refers to a situation where there is a significant delay in the execution of queries on a Cassandra cluster. This delay can cause the system to become unresponsive and result in slower performance. It may be caused by a variety of factors such as an increase in traffic, inefficient queries, or hardware issues. The issue can impact the functionality of the system and requires immediate attention to prevent further disruption.

### Parameters
```shell
export PATH_TO_CONFIG_FILE="PLACEHOLDER"
```

## Debug

### Check Cassandra cluster status
```shell
nodetool status
```

### Check if any node is down
```shell
nodetool status | grep -v 'UN'
```

### Check Cassandra cluster load
```shell
nodetool info | grep Load
```

### Check Cassandra cluster compaction history
```shell
nodetool compactionhistory
```

### Check slow queries in Cassandra
```shell
nodetool tpstats | grep "Slow"
```

### Check Cassandra cluster status
```shell
nodetool status
```

### Check if any node is down
```shell
nodetool status | grep -v 'UN'
```

### Check Cassandra cluster load
```shell
nodetool info | grep Load
```

### Check Cassandra cluster compaction history
```shell
nodetool compactionhistory
```

### Check slow queries in Cassandra
```shell
nodetool tpstats | grep "Slow"
```

## Repair

### Check the Cassandra database configuration and ensure that it is properly optimized for the workload it handles. For instance, you may need to increase the size of the read/write buffers, cache, and threads.
```shell


#!/bin/bash



# Set the configuration file path

CONFIG_FILE=${PATH_TO_CONFIG_FILE}



# Increase the read/write buffers

sed -i 's/read_request_timeout_in_ms:.*/read_request_timeout_in_ms: 10000/' $CONFIG_FILE

sed -i 's/write_request_timeout_in_ms:.*/write_request_timeout_in_ms: 10000/' $CONFIG_FILE



# Increase the cache size

sed -i 's/row_cache_size_in_mb:.*/row_cache_size_in_mb: 1024/' $CONFIG_FILE



# Increase the number of threads

sed -i 's/concurrent_reads:.*/concurrent_reads: 64/' $CONFIG_FILE

sed -i 's/concurrent_writes:.*/concurrent_writes: 64/' $CONFIG_FILE



# Restart Cassandra service

systemctl restart cassandra


```