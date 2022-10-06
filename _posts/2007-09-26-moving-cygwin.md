---
excerpt: "<p>Suppose you have Cygwin installed on one drive, and you need to move
  it to another.  Just for grins, let&#39;s assume that you are going to move it using
  Windows Explorer (i.e. not using Cygwin to move Cygwin).  This is something that
  I have to do from time to time, because I work as a consultant, and I move from
  PC to PC pretty often.  When you do this, pieces of Cygwin break.  Here&#39;s where
  I keep track of the things I have to do after moving Cygwin.</p><ol><li>cd ~</li><li>chown
  kevin:kevin *</li><li>chown kevin:kevin .*</li><li>chmod go-rwx .ssh/*</li></ol>"
categories: []
layout: post
title: Moving Cygwin
created: 1190834202
---
<p>Suppose you have Cygwin installed on one drive, and you need to move it to another.  Just for grins, let&#39;s assume that you are going to move it using Windows Explorer (i.e. not using Cygwin to move Cygwin).  This is something that I have to do from time to time, because I work as a consultant, and I move from PC to PC pretty often.  When you do this, pieces of Cygwin break.  Here&#39;s where I keep track of the things I have to do after moving Cygwin.</p><ol><li>cd ~</li><li>chown kevin:kevin *</li><li>chown kevin:kevin .*</li><li>chmod go-rwx .ssh/*</li></ol>
