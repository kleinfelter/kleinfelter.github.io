---
excerpt: |-
  <h4>SVS www.altiris.com</h4>
  <ol>
  <li>Some zero-install apps at http://www.svsdownloads.com/</li>
  <li>Can install an app on one machine and run it on another. If the app requires activation based on your hardware, you'll have to activate it on multiple machines.</li></ol>
  <h4>VMWare (and other VMs)</h4>
  <ol>
  <li>Can run apps installed to an image.</li>
  <li>Slow, and really needs more than 1GB RAM and faster than a 1.8GHz mobile Pentium on the PC. Ubuntu is slow, Kubuntu is slow. I still want to try XUbuntu and running Ubuntu non-GUI with a Cygwin X-server.</li>
categories: []
layout: post
title: SVS, VMWare, and Portable Apps
created: 1178222776
---
<h4>SVS www.altiris.com</h4>
<ol>
<li>Some zero-install apps at http://www.svsdownloads.com/</li>
<li>Can install an app on one machine and run it on another. If the app requires activation based on your hardware, you'll have to activate it on multiple machines.</li></ol>
<h4>VMWare (and other VMs)</h4>
<ol>
<li>Can run apps installed to an image.</li>
<li>Slow, and really needs more than 1GB RAM and faster than a 1.8GHz mobile Pentium on the PC. Ubuntu is slow, Kubuntu is slow. I still want to try XUbuntu and running Ubuntu non-GUI with a Cygwin X-server.</li>
<li>Sometimes you have to re-activate -- if you have an app that requires activation on hardware changes, and you run it on a major-different processor</li></ol>
<h4>Portable Apps</h4>
<ol>
<li>Limited selection of apps</li>
<li>Run on any PC from your USB drive</li></ol>
<h4>CoLinux</h4>
<p>CoLinux seems to run pretty well, but I can't use it at work. They've used a Group Policy to block ICS NAT, and since Windows XP sends STP (layer 2 routing protocol) packets it could get my network port shut down. Then I'd have to explain why. Also worth noting, X-windows won't run on CoLinux, so you have to run your X-server in Cygwin.</p>
<p>Update: I got the latest snapshot of CoLinux and configured a network proxy virtual NIC. It works pretty well.</p>
