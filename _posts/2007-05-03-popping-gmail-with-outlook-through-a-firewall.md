---
excerpt: |-
  <p>Suppose you need to send/receive your GMail using POP3 and Microsoft Outlook. Easy. Suppose you're behind a firewall that permits only HTTP and HTTPS. Harder, but still possible if you have a server that you control that is outside the firewall.</p>
  <p>I'll start by defining some terms:</p>
categories: []
layout: post
title: Popping GMail With Outlook Through a Firewall
created: 1178222872
---
<p>Suppose you need to send/receive your GMail using POP3 and Microsoft Outlook. Easy. Suppose you're behind a firewall that permits only HTTP and HTTPS. Harder, but still possible if you have a server that you control that is outside the firewall.</p>
<p>I'll start by defining some terms:</p>
<ul>
<li>Client - the computer where you run Outlook. <br /></li>
<li>Middleman - the server that you control that is outside the firewall.</li>
<li>GMail - (needs no definition).</li></ul>
<p>You'll need ssh and proxytunnel on the client. Install Cygwin and use its ssh. You may have to hunt for proxytunnel. You'll need stunnel on the middleman. The client has to be running an edition of Windows. The middleman can run Windows or Linux or other UNIX variant.</p>
<p>At a high level, you'll use proxytunnel to open a tunnel through the proxy, you'll use ssh to redirect client ports to ports on the middleman, and you'll use stunnel on the middleman to make the SSL connection to GMail. The amazing thing is that it actually works.</p>
<p><strong>On the Client</strong>:</p>
<p>Insert the following lines into ~/.ssh/config:</p><pre>Host middleman.you.com<br />        ProxyCommand proxytunnel -p proxy.example.com:8080 -d middleman.you.com:22</pre>
<p>This tells ssh that whenever you enter "ssh middleman.you.com" it should ask proxytunnel to connect through the HTTPS proxy on port 8080 on proxy.example.com to port 22 on middleman.you.com. This example assumes that you've set up sshd on port 22 on middleman.you.com. If your proxy/firewall won't connect to anything but ports 80 and 443, you may need to run sshd on one of those ports.</p>
<p>In case you're wondering, whenever your web browser connects to a web site using https via a proxy, it says to the proxy "CONNECT www.example.com". The proxy opens a TCP connection to www.example.com, and your web browser then tunnels its traffic through the proxy. The only difference with ssh+proxytunnel is that proxytunnel does the CONNECT and ssh tunnels its traffic through the proxy.</p>
<p>Create a shell script that resembles:</p><pre>ssh -C \<br />   -L 25:middleman.example.com:1025 \<br />   -L 110:middleman.example.com:995 \<br />   -p 22 your-user-id@middleman.example.com<br />stty sane<br />stty erase ^?<br /></pre>
<p>This tells ssh to forward client port 25 to middleman port 1025, and to forward client port 110 to middleman port 995. The "-C" tells ssh to compress the data stream. "-p 22" tells ssh to connect to sshd on port 22 on middleman; you'll need to change this if you've moved sshd to another port.</p>
<p>I added the stty lines after ssh completes, because every once in a while ssh will quit without putting /dev/tty back to normal mode.</p>
<p>Configure Outlook to use SMTP on port 25 on 127.0.0.1 without SSL, and to use POP3 on port 110 on 127.0.0.1 without SSL.</p>
<p>We have to handle the SSL on middleman instead of the client, because GMail's SMTP won't accept <u>SSL</u> from client when the TCP connection comes from <u>middleman</u>. </p>
<p>If you've not already done so, you may want to set up ssh to use public/private keys to connect to middleman without prompting for a password (details not explained in this article.)</p>
<p><strong>On middleman</strong>:</p>
<p>Here's how to set up stunnel on middleman, assuming you're running Red Hat or Centos. If you're running Windows, you'll have to read the stunnel doc.</p>
<p>Create /etc/init.d/ssmtp (or call it stunnel if you prefer) containing:</p><pre> #!/bin/bash<br />. /etc/rc.d/init.d/functions<br />RETVAL=0<br />prog="ssmtp"<br /><br />start()<br />{<br />        echo -n $"Starting $prog: "<br />        /usr/sbin/stunnel &amp;&amp; success || failure<br />        RETVAL=$?<br />        echo<br />}<br /><br />stop()<br />{<br />        echo -n $"Stopping $prog: "<br />        killproc stunnel -TERM<br />        RETVAL=$?<br />        echo<br />}<br /><br />case "$1" in<br />        start)<br />                start<br />                ;;<br />        stop)<br />                stop<br />                ;;<br />        restart)<br />                stop<br />                start<br />                ;;<br />        *)<br />                echo $"Usage: $0 {start|stop|restart}"<br />                RETVAL=1<br />esac<br />exit $RETVAL<br /></pre>
<p>Then, in /etc/rc.d/rc3.d (and also in rc5.d, if your server runs X-windows) enter:</p><pre>ln -s ../init.d/ssmtp S99ssmtp</pre>
<p>Edit (or create) /etc/stunnel/stunnel.conf to contain:</p><pre>socket = l:TCP_NODELAY=1<br />socket = r:TCP_NODELAY=1<br />client = yes<br />foreground = no<br />[ssmtp]<br />accept = 1025<br />connect = smtp.gmail.com:465<br /><br />[spop3]<br />accept = 995<br />connect = pop.gmail.com:995<br /><br /></pre>
<p>This tells stunnel to unwrap SMTP over SSL from smtp.gmail.com on port 465 as plain old SMTP on port 1025 on middleman, and likewise for POP.</p>
<p>Since you don't want to provide SMTP access to the entire planet (it will get you listed as an open relay -- very bad), add the following lines to /etc/hosts.deny:</p><pre>ssmtp: ALL<br />spop3: ALL</pre>
<p>and add the following lines to hosts.allow:</p><pre>ssmtp: localhost middleman.com <br />spop3: localhost middleman.com</pre>
<p>(You might prefer to use middleman's IP address instead of its DNS name.)</p>
<p>Finally, to get stunnel running, enter:</p><pre>sudo service ssmtp start</pre>
<p><strong>Finally</strong>:</p>
<p>To actually send/receive email:</p>
<ol>
<li>Run your ssh-starting shell script <br /></li>
<li>Click Send/Receive in Outlook</li></ol>
<p>Note that if you use Thunderbird, you could do things this way, but I recommend that you set up ssh to create a SOCKS proxy (e.g. "ssh -D 8888") and tell Thunderbird to proxy its traffic via SOCKS.&nbsp; Then you can dispense with stunnel.</p>
<p>&nbsp;</p>
