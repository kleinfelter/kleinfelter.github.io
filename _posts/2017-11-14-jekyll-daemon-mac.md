---
layout: post
date: "2017-11-14 16:32 -0500"
title: Jekyll Daemon on Mac OS X
---
eee
I wanted to have jekyll always running on my Macbook, so that I could preview my posts before pushing them to my Github Pages site. Here's how I set it up with a Launch Agent. (The challenging parts were learning how to use Launch Agents to run shell scripts and learning how to run Jekyll from a non-login shell.)

I'm using chruby to manage multiple versions of Ruby, and bundle to manage multiple gem levels, and I use Homebrew as a package manager. YMMV if you use other tools.  I've previously confirmed that I can manually launch Jekyll for both of my sites.

 

I have two sites: k4kpk.com and kleinfelter.com, at k4kpk.github.io and kleinfelter.github.io respectively.

 

create \~/Library/LaunchAgents/com.kleinfelter.jekyll.k4kpk.plist:

 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.kleinfelter.jekyll.k4kpk</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Users/kevin/Sync/Sites/k4kpk.github.io/runme-local.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/k4kpk.jekyll.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/k4kpk.jekyll.err</string>
</dict>
</plist>
```

 

Similarly, create \~/Library/LaunchAgents/com.kleinfelter.jekyll.kleinfelter.plist, with 'kleinfelter' substituted for 'k4kpk'.

 

/Users/kevin/Sync/Sites/k4kpk.github.io/runme-local.sh should contain:

```bash
#!/bin/bash
source /Users/kevin/.bash_profile
cd /Users/kevin/Sync/Sites/k4kpk.github.io
chruby 2.4.2
bundle exec jekyll serve --incremental
```

 

-   Test it with: launchctl start com.kleinfelter.jekyll.k4kpk.plist

-   Check output in /tmp/k4kpk.jekyll.err and /tmp/kleinfelter.jekyll.err

 

I had to add this to my Gemfile to prevent an "invalid byte sequence in US-ASCII" error:

```text
Encoding.default_external = Encoding::UTF_8
```

 

I also added this to my \_config.yml

```text
encoding: utf-8
```
