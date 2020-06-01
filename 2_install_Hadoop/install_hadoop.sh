# Installing Hadoop/hdfs on Ubuntu 18.04 without `2_hadoop_install` user in /opt

## install Java
# See `java8_install.md`

## Configure password-less SSH
sudo apt-get install openssh-server
sudo apt-get install openssh-client

cat /dev/zero | ssh-keygen -q -N ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

cd /opt
## download Hadoop
wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
tar -xzvf hadoop-2.8.5.tar.gz
mv hadoop-2.8.5.tar.gz downloads/

## Create symbolic link (if you want)
ln -s hadoop-2.8.5 hadoop


# add hadoop variables setup (write into `.bash_profile`)

echo "
# set up HADOOP_HOME
export HADOOP_HOME=/opt/hadoop
export HADOOP_INSTALL=\$HADOOP_HOME
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export YARN_HOME=\$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native
export PATH=\$PATH:\$HADOOP_HOME/bin
export PATH=\$PATH:\$HADOOP_HOME/sbin
export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop
export HADOOP_OPTS=\"-Djava.library.path=\$HADOOP_HOME/lib/native\"
 " >> ~/.bash_profile

# make hadoop and java variables available to system
source ~/.bash_profile
which hadoop

# Now let's edit our configurations
cd /opt/hadoop/etc/hadoop/

# edit `hadoop-env.sh`

# add configurations to `hadoop-env.sh`
sed -i "/{JAVA_HOME}/d"  hadoop-env.sh
sed -i "/HADOOP_CONF_DIR=/d"  hadoop-env.sh

echo "

# Adding JAVA_HOME and HADOOP_CONF_DIR
export JAVA_HOME=$JAVA_HOME
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop

" >> hadoop-env.sh


### edit `core-site.xml`
sed -i "/configuration>/d" core-site.xml

## add configurations to `core-site.xml`
echo "
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
" >> core-site.xml


## Create hadoop temp directory
mkdir /opt/hadoop/hadoop_tmp

### Edit `hdfs-site.xml`
sed -i "/configuration>/d" hdfs-site.xml

echo "
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
" >> hdfs-site.xml

## create datanode and namenode directory
mkdir -p /opt/hadoop/hdfs/namenode
mkdir -p /opt/hadoop/hdfs/datanode


### edit `mapred-site.xml`
cp mapred-site.xml.template mapred-site.xml
sed -i "/configuration>/d" mapred-site.xml

echo "
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
</configuration>
" >>  mapred-site.xml


### edit `yarn-site.xml`
sed -i "/configuration>/d" yarn-site.xml

### add configurations to `yarn-site.xml`
echo "
<configuration>
    <property>
        <name>mapreduceyarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>
" >>  yarn-site.xml


## Test hadoop and hdfs variables
hadoop version
hdfs version

## Starting the Hadoop Cluster
hdfs namenode -format
## should have `status 0` at the end

# Start HDFS services
start-dfs.sh

start-yarn.sh

# Test hadoop / HDFS is working
hdfs dfs -mkdir /tmp /user /data /hive # hadoop fs is deprecated
hdfs dfs -ls /

echo "Congratulations, hadoop/hdfs is installed."
echo "check hadoop UI at localhost:50070"