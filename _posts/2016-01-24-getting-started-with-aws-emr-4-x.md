---
categories: []
layout: post
title: Getting Started With AWS EMR 4.x
created: 1453641460
redirect_from: /content/getting-started-aws-emr-4x
---
There have been some significant changes in Amazon Web Services (AWS) Elastic MapReduce (EMR) with the 4.x release.  The Amazon doc hasn't been rewritten for 4.x - just a summary of changes, making it tough to follow tutorials.  Here are some tips for getting started with AWS EMR.  I assume you are using Linux or a Mac.  Windows users will have to make some minor adjustments, but the basic ideas apply.

##Sign-up for AWS
* Visit [http://aws.amazon.com/](http://aws.amazon.com/)
* If you are a customer of Amazon's web store, I recommend setting up a *separate* account for AWS.  (See next bullet.)
* You will need to provide a credit card, even if you are using the 'free' edition.  AWS might charge you more than you expect.  You might want to put a limit on charges, and AWS does not provide this capability.
    * Some credit cards allow you to create a single-use card number with a billing limit and a specified expiration date.  For example, Bank of America calls this "ShopSafe."  Citibank calls its "Virtual Account Numbers."  Use this to set a cap on how much AWS can charge you.
* I think you care about rates even when using 'AWS Free.'  The more hardware you use, the quicker you come to the end of your free period.

##Check Your Bill
* [https://console.aws.amazon.com/billing/home](https://console.aws.amazon.com/billing/home)

##Create an SSH Key Pair
* You will need an SSH key pair in order to open a command-line prompt on your cluster.
* Choose a data center.
    * In the upper-right corner, you'll see your name.  To the right of it you'll see a location name.  This identifies the data center you will be using.
    * Click on the data center name and pick the one you want to use.  
        * You might have to change data centers, even if you prefer not to.  I found that some things worked in Oregon that didn't work in Virginia.  You may find the reverse.  It depends on demand, upgrades in progress, etc.
        * Stick with one data center to the extent possible.  Moving around complicates things.
* Go to the [EC2 Console](https://console.aws.amazon.com/ec2/) and click the *Create Key Pair* link in the left-side panel of links.  
    * If you already have a key pair, the link will be *Key Pairs*
* Follow the wizard.  Save the .pem file in your *home* directory on your laptop/desktop (or store it elsewhere and create a link to it in your home directory).

##Install the AWS Command-line Interface
* See [http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-bundle-other-os](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-bundle-other-os)
* Run "aws help" after installing, to confirm it is installed.
* Visit [https://us-west-2.console.aws.amazon.com/console/home](https://us-west-2.console.aws.amazon.com/console/home). 
    * Click *Identify and Access Management*. 
    * Click *Users*
    * Create a user (and generate an access key and download it).
* Run "aws configure" and answer the questions.
    * You get some answers from *Identity and Access Management".
    * If you need the region name, you can visit the EC2 Console and copy it from the end of the URL.
    * Default output format should be json.
* You won't be able to do much unless you adjust security policies.  The user you entered in response to a prompt from "aws configure" doesn't have permission to do anything.  You'll have to grant permission or you'll get AccessDenied errors.  See *Grant Permission to a User* elsewhere on this page.

##Grant Permission to a User
* There are many policies/permissions.  I'll document one (or a few) here.
* **Permit access to S3**
    * Visit [Identity and Access Management](https://console.aws.amazon.com/iam/home)
    * Click the *Policies* link
    * Select *Amazon S3 Full Access*
    * Push the *Attach* button
    * Attach the user you created/entered for aws
* **Grant Administrator access**
    * I dunno which policies are actually necessary for which aws command.  The easy thing to do for a learning project is to grant yourself access to everything.
    * Visit [Identity and Access Management](https://console.aws.amazon.com/iam/home)
    * Click the *Policies* link
    * Select *AdministratorAccess*
    * Push the *Attach* button
    * Attach the user you created/entered for aws

##Create and Start an AWS Cluster for EMR
* Be sure to Create an SSH Key Pair first.  (See elsewhere on this page.)
* Login to the [EMR Cluster Console](https://console.aws.amazon.com/elasticmapreduce/home)
* Press the "Create Cluster" button to begin the cluster creation wizard.
    * Note: If you have no clusters yet, EMR will present a special, "You don't have any clusters.  Create one now," screen with slightly different content.  That's OK.  Click its cluster-creation button.
    * Stay out of the *Advanced Options*
* Populate the following fields.  (Any field not mentioned should be left at its default.)
    * Name = any_name_you_like_1
    * Logging = enabled.
    * S3 Cluster = (don't change it)
    * Launch Mode = Cluster
    * Vendor = Amazon
    * Release = emr-4.2.0
    * Applications = All Applications
        * You could get by with just Core Hadoop, but some of the added apps for 'All' are helpful to monitor your cluster.
    * Instance Type = m1.medium
        * This defines the virtual hardware for each node of your cluster.  (CPU speed and RAM.)
        * Pick the smallest "General Purpose (Previous Generation)" you can find, in order to minimize cost while learning.  The bigger your cluster, the higher the hourly rate.
        * The [pricing page](https://aws.amazon.com/elasticmapreduce/pricing/) lists smaller sizes, but none were available via the wizard.
        * You may find that you choose a cluster size and, when AWS actually creates the cluster, you get a message that clusters of that size are not available in your chosen data center.  Pick a different size or a different data center and try again.  I found that I could get a medium cluster at some hours but not at others, and in some data centers, but not in others.
    * Number of Instances: 1
        * Start with a cluster size of one node, to minimize expense.  Grow to more nodes when you're familiar with the platform and when you need more processing power.
    * EC2 Key Pair = (use the name of the key pair you created per instructions elsewhere on this page)
    * Permissions = Default
    * Press *Create Cluster*.
    * Starting a single node cluster:
        * It will say "Starting Provisioning Amazon EC2 capacity" for about 5 minutes.
        * You'll see Provisioning for about 5 minutes, then "Running".
        * Once "Master: Provisioning 1 m1.medium" turns from "Provisioning" to "Bootstrapping" or "Running", you start getting billed.
    * Starting a 10 node cluster took 16 minutes on a Sunday afternoon.
    * If you lose this BROWSER TAB:
        * Open your [EMR Cluster List](https://us-west-2.console.aws.amazon.com/elasticmapreduce/home)
        * Click on the cluster name
    * This will create a cluster which permits you to run small Hadoop jobs, run a Pig command line, run all sorts of Linux commands, etc.
    * If you would like to be able to re-create this cluster from your laptop/desktop command line, 
        * Visit the Cluster Details for your cluster and click the *AWS CLI Export* button to get the command line.  You can paste it into a bash script.
        * Before you run the bash script for the first time, run:
            * aws emr create-default-roles
        * When you start the cluster from the command line, it will print the cluster ID.
        * It will not show up in your EMR Cluster List web page until the Provisioning step completes (about 5 minutes).  In the meantime, track it with:
            * aws emr list-clusters
        * This might be helpful (if you substitute your cluster ID for j-26AKLJTZ614D): 
            * https://us-west-2.console.aws.amazon.com/elasticmapreduce/home?region=us-west-2#cluster-details:j-26AKLJTZ614D

##Terminating a Cluster
* You get billed for every minute your cluster is running.  You'll want to shut it down when you aren't using it.  
    * Note that you can't really shut down a cluster -- you destroy it.  (See *Recreating a Cluster*, elsewhere on this page.)
    * Metadata about the cluster will remain, so you'll see it in your list of clusters, but the cluster itself gets deleted.
* Open your [EMR Cluster List](https://us-west-2.console.aws.amazon.com/elasticmapreduce/home)
* Select the desired cluster.
* Press the *Terminate* button.

##Recreating a Cluster
* After you Terminate a cluster, you might want to recreate it.
* Open your [EMR Cluster List](https://us-west-2.console.aws.amazon.com/elasticmapreduce/home)
* Select the desired cluster.
* Press the *Clone* button.
* It will ask whether you want to include Steps.  If you're following my instructions, this choice is inconsequential.
    * Press the *Clone* button (again).

##Open a SSH Command-line Prompt On a Running EMR Cluster
* You need a running cluster in order to do this!
* When AWS creates a cluster, they choose secure defaults.  You need to enable TCP/IP connections to your cluster before you can use SSH.
    * Open a NEW BROWSER tab to the [EC2 Console](https://console.aws.amazon.com/ec2/) and select Security Groups from the left-side list of links.
    * Select the ElasticMapReduce-master group
    * Select the Inbound tab and press Edit
    * Change an All TCP rule for all ports to Source = Anywhere.
        * This is insecure.  For a production setup, you'll want to add a rule to permit TCP connections from your laptop/desktop (or your company/workgroup) and not the whole world.
* Open your [EMR Cluster List](https://us-west-2.console.aws.amazon.com/elasticmapreduce/home)
* Click the name of the cluster.
* There will be an *SSH* link on the page (to the right of the *Master Public DNS Name* heading).  Click it.
* This will provide a command line which you should copy and then paste into your Terminal window to run SSH and connect to your cluster.
    * I recommend adding "-D 1080" to the command line.  (See the section of this page on using a SOCKS proxy.)

##Create a Bucket
* A bucket is a directory into which you can store files using the Amazon S3 storage service.
* One method is to use the S3 Console
    * Visit the [S3 Console](https://console.aws.amazon.com/s3).
    * Click *Create Bucket*
    * Give it a name which nobody on the planet has used.  (Bucket names are global to all S3 users.)  Names can contain alphanumeric and periods.  Maybe use com.yourdomain.bucket1.
        * You want a name which can be stuck on the front of ".s3.amazonaws.com" to create a valid DNS name.
* Or use aws command line:
    * aws s3 mb s3://bucket-name

##Delete a Bucket and All Its Contents
* You can do this via the [S3 Console](https://console.aws.amazon.com/s3).  If you have a million files, it will be very slow because you must delete each file before you can delete the bucket via the console.
* Easy way, using aws cli (deletes the bucket and all files in it):
    * aws s3 rb s3://bucket-name --force

##List All of Your Buckets
* aws s3 ls

##Copy a File From Your Laptop/Desktop to S3 Using the Console
* Visit the [S3 Console](https://console.aws.amazon.com/s3)
* Select the desired bucket.  (See *Create a Bucket* elsewhere on this page if you do not have a bucket.)
* Press the Upload button and follow the wizard.

##Copy a Folder/Directory From Your Laptop/Desktop to S3 Using the Command Line
* aws s3 cp MyLocalFolder s3://bucket-name -- recursive 
    * To the default region.
* aws s3 cp MyLocalFolder s3://bucket-name -- recursive --region us-west-2
    * To the specified region.

##Copy a File From Cluster/Laptop/Desktop to S3
* aws s3 cp myFile s3://mybucket
* aws s3 cp myFile s3://mybucket/myfolder

##Move a Bucket to a Different Region
* aws s3 sync s3://oldbucket s3://newbucket --source-region us-west-1 --region us-west-2

##Create a Folder on DFS to Store Data That Won't Fit on the Cluster Server
* hadoop dfs -mkdir /user/hadoop
    * I assume that you can use any name, and not just hadoop.
* You can check the content of this folder via: "hadoop dfs -ls /user/hadoop"

##Save a File to S3 Before You Terminate a Cluster
* When you Terminate a cluster, all files on the cluster are lost.  You might have a file you want to save.  Note that you get billed for Amazon storage space for saved files, but not as much as for a running cluster.  If it is a small file, you might want to copy it to your laptop/desktop (see instructions elsewhere on this page).  If it as a large file, you might want to store it on Amazon S3, to avoid consuming the time/bandwidth to download the file.
    * [Amazon S3 Pricing](http://aws.amazon.com/s3/pricing/)
    * You need to use a 'Bucket'.  See *Create a Bucket* elsewhere on this page if you do not have a bucket.
    * See one of the related "Copy..." sections on this page to copy the file/folder to or from S3.

##Set Up a SOCKS Proxy
* You need to connect your browser to several different web servers running on your cluster, in order to manage/monitor your cluster.  Unfortunately, AWS sets up these servers such that they only accept connections from localhost (the cluster server -- not your laptop/desktop).  You either need to tunnel your browser traffic via SSH or via a SOCKS proxy.  If you know all of the ports for all of the servers, you can specify ports on the SSH command line.  I don't know all of them, so I'm setting up to use SOCKS, so I can proxy all traffic destined for my cluster via SOCKS, regardless of which port.
* Create a file named ~/etc/proxy.pac containing:

<pre><code>
function FindProxyForURL(url, host) {
   if (shExpMatch(host, "*.compute.amazonaws.com"))
        return "SOCKS localhost:1080";
    return "DIRECT";
}
</code></pre>

* Configure your browser to use this PAC file.  (It is in your proxy configuration settings.) For Safari:
    * Safari >> Preferences >> Advanced >> Proxies (Change Settings) >> Automatic Proxy Configuration
        * URL = file:///Users/your_user_id/etc/proxy.pac
    * Right away: Confirm that Safari still works for normal web sites (e.g. Google.com or msn.com).  If it doesn't, disable the SOCKS proxy setting and fix your PAC file.
* When you want to connect to a web server on your cluster, open a Terminal window and:
    * ssh -D 1080 Master_public_DNS_address
        * e.g. ssh -D 1080 ec2-12-34-567-890.us-west-2.compute.amazonaws.com
    * For any web server running on your master cluster server, you can get there by entering the URL (including the port).  Because that URL uses the Master public DNS name, the PAC file will send it through your SSH SOCKS proxy.

##List Files In HDFS File System
* Deprecated method: hadoop dfs -mkdir /user/hadoop
* Modern method: hdfs dfs -ls /user
* Note that "hadoop dfs" is what is deprecated.  You can get help on the replacement hdfs commands by running
    * hdfs
        * Lists all hdfs subcommands
    * hdfs subcommand
        * e.g. hdfs dfs
        * Shows help for the subcommand
##Copy a File to/from the Cluster to/from Your Laptop/Desktop
* scp  -i ~/Coursera-Data-Sci-Oregon.pem hadoop@<master.public-dns-name.amazonaws.com>:src_file local_dest_file
* scp  -i ~/Coursera-Data-Sci-Oregon.pem  local_src_file hadoop@<master.public-dns-name.amazonaws.com>:dest_file
* I set up a local script named scpi to do the "scp -i", so I just type the src and the dest.

##How Many MapReduce Jobs Are Running?
* I can't find it.  Here's what I tried:
    * AWS 3.x Hadoop ResourceManager http://master-public-dns-name:9026/ is not running
    * AWS 3.x Hadoop HDFS NameNode http://master-public-dns-name:9101/ is not running
    * AWS 3.x Ganglia Metrics Reports http://master-public-dns-name/ganglia/ is running, but I can't find MapReduce jobs there
    * AWS 3.x HBase Interface http://master-public-dns-name:60010/master-status is not running
    * AWS 3.x Hue Web Application http://master-public-dns-name:8888/ is running.  What is it?
    * AWS 3.x Impala Statestore http://master-public-dns-name:25000 is not running.
    * AWS 3.x Impalad	http://master-public-dns-name:25010 is not running
    * AWS 3.x Impala Catalog	http://master-public-dns-name:25020 is not running
    * AWS 4.x: Amazon says this shows a metric called JobsRunning, but when I look there, the metric does not exist:
        * https://console.aws.amazon.com/cloudwatch/
        * Click EMR in the left-side nav panel
        * Maybe it is now AppsRunning?
        * Maybe it in MRActiveNodes?
    * On the Cluster Details page (select the cluster from [EMR cluster list](https://us-west-2.console.aws.amazon.com/elasticmapreduce/home?)), there is a "Connections:" header.  To the right of that is a list of web servers.  The *Resource Manager* link takes you to a Hadoop *Cluster Metrics* page that is interesting.
        * It lists each running application. (It calls them "entries.")  Over near the right side, there is a progress bar.  If you hover over the progress bar, it will give you a percent complete in the flyover text.
        * You can get to this without using a SOCKS or other SSH tunnel!
        * You might have to refresh this page manually.
