# Running flume agents

# port 99999

## run flume agent to output to terminal
flume-ng agent \
--conf $FLUME_HOME/conf \
--conf-file /home/hadoop/Desktop/nc_to_log.conf \ 
--name a1 \
-Dflume.root.logger=InFO,console