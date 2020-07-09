---
title: Moving Jekyll to Docker
layout: post
date: 2017-11-15 18:32 -0500
---

*a.k.a. Docker Jekyl and Mr. Hyde.  (Sorry, I couldn't resist.)*

At this point, the only Ruby thing I'm using on my Macbook is Jekyll.  Instead of installing an up-to-date ruby, chruby, bundler, and ruby-build (which was how I'd previously run Jekyll).  This is the story of how I migrated my Jekyll sites (kleinfelter.com and k4kpk.com) into Docker containers.

 

Notes: 

-   My local copy of my primary web site lives in the directory 'kleinfelter.github.io'.
-   I launch my Jekyll via a Launch Agent, which runs the shell script runme-local.sh in the site directory.
-   I have a newer, [canonical form for using Docker](kevins-guide-to-using-dockerfile).


Steps:

-   Install Docker for Mac.
-   Since I'm auto-starting Jekyll via a Launch Agent, I need to stop the existing one:
    -   launchctl unload /Users/kevin/Library/LaunchAgents/com.kleinfelter.jekyll.kleinfelter.plist
-   Since I'm going to use the [jekyll/jekyll](https://store.docker.com/community/images/jekyll/jekyll) image, I can stop using bundler.  I'm not going to uninstall bundler, since that's part of my Macbook's ruby installs, but since I'm going to be using the gems provided in the image, I don't need to be coordinating my own gems.
    -   cd kleinfelter.github.io
    -   git rm Gemfile
    -   git rm Gemfile.lock
    -   git rm -r vendor
    -   rm -r vendor
-   Create a docker-compose.yml in kleinfelter.github.io containing:

```
jekyll-kleinfelter:
    build: .
    command: jekyll serve --watch --incremental
    ports:
        - 4000:4000
    volumes:
        - /Users/kevin/Sync/Sites/kleinfelter.github.io:/srv/jekyll
```

-   Strictly speaking, docker-compose is about running multiple containers.  However, you *can* use it to run a single container, and it makes the command line for that container simpler, by allowing you to put some of your options in the docker-compose file.  This config says:
    -   Service is named 'jekyll-kleinfelter'
    -   Build per the 'Dockerfile' in the current directory.
    -   Launch the process to run in the container with: the given 'command' line.
    -   Connect host port 4000 to container port 4000.
    -   Mount the given host volume onto /srv/jekyll
-   I'm using the jekyll-admin plugin.  I was using the gem for it, with bundle.  Now that jekyll runs in a container, I can install the gem into the container's site-ruby.  Create the file 'Dockerfile' in kleinfelter.github.io:

```
FROM jekyll/jekyll:pages
RUN gem install jekyll-admin
```

-   That says:
    -   Base your image on the official jekyll plugin, the version designed to work with github-pages.
    -   When building your image, run the given 'gem' command to add the gem.
-   Test it with: 

```
docker-compose build --no-cache
docker-compose up --force-recreate
```

-   Edit runme-local.sh to contain:

```
#!/bin/bash
cd /Users/kevin/Sync/Sites/kleinfelter.github.io
/usr/local/bin/docker-compose up
```

-   Once you're done testing: launchctl load /Users/kevin/Library/LaunchAgents/com.kleinfelter.jekyll.kleinfelter.plist
-   Occasionally, when Jekyll is running, I need to force a site rebuild.
    -   Discover the proper container via: {% raw %}```docker ps --format 'table {{.Names}}'```{% endraw %}
    -   Connect to the existing container: ```docker exec -it CONTAINER_NAME_HERE  /bin/bash ```
    -   Run: ```jekyll build```
