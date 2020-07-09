---
title: Same UID in Docker Container and Host
---

Sometimes, it is convenient to have a UID in a Docker container match the UID in the host.  You can't do it all the time and it isn't everyone's cup of tea, but here's how I made my MySQL user ID and gr

First, I always create a build script.  i.e. Don't just build your container from a Dockerfile via a straight command line.  I call my build script "build-me.sh".  I also always use docker-compose.  Tha

Here's code from build-me.sh:

```bash
if ! id -u mysql ; then
    sudo groupadd -g 400 mysql
    sudo useradd -Ms /bin/false -u 400 -g mysql mysql
fi
MYSQLUID=`id -u mysql`
MYSQLGID=`id -g mysql`
```

If there is not already a mysql user, we'll create one with UID and GID 400.  You could use another number.  I've just standardized on that one.  Then, whether or not we created a UID, we retrieve the c

Here's the build statement:

```bash
docker-compose build --build-arg MYSQLUID=$MYSQLUID --build-arg MYSQLGID=$MYSQLGID
```

And here's an excerpt from Dockerfile:

```text
FROM ubuntu:18.04
ARG MYSQLUID
ARG MYSQLGID
...
RUN id mysql || ( sudo groupadd -g 400 mysql &&  sudo useradd -Ms /bin/false -u 400 -g mysql mysql )
RUN apt-get -y install mysql-server
```