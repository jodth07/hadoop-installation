
# CREATING MULTIPLE BROKERS
    > cd ~/kafka/config
    
## create server 1
    > cp server.properties server_1.properties
    > nano server_1.properties
### edit `server_1.properties`
    broker.id=1
    listeners=PLAINTEXT://:9081
    log.dir=/tmp/kafka-logs_1
   
## create server 2
    > cp server.properties server_2.properties
    > nano server_2.properties
### edit `server_2.properties`
    broker.id=2
    listeners=PLAINTEXT://:9082
    log.dir=/tmp/kafka-logs_2
    
## create server 3
    > cp server.properties server_3.properties
    > nano server_3.properties
### edit `server_3.properties`
    broker.id=3
    listeners=PLAINTEXT://:9083
    log.dir=/tmp/kafka-logs_3
    
## create server 4
    > cp server.properties server_4.properties
    > nano server_4.properties
### edit `server_4.properties`
    broker.id=4
    listeners=PLAINTEXT://:9084
    log.dir=/tmp/kafka-logs_4
    

## Start all servers (Each in different terminal)
    > kafka-server-start.sh kafka/config/server.properties
    > kafka-server-start.sh kafka/config/server_1.properties
    > kafka-server-start.sh kafka/config/server_2.properties
    > kafka-server-start.sh kafka/config/server_3.properties
    > kafka-server-start.sh kafka/config/server_4.properties

## Create kafka Topics
    > kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic multidragons

## list topics in zookeeper (On New Terminal)
    > kafka-topics.sh --list --zookeeper localhost:2181
    > kafka-topics.sh --describe --zookeeper localhost:2181 --topic multidragons
    
    
## create producer (On New Terminal)
    > kafka-console-producer.sh --broker-list localhost:9092 --topic multidragons
  
## create consumer (On New Terminal)
    > kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic multidragons
    
# Send message from producer to be received in consumer.
