# Run file for hortonworks

# Check if kafka is running
kafka status


# Create topic

/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic twitter --create
/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --zookeeper localhost:2181 --list
