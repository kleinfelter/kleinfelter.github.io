---
excerpt: "<p>I like to use a VM with its NIC bridged to a real NIC.&nbsp; Sometimes
  I work at a client site where there's a Windows domain policy that blocks this.&nbsp;
  Here's the work-around:</p>"
categories: []
layout: post
title: Allow Network Bridge in Windows Despite Domain Policy
created: 1221096678
---
<p>I like to use a VM with its NIC bridged to a real NIC.&nbsp; Sometimes I work at a client site where there's a Windows domain policy that blocks this.&nbsp; Here's the work-around:</p>
  <ol>
    <li>Disconnect from the network.</li>
    <li>Regedit</li>
    <ol>
      <li>Search for NC_AllowNetBridge_NLA</li>
      <li>Set each instance of NC_AllowNetBridge_NLA = 1</li>
    </ol>
    <li>If Network Connections is open, close it.</li>
    <li>Open Network Connections</li>
    <ol>
      <li>Select the two connections to bridge, and click Advanced/Bridge-Connections</li>
    </ol>
  </ol>
  <p>If there is a domain policy in effect, a few minutes after you reconnect to&nbsp; the domain, your policy change will be un-done.&nbsp; However, the policy only prevents the CREATION of new bridges -- it does not disable bridges that are in existence.</p>
