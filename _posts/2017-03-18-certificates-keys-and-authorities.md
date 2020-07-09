---
categories: []
layout: post
title: Certificates, Keys, and Authorities
created: 1489874172
redirect_from: /content/certificates-keys-and-authorities
---
### Certificates

VPNs use certificates and keys.  We're going to spend some time building certificates and keys, so we should get clear on what they are.

<img src="/files/certificates-and-keys.png" height="201" width="400" style="float: right; margin: 0 0 10px 10px" >

* A *certificate* is used to prove who you are.  (More accurately, it proves that a computer is who it says it is.) A driver's license is an example of a non-computer certificate.
* A *key* is used to lock/unlock something.  (More accurately, it encrypts or decrypts something.)  The key to your front door is an example of a non-computer key.
* A *certificate authority* is used to mark certificates and keys as being 'official.'

Certificates and encryption are what make OpenVPN secure.  Managing client certificates is a big part of managing any VPN server.  I'm going to generate a server certificate and I'm going to generate many client certificates.  It will be more than I think I'll need, but I'll go ahead and generate them all now, before I forget how.  I'll use a tool called easy-rsa.

-----

[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#your_passport)
