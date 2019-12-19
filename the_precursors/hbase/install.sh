# Install HBASE 1.5.0
mkdir /home/opt
cd /home/opt
wget http://apache.mirror.gtcomm.net/hbase/1.5.0/hbase-1.5.0-bin.tar.gz
tar -xzvf hbase-1.5.0-bin.tar.gz

ln -s hbase-1.5.0 hbase

# set hbase home | ADD TO ~/.bash_profile
export HBASE_HOME=/home/opt/hbase
export PATH=$PATH:$HBASE_HOME/bin

# reload .bash_profile
source ~/.bash_profile


cd cd /home/opt/hbase/conf

# Set JAVA_HOME - Line 27
nano hbase-env.sh
export JAVA_HOME=/home/opt/jdk1.8.0_221 # your JAVA_HOME path

nano hbase-site.xml
# add following lines in hbase-site.xml
<properties>
  <property>
    <name>hbase.rootdir</name>
    <value>hdfs://localhost:9000/user/hbase</value>
  </property>
  <property>
    <name>hbase.zookeeper.quorum</name>
    <value>localhost</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.clientPort</name>
    <value>2181</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/home/opt/hbase/zookeeper</value>
  </property>
  <property>
    <name>hbase.cluster.distributed</name>
    <value>true</value>
  </property>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
</properties>

# Start HDFS and HBASE services
start-dfs.sh
start-yarn.sh
start-hbase.sh

# Check that HDFS and HBASE services have started
jps
