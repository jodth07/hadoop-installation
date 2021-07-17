#!/bin/bash

# change user configuration for /opt
cd /opt
sudo chown -R $USER .

## install openssh to ssh with via port 22 Ubuntu 18.04
sudo apt install openssh-server openssh-client -y

# Install Java
## Install Java 8 on Ubuntu 18.04
sudo apt install openjdk-8-jdk-headless

# Setting up JAVA_HOME
echo "# Set up JAVA_HOME
export JAVA_HOME=$(readlink $(which java) -f | sed "s/\/bin\/java//g")
export PATH=\$PATH:\$JAVA_HOME/bin

" >> ~/.bash_profile

# shellcheck disable=SC1090
source ~/.bash_profile

echo "$JAVA_HOME"
javac -version