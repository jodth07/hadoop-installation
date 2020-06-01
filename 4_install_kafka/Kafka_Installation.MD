## Download and install kafka

### setup opt for installations (run on terminal)
> cd /opt <br>
> sudo chown $USER . <br>
> mkdir downloads


### download kafka  (run on terminal)
> wget https://www-eu.apache.org/dist/kafka/2.4.1/kafka_2.11-2.4.1.tgz


### unzip sbt (run on terminal)
> tar -xzvf kafka_2.11-2.4.1.tgz <br>
> ln -s kafka_2.11-2.4.1 kafka <br>
> mv kafka_2.11-2.4.1.tgz downloads/


### set KAFKA_HOME & Add sbt to path  (run on terminal)
> nano ~/.bash_profile

 
### Add Kafka to `bash_profile` (copy to `~/.bash_profile`)
    # setting up KAFKA_HOME
    export KAFKA_HOME=/opt/kafka
    export PATH=$PATH:$KAFKA_HOME/bin


### reload bash_profile (run on terminal)
> source ~/.bash_profile

## test kafka installation
### Run Zookeeper (run on terminal)
#### add flag -daemon to run process in background (run on terminal)
> cd <br>
> zookeeper-server-start.sh  $KAFKA_HOME/config/zookeeper.properties

### Run Kafka (On New Terminal)
> kafka-server-start.sh $KAFKA_HOME/config/server.properties
    
    
### Create new topic (On New Terminal)
> kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic_one
    
### list topics in zookeeper (On New Terminal)
> kafka-topics.sh --list --zookeeper localhost:2181 <br>
> kafka-topics.sh --describe --zookeeper localhost:2181 --topic topic_one  <br>

### create producer (On New Terminal)
> kafka-console-producer.sh --broker-list localhost:9092 --topic topic_one

### create consumer (On New Terminal)
> kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_one
