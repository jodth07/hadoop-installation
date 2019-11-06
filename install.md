# Add User from main account
> sudo adduser hadoop

# Check that hadoop user is created
# Should see `hadoop` directory
> ls /home 


# Download java into `/opt`
> sudo mkdir /home/opt
> cd /home/opt
> sudo wget -O jdk-8u221-linux-x64.tar.gz \
  -c --content-disposition \
  "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43"
> ls 
# should return the `jdk-8u221-linux-x64.tar.gz`

# Install java
# Release access 777
> sudo chmod 777 -R .
> tar -xzvf jdk-8u221-linux-x64.tar.gz

> update-alternatives --install /usr/bin/java java /home/opt/jdk1.8.0_192/bin/java 100
> update-alternatives --install /usr/bin/javac javac /home/opt/jdk1.8.0_192/bin/javac 100 

# double check java is installed
> java -version

java version "1.8.0_221"
Java(TM) SE Runtime Environment (build 1.8.0_221-b11)

# Configure passwordless SSH
> sudo apt-get install openssh-server openssh-client

# change to hadoop user
> su - hadoop

> ssh-keygen -t rsa
> cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


# install Hadoop
> wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz


# Create symbolic link (if you want)
> ln -s hadoop-2.8.5 hadoop


# Adding hadoop variables to `.~/bash_profile`
> nano ~/.bash_profile

# hadoop variables setup (write into `.bash_profile`)
export HADOOP_HOME=/home/hadoop/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# Setup Java Home
export JAVA_HOME=/home/opt/jdk1.8.0_221

# run `~/.bash_profile`
> source ~/.bash_profile

# Now let's edit our configurations
> cd hadoop/etc/hadoop/

# edit `hadoop_env.sh`
> nano hadoop_env.sh

export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop
export JAVA_HOME=/home/opt/jdk1.8.0_221

# edit `core-site.xml`
> nano core-site.xml

<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/home/hadoop/hadoop_tmp</value>
    </property>
</configuration>


# Create hadoop temp directory
> mkdir /home/hadoop/hadoop_tmp

# Edit `hdfs-site.xml`
> nano hdfs-site.xml

<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    <property>
        <name>dfs.name.dir</name>
        <value>file:///home/hadoop/hdfs/namenode</value>
    </property>
    <property>
        <name>dfs.data.dir</name>
        <value>file:///home/hadoop/hdfs/datanode</value>
    </property>
</configuration>

# create datanode and namenode directory
> mkdir -p /home/hadoop/hdfs/namenode
> mkdir -p /home/hadoop/hdfs/datanode


# edit `mapred-site.xml`
> cp mapred-site.xml.template mapred-site.xml
> nano cp mapred-site.xml

<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
</configuration>


# edit `yarn-site.xml`
> nano yarn-site.xml

<configuration>
    <property>
        <name>mapreduceyarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>


# Test hadoop and hdfs variables
> hadoop version
> hdfs version


# Starting the Hadoop Cluster
> hdfs namenode -format
# should have `status 0` at the end
> start-dfs.sh
> start-yarn.sh

# Test hadoop / hdfs is working
> hdfs dfs -mkdir /tmp
> hadoop fs -mkdir /data
> hdfs dfs -ls
> hadoop fs -ls

# check UI
ip_address:50070