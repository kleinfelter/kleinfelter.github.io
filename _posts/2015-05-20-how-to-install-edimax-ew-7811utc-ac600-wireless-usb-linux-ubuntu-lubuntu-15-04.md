---
categories: []
layout: post
title: How to install Edimax EW-7811UTC AC600 Wireless USB - Linux Ubuntu (Lubuntu
  15.04)
created: 1432138131
redirect_from: /content/how-install-edimax-ew-7811utc-ac600-wireless-usb-linux-ubuntu-lubuntu-1504
---
    sudo apt-get update
    sudo apt-get install linux-headers-generic build-essential git 
    git clone https://github.com/gnab/rtl8812au.git
    cd ~/rtl8812au
    make
    sudo make install
    sudo modprobe 8812au

Worked for me 2015.05.20.
