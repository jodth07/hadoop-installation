# install SBT ON UBUNTU/MAC

cd /opt
sudo chown $USER .
mkdir downloads


# download sbt zip
wget https://piccolo.link/sbt-1.2.7.zip

# unzip sbt
unzip sbt-1.2.7.zip
mv sbt-1.2.7.zip downloads/

# set SBT_HOME & Add sbt to path
echo "
# setting up SBT_HOME
export SBT_HOME=/opt/sbt
export PATH=\${PATH}:\$SBT_HOME/bin
" >>  ~/.bash_profile

# restart bash file
source ~/.bash_profile
