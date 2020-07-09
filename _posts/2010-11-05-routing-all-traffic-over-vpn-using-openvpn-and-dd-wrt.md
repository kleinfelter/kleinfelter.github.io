---
excerpt: "<p>I wanted to set up OpenVPN, to protect myself from Firesheep when web
  browsing from the local free WiFi.&nbsp; It is <em>almost</em> easy, but there are
  a few non-obvious points.&nbsp; I won't cover setting up the keys and certificates,
  because that is well documented elsewhere and it works as documented.&nbsp; This
  is for DD-WRT v24-sp2 (08/12/10) mega.</p>"
categories: []
layout: post
title: Routing All Traffic Over VPN Using OpenVPN and DD-WRT
created: 1289007438
---
<p>I wanted to set up OpenVPN, to protect myself from Firesheep when web browsing from the local free WiFi.&nbsp; It is <em>almost</em> easy, but there are a few non-obvious points.&nbsp; I won't cover setting up the keys and certificates, because that is well documented elsewhere and it works as documented.&nbsp; This is for DD-WRT v24-sp2 (08/12/10) mega.</p>
  <p>In my case, I have two routers:&nbsp;A wired router&nbsp;connected to the Internet, and a wireless router, which is connected to the wired router via Ethernet.&nbsp; I'm going to get VPN working on the wireless router, and then I'll turn down the wired router and replace it with the wireless router.&nbsp; I recommend this route.&nbsp; You really want to work out your VPN from inside your LAN before you put it outside your LAN.</p>
  <ul>
    <li>Turn off the firewall on your router.&nbsp; </li>
    <ul>
      <li>There's a checkbox on the DD-WRT Security-&gt;Firewall screen.&nbsp; </li>
      <li>This is to simplify, and allow you to focus strictly on one source of errors at a time.</li>
    </ul>
    <li>On the DD-WRT Services-&gt;VPN screen:</li>
    <ul>
      <li>Paste the content of your certificate authority certificate (<strong>ca.crt</strong>) into the &quot;<strong>CA Cert</strong>&quot; field.</li>
      <li>Leave Certificate Revoke List empty.</li>
      <li>Paste the content of&nbsp;your server certificate&nbsp;(<strong>server.crt</strong>)&nbsp;into the &quot;<strong>Public Client Cert</strong>&quot; field.</li>
      <ul>
        <li>This is poorly named.&nbsp; It should be&nbsp;named &quot;Server Cert.&quot;</li>
      </ul>
      <li>Paste the content of your server key (<strong>server.key</strong>) into the &quot;<strong>Private Client Key</strong>&quot; field</li>
      <ul>
        <li>This is poorly named.&nbsp; It should be&nbsp;named &quot;Server Key.&quot;</li>
      </ul>
      <li>Paste the content of your &quot;Diffie-Hellman PEM&quot; (<strong>dh1024.pem</strong>) into the &quot;<strong>DH PEM</strong>&quot; field.</li>
      <ul>
        <li>If you care, PEM stands for &quot;Privacy Enhanced Mail&quot; format.</li>
      </ul>
      <li>Paste the following into the &quot;<strong>Open VPN Config</strong>&quot; field.</li>
    </ul>
  </ul>
  <pre>server 192.168.8.0 255.255.255.0
dev tun0
proto udp
port 1194
keepalive 15 60
daemon
verb 3
comp-lzo
client-to-client
duplicate-cn  
tls-server
dh /tmp/openvpn/dh.pem
ca /tmp/openvpn/ca.crt
cert /tmp/openvpn/cert.pem
key /tmp/openvpn/key.pem</pre>
  <ul>
    <li>Note that this will create a VPN where the network addresses are on the 192.168.8.* subnet. You might decide to change this, later. My advice is to use my values exactly, and later come back and tinker with it once you've got it working. </li>
  </ul>
  <p>You can press the &quot;Apply&quot; button once you've filled in all of the fields mentioned above.</p>
  <p></p><hr />
  <p></p>
  <p>The client config file is below.&nbsp; Again, just use my values for now.&nbsp; Come back and tinker later.&nbsp; The one thing you'll need to change is &quot;192.168.9.1&quot;.&nbsp; Change that to the IP address of your router.&nbsp; I recommend using the LAN IP address of your router.&nbsp; Eventually, you'll want to come back and make this work via the WAN IP address, but let's stay <em>inside</em>&nbsp;until we get things working.:</p>
  <pre># Be the client, not the server
client

# Use any TUN (not TAP) device on the client.
dev tun

# The address of the VPN server.  1194 is the default port for OpenVPN.
remote 192.168.9.1

# Send ALL traffic via the VPN (except the link-level frames that your VPN tunnels inside)
redirect-gateway def1

# We don't care what interface or port we use on the client.
nobind

# These are described as 'Make the link resistant to connection failures, dealing with keeping
# connection alive through NAT and following the DNS name of the server if its IP address changes.'
keepalive 10 60
ping-timer-rem
persist-key
persist-tun

# Enable data link compression.
comp-lzo

# You can set this to a higher level, and you'll get lots of detail information.  It won't help.
verb 1

# --float tells OpenVPN to accept authenticated packets from any address, not only the address which was specified in the --remote option.
# Useful if you're using round-robin DNS.  Also useful if your server has a dynamic IP address which the ISP could change.
# I use float so I can connect from inside AND outside my router.
float

# Connect only to servers with the right certificate.
ns-cert-type server

# Certificate Authority certificate file used to "certify" other certificates.  Same CA file must be used on the client and the server.
ca ca.crt

# The client's certificate file.  Should be different on each client.  Public Client Cert.
cert client1.crt

# The client's private key.
key client1.key</pre>
  <ul>
    <li>Copy the Certificat Authority certificate to ca.crt, in your VPN client's config directory</li>
    <li>Copy the client's certificat and private key to client1.crt and client1.key (respectively), in your VPN client's config directory.</li>
  </ul><hr />
  <p>Next, let's test and confirm that it really works.</p>
  <ul>
    <li>Tell your client to connect to the server.&nbsp; It should take about 10-15 seconds.&nbsp; Different client's tell you about their success in different ways.&nbsp; If you don't get a connection, look at the following:</li>
    <ul>
      <li>Make sure you've got your keys and certificates in the right folders.</li>
      <li>You might need to change &quot;remote 192.168.9.1&quot; or &quot;server 192.168.8.0 255.255.255.0&quot; in my config to match your network.</li>
      <li>If all else fails, reboot your router and your client, and try again.&nbsp; (Windows XP appears to need a reboot after installing OpenVPN.)</li>
    </ul>
    <li>Assuming that you're connected, here are some things to test:</li>
    <ul>
      <li>ping 192.168.8.1</li>
      <ul>
        <li>This confirms that you can reach the server's VPN endpoint.&nbsp; (Substitute your server endpoint, if you didn't use the 192.168.8.* subnet.)</li>
      </ul>
      <li>ping 192.168.9.1</li>
      <ul>
        <li>This confirms that you can reach your real, physical router's LAN IP.&nbsp; (Substitute your router's LAN IP, if it is different.)</li>
      </ul>
      <li>ping your-upstream-router-IP-here</li>
      <ul>
        <li>This is the address of the router that is upstream from your router running DD-WRT and the VPN.&nbsp; On my network, it is the wired-router-to-the-internet.&nbsp; If your DD-WRT is directly connected to the internet, this is the gateway at your ISP.</li>
        <li>This confirms that you can send traffic past the VPN's router.</li>
      </ul>
      <li>ping mindspring.com</li>
      <ul>
        <li>This confirms that DNS is working.</li>
        <li>There is nothing magic about mindspring.com.&nbsp; It is just the first ISP I ever used, so my fingers are &quot;hard-wired&quot; to ping them.&nbsp;&nbsp;I've been pinging them since the days of Windows 3 and Trumpet Winsock for TCP/IP.</li>
      </ul>
      <li>tracert your-upstream-router-IP</li>
      <ul>
        <li>or &quot;traceroute your-upstream-router-IP&quot;, depending on your operating system.</li>
        <li>You're looking to confirm that the first step in the route is via the VPN (e.g. 192.168.8.1).&nbsp; This shows that all traffic will go via your VPN.</li>
      </ul>
      <li>Note: For the longest time, I found that using &quot;redirect-gateway def1&quot; made everything stop working.&nbsp; </li>
      <ul>
        <li>If I left it out, I could establish the VPN, but traffic didn't default to using the VPN.&nbsp; </li>
        <li>If I put it in, ALL traffic failed.&nbsp; </li>
        <li>I Googled for hours, and found many people with a similar problem, and lots of people trying to be helpful but not actually helping.</li>
        <li>Disabling the firewall on my router 'solved' the problem.&nbsp; This is why I recommend disabling the firewall.&nbsp; It just makes one less thing to debug.&nbsp; You WILL want to re-enable it before you connect it to the outside world.</li>
      </ul>
    </ul>
  </ul>
  <p></p><hr />
  <p></p>
  <p>Some suggested tweaks, once everything above is working:</p>
  <ul>
    <li>Re-enabling your firewall:</li>
    <ul>
      <li>Go to DD-WRT Security-&gt;Firewall, and re-enable the firewall.</li>
      <li>Go to DD-WRT Administration-&gt;Commands, and past the following:</li>
    </ul>
  </ul>
  <pre>iptables -I INPUT 1 -p udp --dport 1194 -j ACCEPT
iptables -I FORWARD 1 --source 192.168.8.0/24 -j ACCEPT</pre>
  <ul>
    <li>If you didn't follow my advice to use my config exactly, you'll have to substitute your VPN's subnet for 192.168.8.0.</li>
    <li>Press the &quot;Save Firewall&quot; button.</li>
    <li>Go back to &quot;here are some things to test&quot; above, and connect and confirm that your VPN still works, now that you've enabled the firewall.&nbsp; (You're still <em>inside</em> your router.&nbsp; Remember -- deal with one source of trouble at a time.)</li>
    <li>Now it is time to make this work from <em>outside</em> the router.</li>
    <ul>
      <li>Edit your VPN client's config file and change &quot;remote 192.168.9.1&quot; to &quot;remote <em>your_external_ip_address</em> 1194&quot;</li>
      <li>Re-establish your VPN connection.</li>
      <li>Go back to &quot;here are some things to test&quot; above, and connect and confirm that your VPN still works, now that you're using the external IP.</li>
    </ul>
    <li>You might want to set up ad-blocking on your router.&nbsp; I used a simplified (customized) edition of the script from <a href="http://hotfortech.wikispaces.com" title="Pixelserv on DD-WRT">http://hotfortech.wikispaces.com</a> (Basically, I removed the automatic updates of nvram.)</li>
    <ul>
      <li>scp the modified disable_ads.sh to root@router:/jffs/etc/config/disable_ads.startup</li>
      <ul>
        <li>DD-WRT runs everything ending with &quot;.startup in /jffs/etc/config at start-up.</li>
        <li>See <a href="http://www.dd-wrt.com/wiki/index.php/Script_Execution">http://www.dd-wrt.com/wiki/index.php/Script_Execution</a>&nbsp; and <a href="http://www.dd-wrt.com/wiki/index.php/Startup_Scripts">http://www.dd-wrt.com/wiki/index.php/Startup_Scripts</a>&nbsp; for more info on start-up scripts
          <br /></li>
      </ul>
      <li>scp pixelserv to root@router:/jffs/dns/pixelserv</li>
      <li>ssh to the router, and run /jffs/etc/config/disable_ads.sh.&nbsp; You want to ensure that this runs error-free before you reboot your router, or you could end up with a brick.</li>
      <li>Add these lines to &quot;Additional DNSMasq Options&quot; on DD-WRT Services-&gt;Services:</li>
      <ul>
        <li>conf-file=/jffs/dns/dnsmasq.adblock.conf</li>
        <li>addn-hosts=/jffs/dns/dlhosts
          
          
          <br /></li>
      </ul>
    </ul>
    <li>MORE TO FOLLOW</li>
  </ul>
