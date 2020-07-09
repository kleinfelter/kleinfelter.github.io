---
title: ssh Without a Password
excerpt: "Here's how to set up password-free ssh.&nbsp; Work out any problems with
  passworded ssh before proceeding. \r\n      \r\n  <ol>\r\n    <li>On the client
  machine, run &quot;ssh-keygen -t rsa&quot; (Note: Only do this if you don't have
  ssh without password connecting from this client to ANYWHERE.) </li>\r\n    <li>Copy
  your id_rsa.pub (or your identity.pub, or whatever you've named your public key)
  to the server as ~/.ssh/authorized_keys.&nbsp; If you already have an authorized_keys,
  append your id_rsa.pub to that file. </li>\r\n    <li>On the server:\r\n<ul>\r\n
  \       <li>chmod 600 .ssh </li>"
layout: post
created: 1244488942
---

**Short form**:

* `ssh-copy-id user@host`

**Long form**:

Here's how to set up password-free ssh. 

* Work out any problems with passworded ssh before proceeding. 
* On the client machine, run "ssh-keygen -t rsa". (Note: Only do this if you don't have ssh without password connecting from this client to ANYWHERE.)
* Copy your id_rsa.pub (or your identity.pub, or whatever you've named your public key) to the server as ~/.ssh/authorized_keys. If you already have an authorized_keys, append your id_rsa.pub to that file. If you have no other authorized_keys, the command will be something like:
    * `scp ~/.ssh/id_rsa.pub username@hostname:.ssh/authorized_keys`
* On the server:
    * `chmod 700 .ssh`
    * `chmod 600 .ssh/authorized_keys`
* On the client, run `ssh yourId@yourServer`; and it should login without a password.

**Debugging**:

If you still get a password prompt after you set this up:

* On the server: `chmod go-w ~`
* On the server: `chmod 700 ~/.ssh`
* On the server: `chmod 600 ~/.ssh/authorized_keys`

Then try again.  If you still fail:

* On the server: `sudo tail -f /var/log/auth.log` (that's the path for Ubuntu 18)
* On the client: `ssh -v user@host`

You should see something like this on the client:

```
debug1: Authentications that can continue: publickey,password
debug1: Next authentication method: publickey
debug1: Offering public key: RSA SHA256:blahBlah  /Users/username/.ssh/id_rsa
debug1: Server accepts key: pkalg rsa-sha2-512 blen 279
debug1: Authentication succeeded (publickey).
```

You're looking for it to offer public key and for publickey to succeed.

On the server, you should see something like:

```
Sep  4 14:26:22 hostname sshd[10444]: Accepted publickey for username from 192.168.1.22 port ...
Sep  4 14:26:22 hostname sshd[10444]: pam_unix(sshd:session): session opened for user username by (uid=0)
Sep  4 14:26:22 hostname systemd-logind[1450]: New session 240 of user username.

```

Usually, you'll see a pretty clear message in the server's log about having a permission wrong somewhere.  You need:

* ONLY YOU to be able to write to your home directory 
* ONLY YOU should have read permission for .ssh and authorized_keys
* ONLY YOU should have write permission for .ssh and authorized_keys.

-----


UPDATE: It looks like something changed in the cygwin ssh and now ssh2 is the default.  Consequently, if you have a keygen-generated a file named "identity", you need to rename the private key to be id_rsa (or you could "ln identity id_rsa").

UPDATE2: If you've checked your permissions and file contents, and everything looks right, but it keeps doing password authentication, try specifying the identify file to use via the command line.  e.g.

* `ssh -i /path/to/identity username@remotehost`

UPDATE3: Note that ssh uses your home directory as defined in /etc/passwd, and not an environment variable.  Oddly, you can do "cd ~/.ssh" and end up in the directory which bash thinks is your home directory, and wind up with ssh looking for .ssh in a completely different directory.  If UPDATE2 fixes your problem, fixing your /etc/passwd entry may help.

Tested with Cygwin ssh client, Ubuntu 9, and a few flavors of Solaris.  This is basic stuff, so it should work with all Unix-like systems.

If you have set up public key authentication, and you want to force a particular ssh session to use password-based authentication, you can use the following:

* `ssh -o PubkeyAuthentication=no user@remotehost`

How it works:  The ssh client encrypts a string with your private key.  The ssh server decrypts it with your public key.  Only things encrypted with your private key can be decrypted with your public key, so the server knows you're you.