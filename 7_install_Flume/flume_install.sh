# make sure java is installed


cd /opt
sudo chown $USER .
mkdir downloads

# Download and install flume in flume directory
wget http://mirror.cogentco.com/pub/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
tar -xzvf apache-flume-1.9.0-bin.tar.gz
ln -s apache-flume-1.9.0-bin flume
mv apache-flume-1.9.0-bin.tar.gz downloads/


# Update `bash_profile`


# add flume path to `.bash_profile`
echo "
# set up FLUME_HOME
export FLUME_HOME=/opt/flume
export PATH=\$PATH:\$FLUME_HOME/bin

" >> ~/.bash_profile

# close `.bash_profile` and run
source ~/.bash_profile

# test flume agent is working
cd
flume-ng -help


