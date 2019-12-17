# 1.b (See 1b_java8_install)

# 1.c INSTALL PYTHON3 AS PYTHON
sudo apt install python3
cd /usr/bin
sudo ln -s python3 python

# 1.d INSTALL SBT
# download sbt zip
cd /home/opt
sudo chown $USER .
wget https://piccolo.link/sbt-1.2.7.zip

# unzip sbt
unzip sbt-1.2.7.zip

# set SBT HOME & Add sbt to path
echo SBT_HOME=/home/opt/sbt  >>  ~/.bash_profile
echo PATH=${PATH}:$SBT_HOME/bin >>  ~/.bash_profile

# restart bash file
source ~/.bash_profile

# 1.d set up ssh
sudo apt install openssh-client openssh-server