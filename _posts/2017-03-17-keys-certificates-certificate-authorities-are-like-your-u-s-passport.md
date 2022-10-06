---
categories: []
layout: post
title: Keys, Certificates, Certificate Authorities, are Like Your U.S. Passport
created: 1489799103
redirect_from: /content/keys-certificates-certificate-authorities-are-your-us-passport
---
* *Summary: Server can accept any CA-approved cert without a list of authorized users*

When I found out that my OpenVPN server didn't need a list of valid user IDs, I was nonplussed.  How can you have a server without a list of authorized users?  Let me draw an analogy...

<img src="/files/state-department.png" height="230" width="230" style="float: right; margin: 0 0 10px 10px" >

When you travel abroad, you take your passport.  When you return to the country, you present your passport to Customs.  They check your passport to see if it is valid.  Unless you are on a blacklist, they let you in (if you haven't stuffed a pound of cocaine into your underwear!)

Customs does not have a list of citizens and they don't check to see if you are on the list of people to admit.  They only check to see if your credentials are good and if you are on a blacklist.  They can do this because we all agree that the State Department has the authority to issue passports.

When your VPN and your client certificates are created, they are signed by a Certificate Authority (CA).  Both your client and the server have a copy of the CA's certificate and its public key.

When you login to the VPN server, your VPN client sends your certificate.  The server looks at your certificate and sees that it was issued by the CA.  It uses the CA's public key to validate your certificate as having been issued by that CA.  Part of your certificate was encrypted by the CA's private key, so only the CA's public key can decrypt it.  That's how the server knows that your certificate really was issued by the CA.  

Your certificate is like your passport.  The server looks at the certificate, just like Customs looks at your passport.  If your certificate is issued by a CA your server trusts, it lets you in -- just like Customs lets you in if your passport is issued by the State Department.  It also checks to see if you're on a blacklist (a Certificate Revocation List, or CRL).  If you're not on the CRL, you're logged in.

In addition, your client sends its public key to the server.  Your client uses your private key to encrypt traffic, so the server needs your public key in order to decrypt it.

Note: You *can* choose to set up your server to require BOTH a certificate and to also have a list of authorized ID/password pairs.  It's your choice.

-----
[Return to Safe Surfing at Starbucks](/content/surf-safe-starbucks#your_passport)
