#!/bin/bash
container=$(basename $(pwd))

tmp=`docker ps | grep $container| wc -l`
if [ $tmp -ne 0 ] ; then
    echo " "
    echo "    Stopping old $container"
    ./stop-me.sh
fi


docker-compose up --detach
echo "Started $container"
