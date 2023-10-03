

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