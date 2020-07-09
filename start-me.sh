#!/bin/bash
container=$(basename $(pwd))

docker-compose up --detach
echo "Started $container"
