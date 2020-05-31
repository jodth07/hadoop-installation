## Download and install kafka
cd /opt/
sudo chown $USER .
wget https://www-eu.apache.org/dist/kafka/2.4.1/kafka_2.11-2.4.1.tgz
tar -xzvf kafka_2.11-2.4.1.tgz
ln -s kafka_2.11-2.4.1 kafka

## Add Kafka to `bash_profile`
nano ~/.bash_profile

### Add to .bash_profile
echo "
# setting up KAFKA_HOME
export KAFKA_HOME=/opt/kafka
export PATH=\$PATH:\$KAFKA_HOME/bin
" >> ~/.bash_profile

# reload bash_profile
source ~/.bash_profile

## Run Zookeeper
cd
# add flag -daemon to run process in background
zookeeper-server-start.sh  $KAFKA_HOME/config/zookeeper.properties

## Run Kafka (On New Terminal)
kafka-server-start.sh $KAFKA_HOME/config/server.properties
    
    
## Create new topic (On New Terminal)
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic_one
    
## list topics in zookeeper (On New Terminal)
kafka-topics.sh --list --zookeeper localhost:2181
kafka-topics.sh --describe --zookeeper localhost:2181 --topic topic_one

## create producer (On New Terminal)
kafka-console-producer.sh --broker-list localhost:9092 --topic topic_one
  
## create consumer (On New Terminal)
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_one
    
# Send message from producer to be received in consumer.