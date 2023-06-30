#!/bin/bash
container=$(basename $(pwd))
echo "Current dir is `pwd` and container is $container"

docker-compose up --detach
echo "Started $container"
