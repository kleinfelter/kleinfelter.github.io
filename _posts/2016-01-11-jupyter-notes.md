---
categories: []
layout: post
title: Jupyter Notes
created: 1452549674
redirect_from: /content/jupyter-notes
---
All of this is on a Mac:

* Install jupyter: `sudo pip3 install jupyter`
* Add R support for jupyter.  You need to "install from source."  In R:
    * `xcode-select --install` 
    * `brew install zmq`
    * `R`
        * Use the command-line and not R studio
    * `install.packages(c('rzmq','repr','IRkernel','IRdisplay'),repos = c('http://irkernel.github.io/', getOption('repos')), type = 'source') IRkernel::installspec(user = FALSE)`
* Start Jupyter: `ipython notebook`
    * I put this into a shell script "run-jupyter"
    * Start it from Terminal.  Current working directory is significant.
    * It will open a local browser, and that's how you interact with it.  It will open the browser to navigate at the current working directory from where you started the server.
* Rename a notebook: Select the checkbox by the notebook's name.  The toolbar will gain a 'Rename' button.
