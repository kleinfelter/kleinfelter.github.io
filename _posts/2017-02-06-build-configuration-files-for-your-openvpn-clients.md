---
categories: []
layout: post
title: Build Configuration Files for Your OpenVPN Clients
created: 1486429712
redirect_from: /content/build-configuration-files-your-openvpn-clients
---
## Download a Config File From Your Router, If You Are Using a Router VPN Server

If you are using a router as your VPN server,

* Browse to your router
* Navigate to the VPN page >> OpenVPN Servers tab >> and click on Export.
* This will download a client config file.  The config file has a place for you to paste a client certificate and a client key.  Fetch them from your easy-rsa/keys_router folder, and use copy/paste to add their content to the downloaded .ovpn file.
* Continue editing your downloaded .ovpn file and:
    * Edit the "remote x.x.x.x 1194" line and replace x.x.x.x with your external IP address or your external DNS name.
* You've now got a fully usable client config file.
* Don't forget to update your readme.txt in your easy-rsa/keys_router folder, where you track to whom you assigned each certificate.
* If you are using a router as your VPN server, you're done with this page. [Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#build_client_config)


## Build Config Files If You Are Using a Pi VPN Server

<img src="/files/shakespeare-this-is-hard.png" height="140" width="400" style="margin: 0 0 10px 10px" >

Building a config file is hard.  Here's a script to help build it.  

On your key generation machine, put this in a file named ~/Packages/easy-rsa/build-client-config.sh (maybe just ~/easy-rsa for you).  It is based on a script found [here](https://gist.github.com/coolaj86/4120d90e57d1d01cd59f/raw/331d70d718746d567f2b3ac0c0c2801c901eecc4/MakeOpenVPN.sh), written by  Eric Jodoin.  **Be sure to edit EXTERNALIP.**

    #!/bin/bash
    DEFAULT="Default.txt"
    FILEEXT=".ovpn"
    KEY=".key"
    CA="ca.crt"
    TA="ta.key"
    NAME="${1%.*}"

    # Substitute your external IP address or the DNS name for the external IP address of your VPN server.
    # Consider registering a domain name specifically for this purpose.  If your IP address changes, you'll wish you had.
    # TODO: CHANGEME - Your external IP or DNS name here
    EXTERNALIP="vpn.example.com"

    if [ -z "${NAME}" ]; then
        echo "Please enter an existing Client Name:"
        read NAME
    fi

    while [ ! -f $NAME.crt ] ; do
        echo "[ERROR]: Client Public Key Certificate not found: $NAME.crt"
        echo "Please enter an existing Client Name:"
        read NAME
    done

    if [ ! -f $NAME$KEY ]; then
        echo "[Error]: Client Private Key not found: $NAME$KEY."
        exit -1
    fi

    if [ ! -f $CA ]; then
        echo "[ERROR]: CA Public Key not found: $CA"
        exit -1
    fi
    echo "CA public Key found: $CA"

    if [ ! -f $TA ]; then
        echo "[ERROR]: tls-auth Key not found: $TA"
        exit -1
    fi

    #Ready to make a new .opvn file - Start by populating with static content.
    #Make sure that you get the EOF outdented all the way
    cat <<-EOF > $NAME$FILEEXT
        client
        dev tun
        proto tcp
        resolv-retry infinite
        nobind
        persist-key
        persist-tun
        mute-replay-warnings
        ns-cert-type server
        key-direction 1
        cipher AES-256-CBC
        auth SHA256
        comp-lzo no
        verb 1
        mute 20
    EOF
    echo "remote $EXTERNALIP 443" >> $NAME$FILEEXT

    #append the CA Public Cert
    echo "<ca>" >> $NAME$FILEEXT
    cat $CA >> $NAME$FILEEXT
    echo "</ca>" >> $NAME$FILEEXT

    #append the client Public Cert
    echo "<cert>" >> $NAME$FILEEXT
    cat $NAME.crt | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> $NAME$FILEEXT
    echo "</cert>" >> $NAME$FILEEXT

    #append the client Private Key
    echo "<key>" >> $NAME$FILEEXT
    cat $NAME$KEY >> $NAME$FILEEXT
    echo "</key>" >> $NAME$FILEEXT

    #append the TA Private Key
    echo "<tls-auth>" >> $NAME$FILEEXT
    cat $TA >> $NAME$FILEEXT
    echo "</tls-auth>" >> $NAME$FILEEXT

    echo "Done! $NAME$FILEEXT created."

Note: Setting "comp-lzo no" does not permanently disable comp-lzo.  It merely makes no compression the default behavior for the client.  You can override this by pushing comp-lzo from the server.  Confusingly, if you specify nothing about comp-lzo, it is disabled *and the server cannot override it with a push*.  i.e. In order to allow the server to enable comp-lzo, you must first disable it (or enable it) on the client!

Mark it executable:

    chmod ugo+rx ~/easy-rsa/build-client-config.sh

Note: Before proceeding you must load the easy-rsa environment variables and set your working directory to /home/pi/easy-rsa-keys.  If you defined an alias as suggested [here](/content/install-and-configure-openvpn-server-linux#set_alias), you can execute these bash statements (choosing keys_**raspivpn**, when asked):

    easy-rsa
    cd $KEY_DIR

You'll need to run build-client-config.sh script for each client key.  Because all of your client keys are named user-*something*.key, you can run:

    for f in user-*.key ; do ~/Packages/easy-rsa/build-client-config.sh $f ; done

When you're done, you'll have a collection of .ovpn files -- one for each client key.  These files contain your keys, your certificates, and the settings necessary to access your VPN.  Guard them.  Keep them safe!

Create a readme.txt file in your ~/easy-rsa/keys directory to track who gets what .ovpn file.  For example, you might put something similar to the following in your readme.txt:

* Dad's Macbook = user-key1.ovpn
* Dad's iPhone = user-key2.ovpn
* Mom's Laptop = user-key3.ovpn
* Billy's Android = user-key4.ovpn

-----

[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#build_client_config)
