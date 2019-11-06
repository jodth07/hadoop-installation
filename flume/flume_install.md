# make sure java is installed
- see java8_install.md

# make sure netcat is installed
    > sudo apt-get install openssh-server openssh-client 

# Download and install flume in flume directory
    > mkdir /home/$USER/flume
    > cd /home/$USER/flume
    > wget http://mirror.cogentco.com/pub/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
    > tar -xzvf apache-flume-1.9.0-bin.tar.gz
    > mv -r apache-flume-1.9.0-bin/* .

# Update `bash_profile`
    > nano ~/.bash_profile

# add flume path to `.bash_profile`
export FLUME_HOME=/home/$USER/flume
export PATH=$PATH:$FLUME_HOME/bin

# close `.bash_profile` and run
    > source ~/.bash_profile

# test flume agent is working
    > cd
    > flume-ng -help


