## Tiddlywiki on Node.js With Docker on My Macbook

CAUTION: I haven't implemented this with live data yet.  I decided it was too much change at once.  (I'm a TW Classic user.)  The staged implementation plan is:

* Use the 'Node.js' TW natively (without Docker, without the MultiUser plugin).  Soak.  Get really comfortable with it.
* Add MultiUser plugin.  Soak.  Get really comfortable with it.
* Wrap it in Docker.

That way, if there is weirdness, I'll recognize which piece of the puzzle to blame.

That being said, here's how my proof-of-concept project went...



**Introduction:**

I decided to run the Node.js edition of Tiddlywiki on my Macbook.  I elected to use Docker so that all dependencies can be contained (i.e. in a container).  That way, if I later decide to run a *different* version of Node.js for another project, Tiddlywiki's Node.js remains unchanged.  And I also threw in the MultiUser plugin.  (I don't care about multi-user.  It also adds sub-wikis served from the same port.)

This document focuses on the Tiddlywiki and Node.js aspects.  My general notes about Dockerfile and docker-compose are [here](kevins-guide-to-using-dockerfile).

Documentation for the plugin is here: https://github.com/OokTech/TW5-MultiUser

-----

First, define some constants in .bash_profile, to reduce redundant typing:

```bash
export twd='/Users/kevin/Sync/Sites/tw-node'
alias twd="cd $twd"
```

Then

```bash
. ~/.bash_profile 
mkdir $twd
cd $twd
```



**Some explanation about my approach**:

I wanted to put all the setup in the Dockerfile, and it worked pretty well that way until I added MultiUser plugin.  Without the plugin, you can put your wiki files anywhere you want.  With the plugin, it wants your wiki(s) to live under ```node_modules/tiddlywiki/editions```.  If you want a persistent wiki, you have to mount your wiki directory on a host directory, but you can't mount onto a host directory from the Dockerfile (because they want that directory to be flexible at runtime). You can't update ```node_modules/tiddlywiki/editions``` at setup (from the Dockerfile) and also mount it at runtime.

So I do a lot of conditional 'setup' in the container-rc.sh script.



**Continuing**:

Create 'Dockerfile' containing:

```dockerfile
# Use the node image, based on the alpine micro-Linux image as our starting point.
FROM node:alpine
RUN apk add --no-cache git

# Define a volume for mounting on host file system.  (i.e. Enable mounting this path.)
VOLUME /var/lib/tiddlywiki

# set the container's working directory for any 
# RUN, CMD, ENTRYPOINT, COPY and ADD commands *below*.
WORKDIR /var/lib/tiddlywiki

# Copy container-rc.sh from the Dockerfile directory into the image.
# Add a container startup script (runs inside the container.  e.g. AUTOEXEC.BAT)
ADD container-rc.sh /usr/local/bin/container-rc.sh

# These are the VM port.  At run-time, map them to host IP:ports
# We need two consecutive ports: One for the wiki server and the MultiUser plugin
# uses another port for its 'websockets'
EXPOSE 8080 8081
```



Create docker-compose.yml containing (reminder - no tabs in YAML):

```yaml
version: "3"                    # Using version 3 docker-compose file format.
services:
    tw-node:                    # Name of the image? service? I'm creating.
        build: .                # Use the Dockerfile in . to build the image
        ports:
                - "127.0.0.1:8080:8080" # host:container.
                - "127.0.0.1:8081:8081" # host:container.
                                # Could also use "8080:8080" to not specify host IP.
        # volume mount syntax= /host/path:/container/path
        volumes:
           - /Users/kevin/Sync/Sites/tw-node:/var/lib/tiddlywiki
        command: /bin/sh /usr/local/bin/container-rc.sh

```



Build the image:

```
docker-compose build --no-cache
```



Create runme.sh containing:

```
#!/bin/sh
docker-compose up
```



Create container-rc.sh containing:

```bash
#!/bin/sh
# I have to do much of the setup in here because I want to put my files onto the mounted volume

# Abort immediately on shell errors
set -e

TWD=/var/lib/tiddlywiki
cd $TWD

# This is how you would initialize a non-plugin wiki
#if [ ! -d /var/lib/tiddlywiki/mywiki ]; then
#  /usr/local/bin/node /usr/local/bin/tiddlywiki mywiki --init server
#fi

if [ ! -d node_modules/tiddlywiki/editions/MultiUserWiki ]; then

  echo "Installing tiddlywiki node package locally. This will take several minutes..."
  npm install tiddlywiki@5.1.15

  cd $TWD/node_modules
  echo "CLONING MultiUser plugin"
  git clone --depth=1 https://github.com/OokTech/TW5-MultiUser.git tiddlywiki/plugins/OokTech/MultiUser

  echo "Copying starter wiki"
  cp -r tiddlywiki/plugins/OokTech/MultiUser/MultiUserWiki tiddlywiki/editions/
fi

cd $TWD/node_modules/tiddlywiki

echo "Launching node"
exec /usr/local/bin/node ./tiddlywiki.js editions/MultiUserWiki  --wsserver 8080 ${USERNAME:-user} ${PASSWORD:-'wiki'} 0.0.0.0

```

Note that this uses the latest edition of the MultiUser plugin.  If you want to specify a version you'll need to:

* Clone the plugin repository to something like /tmp/MultiUser.
* cd to that directory and run git log.  Identify the commit hash of the version you want.
* ```git clone commithash-here``` 



Be sure to: ```chmod +x runme.sh``` and ```chmod +x container-rc.sh```

Launch your wiki with:

```bash
./runme.sh
```



Note that if you want to start from a clean slate (i.e. re-run the init stuff), you'll find it handy to have a script.  Create a file named *make-clean.sh*:

```bash
#!/bin/bash
echo "Run this only if you want to delete all the wiki content and start over. Press control-C to stop or Enter to continue."
read
rm -rf /tmp/node_modules
rm -rf /tmp/package-lock.json

mv node_modules /tmp
mv package-lock.json /tmp
```

Be sure to: ```chmod +x make-clean.sh``` 

You need not re-build the image after a make-clean... just start the container and it will re-run the init.



**Suppressing an Annoyance**:

See [this](https://groups.google.com/d/msg/tiddlywiki/gWRqpmZNg9k/GQ4xd0p309cJ) for information on suppressing a superfluous unsaved-changes warning from your browser.  The author says this is OK [here](https://groups.google.com/d/msg/tiddlywiki/UM3U1_637Zk/yWQYPitoBAAJ).



**A Real Problem**:

When running under Docker, if I create a title-only tiddler (no body), it looks like it saved it (i.e. the red save button goes gray), but it doesn't show up under the 'Recent' tab and it is unable to display it when the page is reloaded.  You can make them show up by (in the host) navigating to that wiki's data folder and running ```touch *``` (but that's gonna set the time on every tiddler).

Plain Node.js TW doesn't have this problem in a container.  The plugin does not have this problem when run outside a container.

The plugin's author says the tiddler *is* visible to the wiki - it just isn't listed under Recents.  I think he's right.  He says it's a known bug.



**Testing**:

In addition to a smoke test of saving tiddlers (in the sub-wikis) and reloading the page to confirm they really got saved, confirm that the wiki *is* accessible via localhost:8080 and is not accessible at external-ip-address:8080.

**Daemon**:

Once you are satisfied that it works, you'll want to set up LaunchCtl to launch it automagically.

Create a LaunchCtl file  /Users/kevin/Library/LaunchAgents/com.kleinfelter.tw-node.plist to specify how to run your container as a service:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.kleinfelter.tw-node</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Users/kevin/Sync/Sites/tw-node/runme.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/var/log/tw-node.log</string>
    <key>StandardErrorPath</key>
    <string>/var/log/tw-node/tw-node.err</string>
</dict>
</plist>
```



Then:

```
sudo mkdir /var/log/tw-node
sudo chown kevin /var/log/tw-node
```



Then load your LaunchCtl with:

```bash
launchctl load /Users/kevin/Library/LaunchAgents/com.kleinfelter.tw-node.plist
```



And check to be sure your service is working.
