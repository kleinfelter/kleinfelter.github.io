---
categories: []
layout: post
title: Set Up an OpenStack Lab VM
created: 1414979541
redirect_from: /content/set-openstack-lab-vm-0
---
I'm setting up a personal lab OpenStack server.

Install Ubuntu 14.04 Desktop in a VM [2014.10.31]

* Download http://www.ubuntu.com/download/desktop
* Using VMware Fusion 7
    * New VM:
    * Choose: Install from disc or image
    * More Options
    * Create a custom virtual machine
    * Linux, Ubuntu 64-bit
    * Create a new virtual disk (20 GB)
    * Do not auto-run it.
    * Mount the ISO on the virtual DVD and start the VM
    * Respond to the Ubuntu prompts:
        * Install Ubuntu
        * Choose "Download updates while installing" and NOT "Install this third-party software" and press Continue
        * Erase disk and install Ubuntu.  Press Install Now.
        * Choose location = "New York" (or your own time zone) and press Continue.
        * Keyboard layout = English(US).  I also chose the Dvorak layout.  Press Continue.
        * Enter your name (kevin), your computer name (openstack-kpk), user name (kevin), password (my standard password), choose login automatically. Press Continue.
        * When it came time for it to restart, it locked up and I had to manually restart the VM.
    * Update Ubuntu to pick up all patches
    * sudo apt-get install git
    * From the Virtual Machine (vmware) menu, choose Install(Reinstall) VMware tools, and wait for the DVD to auto-mount on the Ubuntu desktop.
    * Copy the VMwareTools...gz to /tmp
    * cd /tmp
    * tar -zxvf *.gz
    * cd vmware-tools-distrib
    * sudo ./vmware-install.pl
        * Accept the default at all prompts.
    * sudo reboot
    * Confirm that clipboard sharing between the host and VM works.  (Copy some text from a host window into a guest window.)

Install Devstack: [2014.10.31]

* git clone https://github.com/openstack-dev/devstack.git
* cd devstack
* ./stack.sh
    * Be careful: for the FIRST password, the one you choose will become your mysql root password for the whole VM, not just openstack.
    * For the rest of the passwords, 'nova' is a fine password for a development environment.  
    * (I inadvertently set up mysql root and all the openstack passwords to match my Linux login password, which would be a problem if I weren't using a private, inaccessable VM.)
* At the end of stack.sh, it will say something like the following.  Be sure to capture the URLs.

    Horizon is now available at http://192.168.137.130/
    Keystone is serving at http://192.168.137.130:5000/v2.0/


Interesting openstack commands:

* ./stack.sh
* ./unstack.sh
* ./rejoin_stack.sh

I finished the setup, now I want to tear down devstack and start over:

* If devstack is running:
    * cd devstack
    * ./unstack.sh
* Just "rm -rf devstack" and repeat the "Install Devstock" instructions.
* Note: Be sure to use the same mysql password you used the first time, because the first install ran your mysql install and set its root password.

Helpful URLs:

* http://www.rushiagr.com/blog/2014/04/03/openstack-in-an-hour-with-devstack/
* https://lists.launchpad.net/openstack/msg24529.html
* http://www.rushiagr.com/blog/2013/05/27/cinder-on-devstack-quick-start/
* http://devstack.org/

Some hints:

* Passwords are saved in devstack/localrc
* Default users are 'admin' and 'demo'
