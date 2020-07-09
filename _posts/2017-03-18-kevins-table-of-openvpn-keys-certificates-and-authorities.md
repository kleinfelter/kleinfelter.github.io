---
categories: []
layout: post
title: Kevin's Table of OpenVPN Keys, Certificates, and Authorities
created: 1489874451
redirect_from: /content/kevins-table-openvpn-keys-certificates-and-authorities
---
### Kevin's Big List o' Files

Sometimes I run OpenVPN on a Linux server.  Sometimes I run OpenVPN on a consumer-grade router with a built-in OpenVPN. Just to be "helpful", they don't use identical terminology.  Here's where I keep it straight.

<p></p>
<p>You’re going to need a bunch of files with certificates.  You’ll give some of these to the server, some to the clients, and some you’ll keep secretly filed away. (See also <a href="https://openvpn.net/index.php/open-source/documentation/howto.html">this</a> .)</p>
<p></p>
<table style="width:104%;">
<colgroup>
<col style="width: 12%" />
<col style="width: 37%" />
<col style="width: 22%" />
<col style="width: 23%" />
<col style="width: 10%" />
</colgroup>
<tbody>
<tr class="even">
<td style="text-align: left;"><p><strong>File Name</strong></p></td>
<td style="text-align: left;"><p><strong>Merlin’s Name</strong></p></td>
<td style="text-align: left;"><p><strong>Needed By</strong></p></td>
<td style="text-align: left;"><p><strong>Purpose</strong></p></td>
<td style="text-align: left;"><p><strong>Secret</strong></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>config.ovpn</p></td>
<td style="text-align: left;"><p>(settings from checkboxes, textboxes, etc.)</p></td>
<td style="text-align: left;"><p>server</p></td>
<td style="text-align: left;"><p>configuration options</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>ca.crt</p></td>
<td style="text-align: left;"><p>Certificate Authority</p></td>
<td style="text-align: left;"><p>server + clients</p></td>
<td style="text-align: left;"><p>CA Root Certificate</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>ca.key</p></td>
<td style="text-align: left;"><p>n.a.</p></td>
<td style="text-align: left;"><p>key signing machine only</p></td>
<td style="text-align: left;"><p>Root CA private key</p></td>
<td style="text-align: left;"><p>Yes</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>dh{n}.pem</p></td>
<td style="text-align: left;"><p>Diffie Hellman parameters</p></td>
<td style="text-align: left;"><p>server</p></td>
<td style="text-align: left;"><p>Diffie Hellman parameters</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>server.crt</p></td>
<td style="text-align: left;"><p>Server Certificate</p></td>
<td style="text-align: left;"><p>server</p></td>
<td style="text-align: left;"><p>Server Certificate</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>server.key</p></td>
<td style="text-align: left;"><p>Server Key</p></td>
<td style="text-align: left;"><p>server</p></td>
<td style="text-align: left;"><p>Server Key</p></td>
<td style="text-align: left;"><p>Yes</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>user-{n}.crt</p></td>
<td style="text-align: left;"><p>n.a.</p></td>
<td style="text-align: left;"><p>user-{n}</p></td>
<td style="text-align: left;"><p>Client Certificate</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>client{n}.key</p></td>
<td style="text-align: left;"><p>n.a.</p></td>
<td style="text-align: left;"><p>client{n}</p></td>
<td style="text-align: left;"><p>Client Key</p></td>
<td style="text-align: left;"><p>Yes</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>ta.key (static.key)</p></td>
<td style="text-align: left;"><p>Static Key</p></td>
<td style="text-align: left;"><p>server + clients</p></td>
<td style="text-align: left;"><p>Extra, optional security for connecting</p></td>
<td style="text-align: left;"><p>Yes</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>crl.pem</p></td>
<td style="text-align: left;"><p>Certificate Revocation List</p></td>
<td style="text-align: left;"><p>server</p></td>
<td style="text-align: left;"><p>Blacklisting of certificates</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>?</p></td>
<td style="text-align: left;"><p>Extra Chain Certificates</p></td>
<td style="text-align: left;"><p>?</p></td>
<td style="text-align: left;"><p>Merlin has this field. I don't know what it's for.</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>.csr files</p></td>
<td style="text-align: left;"><p>(not referenced)</p></td>
<td style="text-align: left;"><p>key generation machine</p></td>
<td style="text-align: left;"><p>Intermediate files for building certificates</p></td>
<td style="text-align: left;"><p>No</p></td>
</tr>
</tbody>
</table>
<p></p>
<p></p>
<h2>Details of files:</h2>
<p></p>
<ul>
<li><p>ca.crt </p>
<ul>
<li><p>All of your keys/certificates will be signed by a root certificate authority (CA).  This is the certificate of your CA.  You can act as your own CA or you can use a commercial CA.  This document assumes you act as your own CA.  Any (non-revoked) client certificate signed by this CA will be able to login to your VPN, so you may want a unique CA certificate for your VPN.</p></li>
</ul></li>
<li><p>ca.key</p>
<ul>
<li><p>This is the private key of your CA. You need it on you key generation machine.  You do not need it on your VPN server.</p></li>
</ul></li>
<li><p>dh{n}.pem, dh.pem</p>
<ul>
<li><p>The Diffie Hellman algorithm generates a unique *session* key via a well-known algorithm.  This is a seed for that algorithm.   It allows you to &quot;create an encryption key with someone, and then start encrypting your traffic with that key. And even if the traffic is recorded and later analyzed, there's absolutely no way to figure out what the key was.”  Contrary to my expectation, you don’t have to keep this secret because parts of the DH exchange are random values.  Sometimes this file is named dh2048.pem (or dh4096.pem); sometimes it is named dh.pem.</p></li>
</ul></li>
<li><p>server.crt</p>
<ul>
<li><p>This identifies your VPN server and contains its public key.  Merlin names it server.crt.  I generate two server certificates: server-raspi.crt and server-router.crt
</p></li>
</ul></li>
<li><p>server.key</p>
<ul>
<li><p>This is your VPN server’s private key.  Merlin names it server.key.  I generate two server certificates: server-raspi.key and server-router.key</p></li>
</ul></li>
<li><p>user-{n}.crt, user-pass-{n}</p>
<ul>
<li><p>This identifies your client and contains its public key.  There is one per client. Some of these are named user-pass-{n}.  Those users have passworded keys.</p></li>
</ul></li>
<li><p>user-{n}.key, user-pass-{n}</p>
<ul>
<li><p>This is your client’s private key.  There is one per client. Some of these are named user-pass-{n}.  Those users have passworded keys.</p></li>
</ul></li>
<li><p>ta.key (static.key)</p>
<ul>
<li><p>Used for &quot;Extra HMAC authorization” (Merlin’s name) or the “tls-auth” configuration line in OpenVPN.  This is an optional, *extra* key, used to authenticate the TLS handshake.  When your client makes its initial connection to the server, this information gets passed.  If the client doesn’t pass it, the server doesn’t respond, protecting against some attacks.  OpenVPN has 2 authentication modes.  “Static Key” and “TLS”. Merlin overloads this field and uses it for BOTH methods’ static key. Merlin calls it "static.key".  In my Linux config, I name it "ta.key". With Merlin, you must set “TLS control channel security” = 0, or this file won't be created.</p></li>
</ul></li>
<li><p>crl.pem</p>
<ul>
<li><p>Used to revoke or blacklist certificates.  You revoke a certificate when someone loses the laptop/phone with that certificate.  Or maybe you revoke your ex-spouse's certificate when the divorce is final.  ;-)</p></li>
</ul></li>
<li><p>.csr files</p>
<ul>
<li><p>In order to create a certificate, you collect some data and get it signed by your Certificate Authority.  The .csr files are input to the CA signing.  The signed .crt files are the output.  Once you have the .crt, you don't need the .csr.</p></li>
</ul></li>
</ul>
<p></p>

I hope that helps to keep everything straight.  It can be confusing!
