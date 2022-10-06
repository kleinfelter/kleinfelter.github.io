---
categories: []
layout: post
title: MacPorts or Brew
created: 1462540911
redirect_from: /content/macports-or-brew
---
I thought this was unusually lucid, for a Quora post: https://www.quora.com/Should-I-use-Fink-MacPorts-Homebrew-or-something-else-for-MacOS-package-management

Here's the part that got my attention:

* Homebrew does everything it can to act harmoniously with the software already present on Darwin, the BSD variant of Unix shipped by Apple.  MacPorts, on the other hand, does everything it can to ensure you are running a pure version of the ported software independent of what may be already installed
* If you are porting everyday Unix tools to your Mac and care more about it "just working" and ease of integration, go with Homebrew.  If you are porting things that require precise versioning of supporting software for performance or reliability reasons, you will likely have better results with MacPorts
* I don't recommend using both on the same machine -- they get confused about what versions of system software are already "installed"


This will install brew:

* ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
