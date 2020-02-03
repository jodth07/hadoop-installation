# Install Java 8 (8u221) on Ubuntu 18.04
## Download java into `/opt`
cd /opt
sudo chown $USER -R .

wget -O jdk-8u221-linux-x64.tar.gz \
-c --content-disposition \
"https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43"

ls

### should return the 
# jdk-8u221-linux-x64.tar.gz

## Install java
### Release access 777
tar -xzvf jdk-8u221-linux-x64.tar.gz
rm jdk-8u221-linux-x64.tar.gz

echo "## Set up JAVA_HOME" >> ~/.bash_profile
echo "JAVA_HOME=/opt/jdk1.8.0_221" >> ~/.bash_profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bash_profile
echo " "  >> ~/.bash_profile

source ~/.bash_profile

which java

### OPTIONAL : Create java simbolic links to /usr/bin/java
sudo update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_221/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_221/bin/javac 100

## double check java is installed
cd
java -version

### Output should be
# java version "1.8.0_221"
# Java(TM) SE Runtime Environment (build 1.8.0_221-b11)


# Congratulation. Java 8 is installed

### find java location path
readlink -e $(which java)

### Output should be
# /home/opt/jdk1.8.0_221/bin/java
 
