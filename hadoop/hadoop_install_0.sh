# Installing Hadoop/hdfs on Ubuntu 18.04 without `hadoop` user in /opt

## install Java
# See `java8_install.md`

## Configure password-less SSH
sudo apt-get install openssh-server openssh-client

ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

cd /opt
## download Hadoop
wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
tar -xzvf hadoop-2.8.5.tar.gz
rm hadoop-2.8.5.tar.gz

## Create symbolic link (if you want)
ln -s hadoop-2.8.5 hadoop

## Adding hadoop variables to `.~/bash_profile`
nano ~/.bash_profile

## hadoop variables setup (write into `.bash_profile`)
  export HADOOP_HOME=/opt/hadoop
  export HADOOP_INSTALL=$HADOOP_HOME
  export HADOOP_MAPRED_HOME=$HADOOP_HOME
  export HADOOP_COMMON_HOME=$HADOOP_HOME
  export HADOOP_HDFS_HOME=$HADOOP_HOME
  export YARN_HOME=$HADOOP_HOME
  export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
  export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
  export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
  export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

## Setup Java Home in `.bash_profile`
export JAVA_HOME=readlink -e $(which java)

## make hadoop and java variables available to system
source ~/.bash_profile

## Now let's edit our configurations
cd hadoop/etc/hadoop/

### edit `hadoop-env.sh`
nano hadoop-env.sh

# add to `hadoop-env.sh`
  export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
  export JAVA_HOME=/opt/jdk1.8.0_221

### edit `core-site.xml`
nano core-site.xml

## add lines below to `core-site.xml`
  <configuration>
      <property>
          <name>fs.defaultFS</name>
          <value>hdfs://localhost:9000</value>
      </property>
      <property>
          <name>hadoop.tmp.dir</name>
          <value>/opt/hadoop/hadoop_tmp</value>
      </property>
  </configuration>


## Create hadoop temp directory
mkdir /opt/hadoop/hadoop_tmp

### Edit `hdfs-site.xml`
nano hdfs-site.xml

## add lines below to `hdfs-site.xml`
  <configuration>
      <property>
          <name>dfs.replication</name>
          <value>1</value>
      </property>
      <property>
          <name>dfs.name.dir</name>
          <value>file:///opt/hadoop/hdfs/namenode</value>
      </property>
      <property>
          <name>dfs.data.dir</name>
          <value>file:///opt/hadoop/hdfs/datanode</value>
      </property>
  </configuration>

## create datanode and namenode directory
mkdir -p /opt/hadoop/hdfs/namenode
mkdir -p /opt/hadoop/hdfs/datanode


### edit `mapred-site.xml`
cp mapred-site.xml.template mapred-site.xml
nano mapred-site.xml

## add lines below to `mapred-site.xml`
  <configuration>
      <property>
          <name>mapreduce.framework.name</name>
          <value>yarn</value>
      </property>
  </configuration>


### edit `yarn-site.xml`
nano yarn-site.xml

### add lines below to `yarn-site.xml`
  <configuration>
      <property>
          <name>mapreduceyarn.nodemanager.aux-services</name>
          <value>mapreduce_shuffle</value>
      </property>
  </configuration>


## Test hadoop and hdfs variables
hadoop version
hdfs version


## Starting the Hadoop Cluster
hdfs namenode -format
## should have `status 0` at the end

# Start hdfs servises
start-dfs.sh
start-yarn.sh

# Test hadoop / hdfs is working
hdfs dfs -mkdir /tmp /user
hadoop fs -mkdir /data # hadoop fs is depricated
hdfs dfs -ls
hadoop fs -ls # hadoop fs is depricated

# Congratulations, hadoop/hdfs is installed.
# check UI
# localhost:50070