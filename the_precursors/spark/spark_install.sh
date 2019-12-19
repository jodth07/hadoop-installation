# Download spark
wget http://www.trieuvan.com/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz

# extract spark
tar xvf spark-2.4.4-bin-hadoop2.7.tgz

ln -s spark-2.4.4-bin-hadoop2.7 spark

# add paths to  .bash_profile
echo export SPARK_HOME=/home/opt/spark >> ~/.bash_profile
echo export PATH=$PATH:$SPARK_HOME/bin >> ~/.bash_profile
echo export PATH=$PATH:$SPARK_HOME/sbin >> ~/.bash_profile

# reload  ~/.bash_profile

