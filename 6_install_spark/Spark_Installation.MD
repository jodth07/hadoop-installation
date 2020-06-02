# install SBT ON UBUNTU/MAC

### setup opt for installations (run on terminal)
> cd /opt <br>
> sudo chown $USER . <br>
> mkdir downloads

# download spark (run on terminal)
> wget http://www.trieuvan.com/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

# extract spark (run on terminal)
> tar xvf spark-2.4.5-bin-hadoop2.7.tgz
> mv spark-2.4.5-bin-hadoop2.7.tgz downloads/

> ln -s spark-2.4.5-bin-hadoop2.7 spark

### add paths to  .bash_profile
    export SPARK_HOME=/opt/spark
    export PATH=$PATH:$SPARK_HOME/bin
    export PATH=$PATH:$SPARK_HOME/sbin


### reload  ~/.bash_profile
> source  ~/.bash_profile


### set pyspark to use jupyter notebook
> pip install jupyter notebook


### edit bash_profile
> nano  ~/.bash_profile

### Add lines to ~/.bash_profile 
    export PYSPARK_DRIVER_PYTHON=jupyter
    export PYSPARK_DRIVER_PYTHON_OPTS='notebook'


# reload  ~/.bash_profile
> source  ~/.bash_profile