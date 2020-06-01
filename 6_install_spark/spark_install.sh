# Download spark
cd /opt
sudo chown $USER .
mkdir downloads

# download spark
wget http://www.trieuvan.com/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

# extract spark
tar xvf spark-2.4.5-bin-hadoop2.7.tgz
mv spark-2.4.5-bin-hadoop2.7.tgz downloads/

ln -s spark-2.4.5-bin-hadoop2.7 spark

# add paths to  .bash_profile
echo "
export SPARK_HOME=/opt/spark
export PATH=\$PATH:\$SPARK_HOME/bin
export PATH=\$PATH:\$SPARK_HOME/sbin
" >> ~/.bash_profile

# reload  ~/.bash_profile
source  ~/.bash_profile


# set pyspark to use jupyter notebook
pip install jupyter notebook
echo"

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
" >>  ~/.bash_profile


# reload  ~/.bash_profile
source  ~/.bash_profile