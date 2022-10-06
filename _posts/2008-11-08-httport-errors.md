---
excerpt: "HTTPort is a useful tool for http tunneling of http, but the documentation
  is incomplete.&nbsp; Here are a few errors and solutions I've encountered.\r\n  \r\n
  \ <br />\r\n  <br />\r\n  <h2><strong>httport errors:</strong></h2>\r\n  "
categories: []
layout: post
title: HTTPort Errors
created: 1226186902
---
HTTPort is a useful tool for http tunneling of http, but the documentation is incomplete.&nbsp; Here are a few errors and solutions I've encountered.
  
  <br />
  <br />
  <h2><strong>httport errors:</strong></h2>
  <br />
  <ul>
    <li><strong>SOCKS4[x.x.x.x:80]: 0002 Access denied</strong></li>
    <ul>
      <li>Means that &quot;httport/Proxy/Use personal remote host at/Password&quot; != &quot;htthost/options/personal password&quot;</li>
    </ul>
    <li><strong>SOCKS4[x.x.x.x:80]: 0103 Invalid connection id</strong></li>
    <ul>
      <li>&quot;Proxy/HTTP Proxy to bypass/Host name or IP address&quot; doesn't point to the proxy to bypass</li>
    </ul>
    <li><strong>HTTPx: WinInet HTTPSendRequest failed (12029) (request xyz, attempt n/m)</strong></li>
    <ul>
      <li>&quot;Proxy/HTTP Proxy to bypass/Host name or IP address&quot; doesn't point to the proxy to bypass</li>
    </ul>
    <li><strong>SOCKS4[x.x.x.x:80]: 0103 Invalid connection id</strong></li>
    <ul>
      <li>Means that &quot;httport/Proxy/Use personal remote host at/Host name or IP address&quot; != the external IP address of your htthost server
        
        <br /></li>
    </ul>
  </ul>
  <br />
  <h2>htthost errors:</h2>
  <ul>
    <li><strong>LISTENER: bind() to 0.0.0.0:8080 failed, closing socket</strong></li>
    <ul>
      <li>Means that some other process is listening on port 8080.&nbsp; One cause of this could be that you're running htthostc (console mode) and htthost.&nbsp; This happened to me after I set up to run htthostc as a service, but forgot to take htthost out of the Startup folder.
        
        <br /></li>
    </ul>
  </ul>
  <br />
