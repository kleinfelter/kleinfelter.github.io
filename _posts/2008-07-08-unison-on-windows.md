---
excerpt: "<p>Running the Windows edition of Unison has a problem.&nbsp; Synchronizing
  small sets of files works nicely.&nbsp; Synchronizing large file sets (hundreds
  of thousands of files and about 30 GB) will just stop sometimes.&nbsp; The client
  says that it is waiting for updates from the server.&nbsp; The server side isn't
  doing any I/O or burning any CPU (per task manager).&nbsp; It just sits.</p>"
categories: []
layout: post
title: Unison on Windows
created: 1215557544
---
<p>Running the Windows edition of Unison has a problem.&nbsp; Synchronizing small sets of files works nicely.&nbsp; Synchronizing large file sets (hundreds of thousands of files and about 30 GB) will just stop sometimes.&nbsp; The client says that it is waiting for updates from the server.&nbsp; The server side isn't doing any I/O or burning any CPU (per task manager).&nbsp; It just sits.</p>
  <p>This happens more frequently with &quot;unison -socket 9999&quot; than via ssh, but it happens both ways.&nbsp; It happens with older releases and it happens with 2.28.34.&nbsp; I've only tested with the text mode executable, not the GUI.</p>
  <p>So I thought I'd give the Cygwin edition a try.&nbsp; Note that I want to use it to synchronize the Windows file system, and I'm not particularly concerned with the Cygwin file system (which is just there to hold the Cygwin Unison executable and configuration files).</p>
  <ol>
    <li>Install Cygwin via <a href="http://www.cygwin.com/setup.exe">http://www.cygwin.com/setup.exe</a>
      <ol>
        <li>Be sure to select the newest Unison, OpenSSH, and&nbsp; cygrunsrv&nbsp;packages. </li>
      </ol>
    </li>
    <li>On your Cygwin server, open a Cygwin bash prompt. It will create your /etc/passwd file. 
      <ol>
        <li>ssh-host-config -y </li>
        <li>When it asks, CYGWIN=tty ntsec </li>
        <li>cygrunsrv -S sshd </li>
      </ol>
    </li>
    <li>On your Cygwin client, open a bash prompt: 
      <ol>
        <li>ssh <a href="mailto:yourId@yourServer">yourId@yourServer</a></li>
        <li>Work out any problems with ssh before proceeding.&nbsp; I recommend setting up password-free ssh: 
          <ol>
            <li>ssh-keygen -t rsa (Note: Only do this if you don't have ssh without password connecting from this client to ANYWHERE.) </li>
            <li>Copy your id_rsa.pub (or your identity.pub, or whatever you've named your public key) to the server as ~/.ssh/authorized_keys2 </li>
            <li>On the server: 
              <ol>
                <li>chmod 600 .ssh </li>
                <li>chmod 600 .ssh/authorized_keys2 </li>
              </ol>
            </li>
            <li>On the client, run &quot;ssh yourId@yourServer&quot; and it should login without a password. </li>
          </ol>
        </li>
      </ol>
    </li>
    <li>On your client, from a shell prompt, run &quot;unison /tmp ssh://yourServer/tmp -testserver&quot;.&nbsp; This is effectively a unison-ping.&nbsp; If it doesn't succeed, solve the problem before proceeding.</li>
  </ol>
