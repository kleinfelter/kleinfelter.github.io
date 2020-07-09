#!/bin/bash
# 'install' jekyll
echo "========================================"
echo "========== build-me.sh begins =========="
echo "========================================"

# fail the bash script if any command fails
set -e 
set -o pipefail

# You must cd to the directory with your Dockerfile and your docker-compose.yml before you run this script.

CONTAINER=`pwd`


echo "Calling docker-compose build"
docker-compose build
echo "========================================"
echo "========= build-me.sh finished ========="
echo "========================================"
