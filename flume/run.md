# Running flume agents

## run flume agent to output to terminal
    > flume-ng agent / 
        --conf $FLUME_HOME/conf /
        --conf-file /path/to/nc_to_log.conf / 
        --name a1 /
        -Dflume.root.logger=InFO,console