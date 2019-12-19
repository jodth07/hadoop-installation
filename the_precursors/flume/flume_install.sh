
# Download and install flume in flume directory
mkdir /home/opt/flume
cd /home/opt/flume
wget http://mirror.cogentco.com/pub/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
tar -xzvf apache-flume-1.9.0-bin.tar.gz
ln -s apache-flume-1.9.0-bin flume

# Update `bash_profile`
> nano ~/.bash_profile

# set up FLUME HOME | ADD TO .bash_profile
export FLUME_HOME=/home/opt/flume
export PATH=$PATH:$FLUME_HOME/bin

# close `.bash_profile` and run
source ~/.bash_profile

# test flume agent is working
cd
flume-ng -help


