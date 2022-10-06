---
categories: []
layout: post
title: Set Up an OpenStack Lab VM
created: 1410817862
redirect_from: /content/set-openstack-lab-vm
---
I'm setting up a personal lab OpenStack server.

Install Ubuntu 14.04 Desktop in a VM [2014.09.15]

* Download http://www.ubuntu.com/download/desktop
* Using VMware Fusion 6
    * New VM:
    * Choose: Install from disc or image
    * More Options
    * Create a custom virtual machine
    * Linux, Ubuntu 64-bit
    * Create a new virtual disk (20 GB)
    * Name it "OpenStack Ubuntu"
    * Do not auto-run it.
    * Mount the ISO on the virtual DVD and start the VM
    * Respond to the Ubuntu prompts:
        * Install Ubuntu
        * Choose "Download updates while installing" and "Install this third-party software" and press Continue
        * Erase disk and install Ubuntu.  Press Install Now.
        * Choose location = "New York" (or your own time zone) and press Continue.
        * Keyboard layout = English(US).  I also chose the Dvorak layout.  Press Continue.
        * Enter your name (kevin), your computer name (openstack1), user name (kevin), password (my standard password), choose login automatically. Press Continue.
        * When it came time for it to restart, it locked up and I had to manually restart the VM.
    * From the Virtual Machine (vmware) menu, choose Install(Reinstall) VMware tools, and wait for the DVD to auto-mount on the Ubuntu desktop.
    * Copy the VMwareTools...gz to /tmp
    * cd /tmp
    * tar -zxvf *.gz
    * cd vmware-tools-distrib
    * sudo ./vmware-install.pl
        * Accept the default at all prompts.
    * sudo reboot
    * Confirm that clipboard sharing between the host and VM works.  (Copy some text from a host window into a guest window.)

Install Devstack: [2014.09.15]

* sudo apt-get install git
* git clone https://github.com/openstack-dev/devstack.git
* cd devstack
* cp ./samples/local.conf  .
    * Change all the passwords to your favorite password
* ./stack.sh
