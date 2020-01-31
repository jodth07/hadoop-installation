# make sure java is installed
# see java8_install.md

# make sure netcat is installed
sudo apt-get install openssh-server openssh-client

# Download and install flume in flume directory
mkdir /opt/flume
cd /opt
wget http://mirror.cogentco.com/pub/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
tar -xzvf apache-flume-1.9.0-bin.tar.gz
ln -s apache-flume-1.9.0-bin flume

# Update `bash_profile`
nano ~/.bash_profile

# add flume path to `.bash_profile`
echo "# set up FLUME_HOME" >> ~/.bash_profile
echo export FLUME_HOME=/home/$USER/flume  >> ~/.bash_profile
echo export PATH=$PATH:$FLUME_HOME/bin  >> ~/.bash_profile

# close `.bash_profile` and run
source ~/.bash_profile

# test flume agent is working
cd
flume-ng -help


