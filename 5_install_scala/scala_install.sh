# Download spark
cd /opt
wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz

# extract spark
tar xvf scala-2.11.8.tgz
mv scala-2.11.8.tgz downloads/

ln -s scala-2.11.8.tgz scala

# add paths to  .bash_profile
echo "
# setting up SCALA_HOME
export SCALA_HOME=/opt/scala
export PATH=\$PATH:\$SCALA_HOME/bin
" >> ~/.bash_profile

# reload  ~/.bash_profile
source  ~/.bash_profile

which scala

