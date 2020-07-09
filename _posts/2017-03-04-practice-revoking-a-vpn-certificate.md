---
categories: []
layout: post
title: Practice Revoking a VPN Certificate
created: 1488668974
redirect_from: /content/practice-revoking-vpn-certificate
---
<img src="/files/cancel.png" height="133" width="200" style="float: right; margin: 0 0 10px 10px" >

Sooner or later, someone is going to lose a laptop or a cell phone and you'll need to revoke his/her certificate so that the thief can't use your VPN.  When you put a .ovpn file on an client, be certain that client has a good password (e.g. a good screen-lock PIN on your cell phone or a strong Windows password on your Windows PC - with a short timeout on the lock-when-idle.)

On the machine where you built your keys:

* cd $EASY_RSA
* Edit openssl*.cnf and change "default_crl_days= 30" to "default_crl_days= 14600" (40 years).  If you don't do this, your CRL will expire in a month and if your CRL expires, the server will refuse ALL logins.

        easy-rsa
        ./revoke-full user-key01-bogus

It will respond with "error 23 at 0 depth lookup:certificate revoked".  That's what you want, but it is phrased confusingly.

If your keys are built on your Pi, execute:

    mv ./keys/crl.pem /etc/openvpn/
    sudo service openvpn restart

If your keys are built on your Mac:

* On the Mac, execute:

        scp ./keys/crl.pem pi@raspi:crl.pem

* On the Pi, execute:

        sudo mv ~/crl.pem /etc/openvpn/
        sudo service openvpn restart

* Add the following to /etc/openvpn/server1.conf.  (You couldn't add it until you created a .pem file, or else OpenVPN will throw an error on startup.)

        crl-verify /etc/openvpn/crl.pem

And confirm that your client can no longer connect.  (Because you revoked access.)  Check /var/log/openvpn.log and confirm that you see "CRL CHECK FAILED" in it.

Test again by:

* Import user-key02-bogus.ovpn into your OpenVPN client
* Confirm that you can connect with bogus key 2
* Confirm that you still cannot connect with bogus key 1
* Revoke bogus key 2
* Confirm that neither bogus key 1 or 2 can connect.

Note: If your CRL expires, just re-revoke any revoked certificate (or a new one).  Revoking any certificate, even an expired one, re-generates the CRL.

-----

[Back to Surf Safe at Starbucks](/content/surf-safe-starbucks#revoke_cert)


