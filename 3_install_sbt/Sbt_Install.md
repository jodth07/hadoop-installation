# install SBT ON UBUNTU/MAC

### setup opt for installations (run on terminal)
> cd /opt <br>
> sudo chown $USER . <br>
> mkdir downloads

### download sbt zip  (run on terminal)
> wget https://piccolo.link/sbt-1.2.7.zip

### unzip sbt (run on terminal)
> unzip sbt-1.2.7.zip <br>
> mv sbt-1.2.7.zip downloads/

### set SBT_HOME & Add sbt to path  (run on terminal)
> nano ~/.bash_profile

### setting up SBT_HOME (copy to `~/.bash_profile`)
    # setting up SBT_HOME
    export SBT_HOME=/opt/sbt
    export PATH=$PATH:$SBT_HOME/bin

### restart bash file (run on terminal)
> source ~/.bash_profile

### test sbt is installed successfully  (run on terminal)
> sbt sbtVersion