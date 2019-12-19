# make sure netcat is installed
sudo apt install openssh-client openssh-server

# set up receiver
netcat -l -p 9999

# set up producer
netcat localhost 9999

# send message from producer, see it in receiver.