# INSTALL SBT ON UBUNTU/MAC

# download sbt zip

cd /opt
mkdir sbt
cd /opt/sbt

wget https://piccolo.link/sbt-1.2.7.zip

# unzip sbt
unzip sbt-1.2.7.zip

# Add sbt to path
echo PATH=${PATH}:/opt/sbt/bin >>  ~/.bash_profile

# restart bash file
source ~/.bash_profile
