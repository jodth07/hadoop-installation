# Install Java 8 (8u221) on Ubuntu 18.04
## Download java into `/opt`
`> sudo mkdir /home/opt` <br>
`> cd /home/opt` <br>
`> sudo wget -O jdk-8u221-linux-x64.tar.gz \` <br>
  `-c --content-disposition \` <br>
  `"https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43"` <br>
`> ls` 
### should return the 
 jdk-8u221-linux-x64.tar.gz

## Install java
### Release access 777
`> sudo chmod 777 -R .`<br>
`> tar -xzvf jdk-8u221-linux-x64.tar.gz`<br>
### Create java links
`> update-alternatives --install /usr/bin/java java /home/opt/jdk1.8.0_192/bin/java 100` <br>
`> update-alternatives --install /usr/bin/javac javac /home/opt/jdk1.8.0_192/bin/javac 100` 

## double check java is installed
`> java -version`

### Output should be
 java version "1.8.0_221"
 Java(TM) SE Runtime Environment (build 1.8.0_221-b11)


# Congratulation. Java 8 is installed

### find java location path
`> readlink -e $(which java)` 

 
