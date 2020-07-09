---
excerpt: "<p>If you create a virtual disk, using Vmware's vmware-vdiskmanager, SOMETIMES
  after you use the disk in a VirtualBox VM, vmware-vdiskmanager will refuse to mount
  the disk. VirtualBox (version 1.6.2) adds entries to the disk header file that &quot;VMware
  DiskMount Utility version 5.5.0 b­uild-18463&quot; is not prepared to accept. </p>"
categories: []
layout: post
title: VirtualBox Makes VMDK Not Mountable by vmware-vdiskmanager
created: 1214874140
---
<p>If you create a virtual disk, using Vmware's vmware-vdiskmanager, SOMETIMES after you use the disk in a VirtualBox VM, vmware-vdiskmanager will refuse to mount the disk. VirtualBox (version 1.6.2) adds entries to the disk header file that &quot;VMware DiskMount Utility version 5.5.0 b­uild-18463&quot; is not prepared to accept. </p>
To cure the problem, delete the added entries. For example, if you create a virtual disk using the command:

  
  <pre>vmware-vdiskmanager -c -s 1Gb -a ide -t 2 test1gb.vmdk
</pre>
  <p>it will create two files: test1gb.vmdk and test1gb-flat.vmdk.  The test1gb.vmdk file is just a descriptor for test1gb-flat.vmdk.  The contents of test1gb.vmdk resemble the following:</p>
  <pre># Disk DescriptorFile
version=1
CID=9b84b314
parentCID=ffffffff
createType="monolithicFlat"

# Extent description
RW 2097152 FLAT "test1gb-flat.vmdk" 0

# The Disk Data Base 
#DDB

ddb.virtualHWVersion = "6"
ddb.geometry.cylinders = "2080"
ddb.geometry.heads = "16"
ddb.geometry.sectors = "63"
ddb.adapterType = "ide"</pre>
  <p>After you access the vmdk using VirtualBox, it can look something like this:</p>
  <pre># Disk DescriptorFile
version=1
CID=dcfc4939
parentCID=ffffffff
createType="monolithicFlat"

# Extent description
RW 2097152 FLAT "cygwin-flat.vmdk" 0

# The Disk Data Base 
#DDB

ddb.virtualHWVersion = "6"
ddb.geometry.cylinders = "2080"
ddb.geometry.heads = "16"
ddb.geometry.sectors = "63"
ddb.adapterType = "ide"
ddb.uuid.image = "acb5e55e-497f-4622-a9c2-693d7a2f3d70"
ddb.uuid.modification = "ea0c778f-abb5-48d4-b19f-23d86da70c5b"
ddb.uuid.parent = "00000000-0000-0000-0000-000000000000"
ddb.uuid.parentmodification = "8e4bc96d-1c02-43b7-9eeb-51eaa692fc63"
ddb.geometry.biosCylinders="520"
ddb.geometry.biosHeads="64"
ddb.geometry.biosSectors="63"</pre>
  <p>To return the vmdk to being usable by vmware-mount, simply delete the 3 lines that begin with &quot;ddb.geometry.bios&quot;.  Of course, you have to do this every time you want to use vmware-mount (if the disk has been used by VirtualBox since the last mount).</p>­
