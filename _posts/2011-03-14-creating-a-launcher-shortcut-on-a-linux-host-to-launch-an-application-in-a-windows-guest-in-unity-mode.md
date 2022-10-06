---
excerpt: "<p>This is easy, but obscure.&nbsp; You want to run:</p>\r\n  <ul>\r\n    <li>vmware-unity-helper
  -r <em>path-to-vmx-file</em>&nbsp;&nbsp;<em>path-to-exe-file</em></li>\r\n  </ul>\r\n
  \ <p><em>path-to-vmx-file</em> is the full path name in the&nbsp;host file system
  of your VMX file for the VM you want to use.</p>"
categories: []
layout: post
title: Creating a Launcher/Shortcut on a Linux Host to Launch an Application in a
  Windows Guest In Unity Mode
created: 1300146480
---
<p>This is easy, but obscure.&nbsp; You want to run:</p>
  <ul>
    <li>vmware-unity-helper -r <em>path-to-vmx-file</em>&nbsp;&nbsp;<em>path-to-exe-file</em></li>
  </ul>
  <p><em>path-to-vmx-file</em> is the full path name in the&nbsp;host file system of your VMX file for the VM you want to use.</p>
  <p><em>path-to-exe-file</em> is the full path name in the guest file system of the executable file you want to run. This can be given in ordinary Windows file name format, or in&nbsp;file:// URI format.&nbsp; (I didn't have much luck with URIs containing spaces, regardless of how I encoded the spaces.)</p>
  <p>&nbsp;</p>
  <p>Some examples:</p>
  <ol>
    <li>Run notepad.exe in the VM whose VMX file is /home/me/VMs/vm1/vm1.vmx:</li>
    <ul>
      <li>vmware-unity-helper -r /home/me/VMs/vm1/vm1.vmx 'C:\\windows\\notepad.exe'</li>
      <li>vmware-unity-helper -r /home/me/VMs/vm1/vm1.vmx 'file:///c:/WindOWs/NoTePad.exe'</li>
    </ul>
    <li>Run itunes.exe in the VM whose VMX file is in /home/me/VMs/vm2/vm2.vmx:</li>
    <ul>
      <li>/usr/bin/vmware-unity-helper -r /home/me/VMs/vm2/vm2.vmx 'file:///c:/progra~1/itunes/itunes.exe'</li>
      <li>vmware-unity-helper -r /home/VMs/vm2/vm2.vmx 'C:\\Program Files\\iTunes\\itunes.exe'</li>
    </ul>
  </ol>
  <p>Don't forget to double your backslashes in Windows paths.</p>
  <p>Windows paths are not case-sensitive.</p>
  <p>Try out the command in a Terminal session, before you commit it to a Launcher.</p>
