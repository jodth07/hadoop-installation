# Install kafka 2.3.1 on ubuntu 18.04
for other version, find version at 
https://kafka.apache.org/downloads

## install Java 
- See `java8_install.md`

## Download and install kafka
    > cd ~
    > wget https://www-eu.apache.org/dist/kafka/2.3.1/kafka_2.11-2.3.1.tgz
    > tar -xzvf kafka_2.11-2.3.1.tgz
    > ln -s kafka_2.11-2.3.1 kafka

## Add Kafka to `bash_profile`
    > nano ~/.bash_profile
    ### Add to .bash_profile
    export KAFKA_HOME=/home/hadoop/kafka
    export PATH=$PATH:$KAFKA_HOME/bin
   
## Run Zookeeper
    > cd
    >  zookeeper-server-start.sh kafka/config/zookeeper.propertie

## Run Kafka
    > kafka-server-start.sh kafka/config/server.properties
    
    
## Create new topic
    > kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic thedragons
    
## list topics in zookeeper
    > kafka-topics.sh --list --zookeeper localhost:2181

## create producer
    > kafka-console-producer.sh --broker-list localhost:9092 --topic thedragons
  
## create consumer
    > kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic thedragons
    
# Send message from producer to be received in consumer.