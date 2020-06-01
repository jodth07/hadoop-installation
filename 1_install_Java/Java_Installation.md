# Install java with the commands below with the admin/root password

### change user configuration for /opt (run on terminal)
> cd /opt <br>
> sudo chown -R $USER .

### install openssh to ssh with via port 22 (run on terminal)
> sudo apt install openssh-server openssh-client -y

### Install Java 8 on Ubuntu 18.04 (run on terminal)
> sudo apt install openjdk-8-jdk-headless

### set up JAVA_HOME environment variable (run on terminal)
> nano ~/.bash_profile 

### Setting up JAVA_HOME (copy to `~/.bash_profile`)
    Set up JAVA_HOME
    export JAVA_HOME=$(readlink $(which java) -f | sed "s/\/bin\/java//g")
    export PATH=\$PATH:\$JAVA_HOME/bin

### reload bash_profile (run on terminal)
> source ~/.bash_profile

### check Java installations
> echo $JAVA_HOME
> javac -version

## java is installed and JAVA_HOME path is set.