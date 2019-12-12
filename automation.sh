# Check if zookeeper is running

zoo_process=`jps | grep QuorumPeerMain`

if ! [[$zoo_process]]
  then
    echo "Zookeeper is not running"
    echo "Restarting Zookeeper"
    zookeeper-server-start.sh ~/kafka/config/zookeeper.properties
  else
    echo "Zookeeper is already running"
    echo $zoo_process
fi