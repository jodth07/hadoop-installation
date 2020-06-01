# Installing Hadoop/HDFS on Ubuntu 18.04 without `hadoop` user in /opt

## install Java
### See `Java_Installation.md`

## Configure password-less SSH (run on terminal)
> sudo apt-get install openssh-server
> sudo apt-get install openssh-client

> cat /dev/zero | ssh-keygen -q -N ""
> cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

> cd /opt


## download Hadoop (run on terminal)
> mkdir downloads
> wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
> tar -xzvf hadoop-2.8.5.tar.gz
> mv hadoop-2.8.5.tar.gz downloads/


## Create symbolic link (run on terminal)
> ln -s hadoop-2.8.5 hadoop


# add hadoop variables setup (copy to `~/.bash_profile`)
    # set up HADOOP_HOME
    export HADOOP_HOME=/opt/hadoop
    export HADOOP_INSTALL=$HADOOP_HOME
    export HADOOP_MAPRED_HOME=$HADOOP_HOME
    export HADOOP_COMMON_HOME=$HADOOP_HOME
    export HADOOP_HDFS_HOME=$HADOOP_HOME
    export YARN_HOME=$HADOOP_HOME
    export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
    export PATH=$PATH:$HADOOP_HOME/bin
    export PATH=$PATH:$HADOOP_HOME/sbin
    export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
 

# make hadoop and java variables available to system (run on terminal)
> source ~/.bash_profile
> which hadoop

# Now let's edit our configurations (run on terminal)
> cd /opt/hadoop/etc/hadoop/

# edit `hadoop-env.sh` (run on terminal)
> nano hadoop-env.sh

# add configurations to `hadoop-env.sh` (run on terminal)
> sed -i "/{JAVA_HOME}/d"  hadoop-env.sh
> sed -i "/HADOOP_CONF_DIR=/d"  hadoop-env.sh
> nano hadoop-env.sh

# Adding JAVA_HOME and HADOOP_CONF_DIR (copy to `hadoop-env.sh`)
    export JAVA_HOME=$JAVA_HOME
    export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop


### edit `core-site.xml` (run on terminal)
> sed -i "/configuration>/d" core-site.xml

## add configurations to `core-site.xml` (copy to `core-site.xml`)
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


## Create hadoop temp directory (run on terminal)
> mkdir /opt/hadoop/hadoop_tmp

### Edit `hdfs-site.xml` (run on terminal)
> sed -i "/configuration>/d" hdfs-site.xml

## add configurations to `hdfs-site.xml` (copy to `hdfs-site.xml`)
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


## create datanode and namenode directory (run on terminal)
> mkdir -p /opt/hadoop/hdfs/namenode
> mkdir -p /opt/hadoop/hdfs/datanode


### edit `mapred-site.xml` (run on terminal)
> cp mapred-site.xml.template mapred-site.xml
> sed -i "/configuration>/d" mapred-site.xml

## add configurations to `mapred-site.xml` (copy to `mapred-site.xml`)
    <configuration>
        <property>
            <name>mapreduce.framework.name</name>
            <value>yarn</value>
        </property>
    </configuration>


### edit `yarn-site.xml`  (run on terminal)
> sed -i "/configuration>/d" yarn-site.xml

### add configurations to `yarn-site.xml` (copy to `yarn-site.xml`)
    <configuration>
        <property>
            <name>mapreduceyarn.nodemanager.aux-services</name>
            <value>mapreduce_shuffle</value>
        </property>
    </configuration>

## Test hadoop and hdfs variables (run on terminal)
> hadoop version
> hdfs version

## formatting hadoop/hdfs (run on terminal)
> hdfs namenode -format
## should have `status 0` at the end

## Start HDFS services (run on terminal)
> start-dfs.sh
> start-yarn.sh

## Test hadoop / HDFS is working (run on terminal)
> hdfs dfs -mkdir /tmp /user /data /hive # hadoop fs is deprecated
> hdfs dfs -ls /

# Congratulations, hadoop/HDFS is installed.
# check hadoop UI at localhost:50070