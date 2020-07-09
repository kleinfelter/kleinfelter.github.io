## Kevin's Guide to Using Dockerfile and docker-compose.yml

and generaly, how to docker-enable an application.



As a rule, don't install libraries or scripting languages directly onto your host.  e.g. The moment you install Ruby 1.9.1 onto your host, you'll run into a must-have app which requires Ruby 1.8.5.  Yes, there are ways to manage multiple Ruby (or multiple Python or multiple libc), but it is just safer and cleaner to put all that stuff inside a container.

A Dockerfile specifies how to build an image. It doesn't address how to run that image as a container.  docker-compose is  a tool to run your images.  Here's how I use something new under Docker on my Mac.

Strictly speaking, docker-compose is about running multiple containers. However, you can use it to run a single container, and it makes the command line for that container simpler, by allowing you to put some of your options in the docker-compose file.

Note: This isn't *quite* how I set up my Jekyll images.  Those were done before I defined my canonical form.

1. Create a folder for your app.  We'll refer to it as app-dir.  Put everything shown below into this folder.

2. Write the Dockerfile just to **build** the image, not to run it.  e.g.

   ```dockerfile
   # Use the specified image as a baseline.
   # See https://hub.docker.com/explore/ for official images.
   # Format is one of:
   #   FROM image
   #   FROM image:tag
   #   FROM image
   # The one below comes directly from the doc at https://hub.docker.com/_/node/
   FROM node:alpine

   # The RUN command says, "After you download the image, run this command to
   # customize the image to your needs.  Runs as part of building (not starting) the image
   #
   # The RUN below says:
   #   Install v 5.1.15 of Tiddlywiki (TW) into Node.js using npm (the Node package mgr).  #   You could specify a newer version (or no version, by omitting '@5.1.15') but you 
   #  may have to adapt these instructions if TW has major changes.
   # I recommend that you ALWAYS specify a version or a tag.
   RUN npm install -g tiddlywiki@5.1.15
   RUN /usr/local/bin/node /usr/local/bin/tiddlywiki wiki-data --init server

   # Define a volume for mounting on host file system.  (i.e. Enable mounting this path.)
   VOLUME /var/lib/tiddlywiki

   # set the container's working directory for any 
   # RUN, CMD, ENTRYPOINT, COPY and ADD commands *below*.
   # Reminder: TW writes its files to the working directory.
   WORKDIR /var/lib/tiddlywiki

   # Add a script which you will (later) launch inside the container to do tasks
   # you want done EACH time the container starts.
   ADD container-rc.sh /usr/local/bin/container-rc.sh

   # Expose any ports.  Note that on Win/Mac, Docker runs in a VM and this is the
   # VM port.  You need to map the VM port to a host port at runtime, if you are to
   # access it.
   EXPOSE 8080
   ```
   ​

3. Write docker-compose.yml to specify how to **run** the image. (Reminder: No tabs in YAML.)

   ```yaml
   version: "3"                    # Using version 3 docker-compose file format.
   services:
       tw-node:                    # Name of the image? service? I'm creating.
           build: .                # Use the Dockerfile in . to build the image
           ports:
               - "127.0.0.1:8080:8080"
                                   # host:container.  Quotes strongly recommended.
                                   # Two forms: hostPort:containerPort or 
                                   #     hostIP:hostPort:containerPort
           volumes:
                                   # /host/path:/container/path
               - /Users/kevin/Sync/Sites/tw-node:/var/lib/tiddlywiki
           command: /bin/sh /usr/local/bin/container-rc.sh
   ```

4. Create runme.sh, to launch the container, containing 

   ```bash
   #!/bin/bash
   cd /path/to/app-dir
   /usr/local/bin/docker-compose up
   ```

5. Create container-rc.sh, which starts the processes *inside* the container:

   ```
   ??
   ```

    

6. Be sure to:

   ```
   chmod +x runme.sh
   chmod +x container-rc.sh
   ```

   ​

7. Build your image with:

   ```bash
   docker-compose build --no-cache
   ```

   - You can usually omit --no-cache, and it will use cached layers upon which this image depends.  Adding --no-cache ensures that you don't get a layer you cached which was built with special args.  I don't do a lot of building, so I don't mind if it is slow.

8. Test your image with:

   ```bash
   ./runme.sh
   ```

9. It can take 15-20 seconds to start a simple image.  You'll usually see this when it is up: "Server running... press ctrl-c to stop."

10. Once you validate your service is working, press control-C to stop it.

11. Create a LaunchCtl file  /Users/kevin/Library/LaunchAgents/com.kleinfelter.SERVICE_NAME_HERE.plist to specify how to run your container as a service:

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.kleinfelter.SERVICE_NAME_HERE</string>
        <key>ProgramArguments</key>
        <array>
            <string>/bin/bash</string>
            <string>/path/to/app-dir/runme.sh</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>/var/log/SERVICE_NAME_HERE/SERVICE_NAME_HERE.log</string>
        <key>StandardErrorPath</key>
        <string>/var/log/SERVICE_NAME_HERE/SERVICE_NAME_HERE.err</string>
    </dict>
    </plist>
    ```

12. ```
    sudo mkdir /var/log/SERVICE_NAME_HERE
    sudo chown kevin /var/log/SERVICE_NAME_HERE
    ```

13. Then load your LaunchCtl with:

    ```bash
    launchctl load /Users/kevin/Library/LaunchAgents/com.kleinfelter.SERVICE_NAME_HERE.plist
    ```

14. And check to be sure your service is working.

15. Reminder: To open a bash prompt in your image (without installing ssh and using ssh):

{% raw %}
    ```bash
    docker docker ps --format 'table {{.Names}}' #Identify the desired container name
    docker exec -it CONTAINER_NAME_HERE /bin/bash #-i gets STDIN, -t gets a pseudo-tty
    ```
{% endraw %}

16. Rejoice!

