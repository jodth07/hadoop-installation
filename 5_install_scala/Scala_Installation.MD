### setup opt for installations (run on terminal)
> cd /opt <br>
> sudo chown $USER . <br>
> mkdir downloads

### download scala  (run on terminal)
> wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz

### extract spark  (run on terminal)
> tar -xzvf scala-2.11.8.tgz <br>
> mv scala-2.11.8.tgz downloads/

### create scala symbolic link
> ln -s scala-2.11.8 scala

### edit ~/.bash_profile  (run on terminal)
> nano ~/.bash_profile

### add paths to  .bash_profile (copy to `.bash_profile`)
    # setting up SCALA_HOME
    export SCALA_HOME=/opt/scala
    export PATH=$PATH:$SCALA_HOME/bin


### reload  ~/.bash_profile  (run on terminal)
> source  ~/.bash_profile


### check scala installation  (run on terminal)
> scala -version

