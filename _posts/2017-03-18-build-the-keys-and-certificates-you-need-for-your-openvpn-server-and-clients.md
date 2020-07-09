---
categories: []
layout: post
title: Build the Keys and Certificates You Need for Your OpenVPN Server and Clients
created: 1489872284
redirect_from: /content/build-keys-and-certificates-you-need-your-openvpn-server-and-clients
---
* *Summary: Install easy-rsa, configure it, generate CA+key+certs*

We're going to use a tool called easy-rsa to build your keys and certificates.  You can install easy-rsa on your Pi and run it there, but you only need easy-rsa when you're building keys/certificates -- not when you are using them (and using your VPN).  I prefer to build them on my Mac.  If you are a Windows user, you *can* build your keys on a Windows PC, but you'll find it easier to build them on your Pi.  Generating keys is slow on a Pi, but it is faster to run easy-rsa on a slow Pi than it is to figure out how to make it work on a fast Windows PC.

I'm going to refer to your 'key generation machine' and your 'VPN server'.  Your key generation machine is the machine you're using to run easy-rsa, whether you decided to use your Pi, a Mac, a Windows PC, etc.

## Install Software

If your key generation machine is your Pi:

    sudo apt-get install openvpn
    mkdir ~/Packages
    cp -r /usr/share/easy-rsa ~/Packages

If your key generation machine is a Mac, browse to [the OpenVPN github site](https://github.com/OpenVPN/easy-rsa/releases) and download EasyRSA-2.2.2.tgz.  (There are some significant changes with v3, so you'll have some challenges if you use my instructions with 3.x.  As near as I can tell, there's nothing obsolete about the keys/certificates which 2.2.2 generates.  3.x just provides a different model for generating certs -- and breaks all the old commands.) Then, in the directory where you downloaded it:

        tar -zxvf EasyRSA-2.2.2.tgz
        mkdir ~/Packages
        rm EasyRSA-2.2.2.tgz
        mv EasyRSA-2.2.2 easy-rsa
        mv easy-rsa ~/Packages/

* Install [Tunnelblick](https://tunnelblick.net/), if you don't already have it.

If you're running it on Windows, install easy-rsa 2.2.2 from https://github.com/OpenVPN/easy-rsa/releases.  I'm not going to provide instructions for Windows.  If you're determined enough to make it work on Windows, you don't need my help!

Note: Throughout these instructions, I'll refer to your home directory as /Users/kevin.  This is probably NOT your home directory.  You should substitute YOUR home directory.  On a Pi, your home directory is probably /home/pi.   I'm running easy-rsa from /Users/kevin/Packages/easy-rsa.  You should substitute the path where *you* installed easy-rsa.

-----

## When we're done with certificates:

* ~/Packages/easy-rsa/keys_xxxxx on the key generation machine will contain your 'master' copy of keys and certificates.  Preserve this data for future redeploys in case your VPN server's disk fails or one of your client's disk gets wiped!  You want to keep this directory secure, because anyone with access to it can use your VPN.  You should probably NOT leave this data on your OpenVPN server because if someone got ahold of the CA key, they could generate all the client keys they wanted, and you might not notice.
    * It it common to simply use ~/easy-rsa/keys.  For bonus points, I'm building keys for TWO VPNs at once.  I plan to run one VPN on a Raspberry Pi and the other on a consumer router that includes OpenVPN.  So I need two 'keys' directories.  Also, I have many subfolders of my home folder, and I group code-plus-data packages into ~/Packages.
* /etc/openvpn/server1 on your VPN server will contain your server's private key, in addition to some less confidential keys and certificates.  You want to keep this directory secure, because anyone with access to it can masquerade as your VPN server.

## Configuring easy-rsa

Continuing, execute the following on your key generation machine:

* <a name="set_alias"></a>If you have a file named ~/.profile, add the following to that file.  If you don't have a .profile and you do have a .bash_profile, add the line to it. 

        alias easy-rsa="cd /Users/kevin/Packages/easy-rsa; source vars"

* Then source .profile or .bash_profile, as appropriate.  e.g.

        source .bash_profile

* Then run it:

         easy-rsa

* Edit ./vars and change these variables.  Use values that match your situation.  These apply to *me* but may not to you!

        export KEY_DIR=keys_raspivpn            # TODO: Later, use keys_routervpn
        export EASY_RSA="/Users/kevin/Packages/easy-rsa"
        export KEY_SIZE=2048
        export CA_EXPIRE=10000
        export KEY_EXPIRE=10000  
        export KEY_COUNTRY="US"
        export KEY_PROVINCE="GA"
        export KEY_CITY="Atlanta"
        export KEY_ORG="KleinfelterFamily"
        export KEY_EMAIL="kevin@example.com"    #TODO: Changeme
        export KEY_OU="RaspiVPN"                #TODO: Later, use RouterVPN

* Estimates are that a 2048 bit key is good to the year 2030.  I'd prefer not to come back and re-do this in 15 years, so I'd *like* a 4096-bit key, but there are stories that performance with a key that large can be poor on some devices.  I plan to use this with cell phones with limited CPU and battery, so I'm going with 2048.
* I'm also setting expirations to 10,000 days which is 27 years.  I've never seen the merit of date-limited CRLs.  I would have gone higher, but when I used 12,000, it said that the CRL was already expired, whenever I used it or when I revoked a cert.
* Edit openssl*.cnf and set:

        default_crl_days=10000

* If you don't do this, your CRL will expire in a month and when your CRL expires, the server will refuse ALL logins.
* Then run:

        source vars
        mkdir "$KEY_DIR"

* **Mac only**: If you are on Linux, openvpn should already be on your path.  If you are on Mac, you may have to add openvpn to your path.  OpenVPN is bundled with Tunnelblick.  If you install a different version of Tunnelblick than the one I used, you may have to tinker with PATH.  After you run the "ls", adjust the PATH statement below to use your latest openvpn-x-openssl-y.  
    * ls -l /Applications/Tunnelblick.app/Contents/Resources/openvpn/
    * Edit your ~/.bash_profile and add something like:

            TBVPN="/Applications/Tunnelblick.app/Contents/Resources/openvpn"
            TBSSL="$TBVPN/openvpn-2.4.0-openssl-1.0.2k"
            export PATH="$PATH:$TBSSL"

    * Be sure to "source ~/.bash_profile".

## Build CA and Server Key

* Enough setup! It is time to build your OpenVPN data.  Begin by emptying your easy-rsa keys folder.  You don't really *have* to do this the *first* time, but this step is here in case you come back to re-do your keys.  (I did.)

        ./clean-all

* Build your [Certificate Authority](/content/kevins-table-openvpn-keys-certificates-and-authorities).  Your keys are all signed by this CA.  
    * This isn't a globally trusted CA, but that's OK because you're the only person who has to trust it.  
    * If you're building two VPNs, take all the defaults EXCEPT ONE when it asks.  (If you're building just one, you can take ALL the defaults):  
        * For "Common Name (eg, your name or your server's hostname) \[KleinfelterFamily CA\]", tell it
            * **KleinfelterFamily.RaspiVPN CA** (when you're building keys for your Pi-based VPN.
            * **KleinfelterFamily.RouterVPN CA** (when you're building keys for your router-based VPN.
    * Run this:

            ./build-ca

        * Keep responding to build-ca prompts with enter (except on Common Name) until you're back at the shell prompt.  
        * Note: Since I'm building two VPNs, I will end up creating two CA.  I need two CA because I need one VPN server to trust one CA and the other VPN server to trust the other CA.  If I used just one CA, all of my users could use *both* of my VPNs.

* Build your [server key](/content/kevins-table-openvpn-keys-certificates-and-authorities) and name it with the given name.  Take all the defaults when it asks.  When it asks whether to sign it, say yes.  Ditto for committing your changes.  I'm naming my cert "server-raspi".  You might want to name yours something more suitable for you.

        ./build-key-server server-raspi      # TODO: Later, use server-router

* We'll use the [TLS authentication key](/content/kevins-table-openvpn-keys-certificates-and-authorities) to harden your server against DDOS attacks which make excessive connections to your server.  Connections to the OpenVPN port don't happen without a valid ta.key.

        openvpn --genkey --secret "$KEY_DIR/ta.key"

* Build the [Diffie-Hellman data](/content/kevins-table-openvpn-keys-certificates-and-authorities).  DH data plus some random data is used to generate *session* keys.   This took 20 minutes on my Pi.  You might consider running it with nohup.  One time, it ran for over 4 hours without completing.  I killed it and restarted it.  Since 'random' is involved, that may explain the difference, but I'm not certain.

        ./build-dh

## Client Keys

We're going to build 40 keys, permitting up to 40 clients.  You can come back and build more keys later, but by then *I* will have forgotten how.  Build a nice big supply of them now, and store them somewhere safe.  Distribute them as needed.  Make a little readme.txt in your keys folder to track where you use each one.  

Note that the script below will create some unpassworded keys.  With one of these keys, you can login to the VPN without a password.  Passworded keys are built with ./build-key-pass instead of ./build-key. (When it asks for PEM pass phrase, assign it a password.  This is the password you will use to unlock this key.) If one of your VPN 'clients' is an unattended server, that doesn't work smoothly with a passworded key.  My keys will go on my family's computers and phones.  These are all passworded devices and if someone loses one, I'll revoke the key before the finder can crack the password..

If you use ./build-key-pass, you'll want to enter the desired password for PEM passphrase. ''Do NOT enter a value for "challenge" password.''

If you built your keys on your Mac, execute the following commands on your Mac.  If you built your keys on your Pi, execute these commands on your Pi. (**It is probably wise to put these in a shell script and run it**.)

You must respond 'y' to the prompt to sign the certificate and the prompt to commit.  Everything else can be left at the default.

Note: easy-rsa is an interface designed for low volume.  We're going to push a lot of requests through it and if we get one response wrong, we create a mess.  Open up a text note and put exactly 10 newlines in it.  Copy them into your clipboard.  (Check via paste into another document, to be sure you have exactly 10.)  After pressing enter to respond to the prompt about entering a suffix, paste your 10 newlines.  This should take you right up to the prompt to commit.

If you make a mistake and you see, "CERTIFICATE WILL NOT BE CERTIFIED", press control-C to interrupt, delete *that* key, edit your script to start with that key, and continue.  Nothing is permanent in the 'database' until you commit the change.  If you commit a bad change, you have to start over at "./build-ca".  (I think.)

* **After responding to the suffix prompt, paste your 10 newlines.**

For myself, I created the following NAMED un-passworded: kevin-mac, kevin-windows, kevin-cell

And the following NAMED passworded: wife-pc, wife-cell, kid1-pc, kid1-cell, kid2-pc, kid2-cell

    easy-rsa
    function getsuffix {
        echo  "Building $1.  You can attach a suffix to the key name like 'Jane'" 1>&2
        echo -n "Enter your suffix or press enter for no suffix:" 1>&2
        read suffix
        if [ "." = ".$suffix" ] ; then
            echo "$1"
        else
            echo "$suffix"
        fi
    }
    echo "BEGIN unpassworded keys"
    for i in {01..15} 01-bogus 02-bogus initialize-crl ; do
        ./build-key "user-$(getsuffix $i)"
    done
    echo "END unpassworded keys"
    echo "BEGIN passworded keys"
    for i in {15..30} ; do
        ./build-key-pass "user-pass-$(getsuffix $i)"
    done

In this example, we created unpassworded keys and passworded keys, plus we're creating bogus keys so we can practice/validate our CRL (Certificate Revocation List).  We will use "initialize-crl" to seed our CRL later.  Save your passwords in your keys folder in a readme.txt and "chmod go-rw readme.txt".  You'll have to provide these passwords to your users and they won't be able to change them, so you might want to come up with unique passwords for each user.

Reminder: Your client keys and certificates do [NOT need to be stored on your VPN server](/content/keys-certificates-certificate-authorities-are-your-us-passport).

## Initialize the CRL

    ./revoke-full initialize-crl

## Old Cell Phones

Note: For some older iOS and Android devices, there's a rumor that you'll need to convert the key to a triple-DES (3DES) key.  You do that with a line like the following, but I've not got devices old enough to require DES, so I didn't use it.  If you used build-key-pass, you'll provide the desired password at the "Enter PEM pass phrase" prompt.

    openssl rsa -in Client1.key -des3 -out Client1.3des.key # Do not run unless you know you need it.

-----

If you're me, and you're building TWO servers, go back and do everything on this page again, for the second server, using the second server's name at the TODO items, beginning with "Configuring easy-rsa".

After you've created two sets of keys, edit the "vars" file and replace this:

    export KEY_DIR=keys_routervpn

with this

    echo -n "Do you want KEY_DIR to be $EASY_RSA/keys_routervpn? (y/n)[y]:"
    read response
    if [ ".$response" != ".n" ] ; then
        choice=keys_routervpn
    else
        echo -n "Do you want KEY_DIR to be $EASY_RSA/keys_raspivpn? (y/n)[y]:"
        read response
        if [ ".$response" != ".n" ] ; then
            choice=keys_raspivpn
    else
            echo -n "What sub-directory of $EASY_RSA will you use for KEY_DIR? [keys]:"
            read response
            if [ "." = "$response" ] ; then response=keys ; fi
            choice="$response"
        fi
    fi
    echo "Using KEY_DIR=$EASY_RSA/$choice"

-----

## What Have I Created?

See [OpenVPN Keys, Certificates, and Authorities](/content/kevins-table-openvpn-keys-certificates-and-authorities) for a reference.

Keep all of the .key files secure and confidential.  Use "chmod go-rwx" on your keys folder. 

-----
[Back to Surf Safe at Starbucks](/content/surf-safe-starbucks#install_the_os)
