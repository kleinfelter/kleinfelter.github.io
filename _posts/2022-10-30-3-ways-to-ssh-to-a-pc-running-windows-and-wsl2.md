---
title: 3 ways to ssh to a PC running Windows and WSL2
---

There are 3 ways to ssh into a PC running Windows and WSL2 (Ubuntu):
* Running an ssh server on Windows
* Running an ssh server on WSL
* Running an ssh server on Windows AND on WSL

I'll walk you through the advantages/disadvantages of each, and conclude with a how-to of the method I prefer.

#### Why is this Hard?

You might think, "What's the problem? I'll just run sshd on Ubuntu and then I can ssh to port 22." 

With WSL2, Microsoft put Linux in a VM. That VM has its own private network. The Windows machine acts as a router for WSL to reach the outside (real) network. So WSL's port 22 (or any other port) is not visible to the outside world. Your WSL VM gets a different IP address every time you boot, complicating matters and make it tough to set up port forwarding.

#### Method 1: Running ssh Server on Windows

You can [install Microsoft's port of OpenSSH](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui) server on Windows. Follow the instructions at the link. You'll want OpenSSH server and client for the recommended solution.

Test it by opening a Command prompt and running `ssh localhost`. Login with your **WINDOWS** ID and password. You should get a PowerShell prompt.

When you login to the ssh server, the server will launch a shell for you. That shell is specified in the Registry at HKLM\SOFTWARE\OpenSSH\DefaultShell. By default, it points to `C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe`.

If you want to ssh to a PowerShell, it's simple and you're done.  If you're not running WSL, that's probably what you want to do. But if you're running WSL, you probably want to ssh to WSL.

[This guy](https://www.hanselman.com/blog/the-easy-way-how-to-ssh-into-bash-and-wsl2-on-windows-10-from-an-external-machine) tells how to update the registry to have Windows' ssh Server launch bash. It was the perfect, simple method. Then, sometime in mid-to-late 2022, Microsoft updated WSL2.  It was working just fine (for me). Then, I ran `wsl --update` and it broke:
* Sometimes I get a "The file cannot be accessed by the system" message.
* I always get "Connection to MACHINENAME closed" immediately after login.

If you track down wsl.exe in `C:\Users\USERNAME\AppData\Local\Microsoft\WindowsApps`, you'll see that it is zero bytes. This happened when Microsoft moved WSL into the Microsoft Store. It isn't a symlink, but it functions sort of like one. But you can't launch it from ssh server.  It is a [known issue](https://devblogs.microsoft.com/commandline/a-preview-of-wsl-in-the-microsoft-store-is-now-available/#are-there-any-known-issues-with-this-first-version).


#### Method 2: Running an ssh Server on WSL

You can [install sshd on Ubuntu](https://ubuntu.com/server/docs/service-openssh). Follow the instructions at the link. You'll want OpenSSH server for the recommended solution.

Test it by opening a bash prompt and running `ssh localhost`. Login with your Ubuntu ID and password.

This works very nicely, except you cannot connect to your ssh daemon from anywhere except a WSL session. That's not very useful.

I won't provide the details, but you could:
* Update the Windows firewall to permit incoming connections to a port. (If you're also running ssh server on Windows, you'll need to choose a port other than 22!)
* Set up port forwarding from your Windows machine to a port on your WSL machine.
* You'll have to update that forwarding on every reboot, because WSL assigns a different IP address to your WSL machine after a reboot.
* You'll need to get your WSL machine started before you can connect to it.

It can be done. [People are doing it](https://www.hanselman.com/blog/how-to-ssh-into-wsl2-on-windows-10-from-an-external-machine). It is a lot of work, it is complex, and it is fragile.


#### Method 3 Part 1: Running ssh on Windows AND WSL

Conceptually, you will ssh to the Windows ssh server, and then you'll ssh from there to WSL. You'll use Windows as a "jump server" to connect to WSL. Once setup, it is robust and flexible. This is the recommended method. I'll go into some detail.

* Install ssh Server on Windows, per the applicable link above. Test it by connecting from a Command window by running `ssh localhost`. Then go to another machine and ssh into your Windows machine. Confirm it works. Remember to use your Windows PASSWORD and not your Windows PIN.
* Install sshd on WSL, per the applicable link above. Test it by running `ssh localhost` from a bash shell. Then test by running `ssh localhost` from a Command prompt. (You should get a bash prompt when you connect.)
* On WSL, edit /etc/ssh/sshd_config (NOT ssh_config -- sshd_config) and change `#   Port 22` to `Port 2022`. Restart sshd, and test by running `ssh localhost -p 2022` -- first from bash and then from CMD on your Windows machine.
* Run a proof-of-concept: ssh from another machine to your Windows machine; then ssh from your Windows machine to WSL. Make sure it works before proceeding. (We will automate the jump-server relay connection, to make it transparent.)

#### Method 3 Part 2: Automating the Jump Server

For this example, I'll assume you have two Windows PCs named "HusbandPC" and "WifePC", and that there is a user named "husband" on HusbandPC and a user named "wife" on WifePC. The only WSL account is for user = "wife". We're going to name the WSL on WifePC "WifePC-wsl". (Yeah, that matches my setup, with names changed to protect the innocent.) I'm going to ssh from HusbandPC to WifePC. 

On HusbandPC -- the one you want to run ssh client on -- do the following:
* FIRST, delete any "localhost" entries from .ssh/known_hosts. ssh can't tell the difference between YOUR localhost and someone else's.
* ssh -J husband@wifepc wife@localhost -p 2022
    * That tells ssh to use wifepc as a jump server, to connect to port 2022 on localhost, which will be WSL.
    * Make sure that works before continuing.
* THEN, delete any "localhost" entries from .ssh/known_hosts. ssh can't tell the difference between YOUR localhost and someone else's. (Yeah, you did this earlier, but then you connected to localhost and you need to clean up again).
* Edit ~/.ssh/config on HusbandPC (NOT config.txt) and add lines like the following, replacing UPPERCASE items (HOSTNAME should be the Windows host name):
```
Host wifepc-wsl
	Hostname 127.0.0.1
	Port 2022
	ProxyJump wifepc
```
This says that when you run `ssh wifepc-wsl`, it will connect to ssh on wifepc (port 22 by default) and then use it as a jump server to ssh to 127.0.0.1 (port 2022). That would work if your user ID is the same on wifepc and wifepc-wsl, but suppose it is not...

IF your user-ID is not the same on client, jump-server, and HOSTNAME (e.g. your UID is "husband" on wifepc and "wife" on wifepc-wsl), you'll need a more complex config file:
```
Host jump-server
    HostName wifepc
    User husband
Host wifepc-wsl
	Hostname 127.0.0.1
	User wife
	Port 2022
	ProxyJump jump-server
```

Test it by running (from your client machine) `ssh HOSTNAME-wsl`. You'll have to enter login credentials on the jump server and then the WSL instance.

#### PROBLEM:

BUT... If you use this to connect via 2 jump servers, ssh can't tell the difference between "localhost" (or 127.0.0.1) on one server vs the other, in the known_hosts file.  You need to use HostKeyAlias to put a UNIQUE host name in known_hosts for each "localhost". So continuing with HusbandPC and WifePC, assume you need to ssh into wifepc-wsl and husbandpc-wsl:
```
Host jump-server1
    HostName husbandpc
    User husband
Host husbandpc-wsl
        Hostname 127.0.0.1
        User husband
        Port 2022
        HostKeyAlias localhost-husbandpc
        ProxyJump jump-server1
Host jump-server2
    HostName wifepc
    User husband
Host wifepc-wsl
        Hostname 127.0.0.1
        User wife
        Port 2022
        HostKeyAlias localhost-wifepc
        ProxyJump jump-server2
Host localhost
        Hostname 127.0.0.1
        port 2022
        HostKeyAlias localhost-real
```
This tells ssh to save certificates in known_hosts using alternative names for the various localhosts (i.e. localhost-husbandpc, localhost-wifepc, localhost-real).

#### No Passwords

[Set up password-free login](https://kleinfelter.com/ssh-without-a-password) on both the jump server and HOSTNAME-wsl. You *definitely* want it enabled on the jump server.
Note that the id_rsa.pub on your jump server is used to gain passwordless access to HOSTNAME-wsl.

#### sshd Quits After One Connect

sshd sometimes quits. I *think* the issue is that when there are no foreground processes running WSL shuts down. I'm not at all certain about that.

I used Task Scheduler to run "C:\Windows\system32\wsl.exe sudo cron" at the primary-user's Windows login. I also ran "sudo systemctl enable ssh" at a bash prompt. (I previously used visudo to edit sudoers, granting passwordless sudo to my primary user.) That seems to ensure that cron AND sshd are constantly running.

#### Reminder About WSL Instances

Each Windows user gets his own WSLs. (Not exactly, but close enough.) 

If Windows user winuser1 launches WSL and starts sshd, you get a DIFFERENT file system than if winuser2 starts sshd.

winuser1 can have linuxuser1 and linuxuser2, and winuser2 can have a DIFFERENT linuxuser1 and linuxuser2.
