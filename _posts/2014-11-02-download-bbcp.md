---
categories: []
layout: post
title: Download bbcp
created: 1414979573
redirect_from: /content/download-bbcp
---
bbcp binaries for Mac OS X, Linux, and Windows can be found at http://www.slac.stanford.edu/~abh/bbcp/bin/

For Ubuntu:

    apt-get update
    apt-get -y install build-essential zlib1g-dev
    wget http://www.slac.stanford.edu/~abh/bbcp/bbcp.tgz
    tar xvfz bbcp.tgz
    cd bbcp/src
    make
    mv ../bin/*/bbcp /usr/local/bin/
