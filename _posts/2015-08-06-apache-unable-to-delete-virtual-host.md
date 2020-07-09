---
categories: []
layout: post
title: apache - Unable to delete virtual host
created: 1438874992
redirect_from: /content/apache-unable-delete-virtual-host
---
I have an apache server.  It supports multiple sites (different domain names).  I went into the apache.conf and the sites-enabled directory, and deleted one of my virtual hosts.  I restarted apache.  It kept on serving the deleted host.

It turns out that "When using name-based virtual hosts, the first virtual host configuration loaded will be the default."  I use a content management system on that server, and all the virtual hosts are served via the same CMS.  Since the first virtualhost remaining in apache.conf pointed to the CMS, apache continued to send the deleted virtualhost to the CMS, and the CMS continued serving the content.

The resolution was to define my FIRST virtualhost entry to point to the directory /dev/null and give it a bogus domain name, so that undefined virtualhosts default to /dev/null.
