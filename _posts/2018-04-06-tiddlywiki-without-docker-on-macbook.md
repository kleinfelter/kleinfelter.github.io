---
title: Tiddlywiki Without Docker on Macbook
layout: post
---
## Tiddlywiki on Node.js Without Docker on My Macbook

Here's my how-to for how I set up plain old Tiddlywiki on my Macbook.  My plan is to

* Use the 'Node.js' TW natively (without Docker, without the MultiUser plugin).  Soak.  Get really comfortable with it.
* Add MultiUser plugin.  Soak.  Get really comfortable with it.
  * Documentation for the plugin is here: https://github.com/OokTech/TW5-MultiUser
* Wrap it in Docker.

That way, if there is weirdness, I'll recognize which piece of the puzzle to blame.

Note: node.js version 9.7.1 for Darwin was installed from  https://nodejs.org/download/release/ on my machine before I started this process.



-----

First, define some constants in .bash_profile, to reduce redundant typing:

```bash
export twd='/Users/kevin/Sync/Sites/tw-plain'
alias twd="cd $twd"
```



Then

```bash
. ~/.bash_profile 
mkdir $twd
cd $twd
```



Create runme.sh containing:

```bash
#!/bin/sh
# Abort immediately on shell errors
set -e

TWD=/Users/kevin/Sync/Sites/tw-plain
cd $TWD

# Ensure Tiddlywiki is installed.  Peg the version.  I don't want it changing by surprise.
if [ ! -d node_modules/tiddlywiki ]; then
  echo "Installing tiddlywiki node package locally. This will take several minutes..."
  npm install tiddlywiki@5.1.15
fi

#This is how you would initialize a non-plugin wiki
if [ ! -d $TWD/mywiki ]; then
  /usr/local/bin/node $TWD/node_modules/tiddlywiki/tiddlywiki.js mywiki --init server
fi

#if [ ! -d node_modules/tiddlywiki/editions/MultiUserWiki ]; then
#
#  echo "Installing tiddlywiki node package locally. This will take several minutes..."
#  npm install tiddlywiki@5.1.15
#
#  cd $TWD/node_modules
#  echo "CLONING MultiUser plugin"
#  git clone --depth=1 https://github.com/OokTech/TW5-MultiUser.git tiddlywiki/plugins/OokTech/MultiUser

#  echo "Copying starter wiki"
#  cp -r tiddlywiki/plugins/OokTech/MultiUser/MultiUserWiki tiddlywiki/editions/
#fi

cd $TWD

echo "Launching node"
#exec /usr/local/bin/node ./node_modules/tiddlywiki/tiddlywiki.js editions/MultiUserWiki  --wsserver 8080 ${USERNAME:-user} ${PASSWORD:-'wiki'} 0.0.0.0
exec /usr/local/bin/node $TWD/node_modules/tiddlywiki/tiddlywiki.js mywiki --server 8080 $:/core/save/all text/plain text/html 127.0.0.1
```


Be sure to: ```chmod +x runme.sh``` 

Launch your wiki with:

```bash
./runme.sh
```

The first time you launch, you may see the following errors.  They can safely be ignored:

```
npm WARN saveError ENOENT: no such file or directory, open '/Users/kevin/Sync/Sites/tw-plain/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/Users/kevin/Sync/Sites/tw-plain/package.json'
npm WARN tw-plain No description
npm WARN tw-plain No repository field.
npm WARN tw-plain No README data
npm WARN tw-plain No license field.
```



Note that if you want to start from a clean slate, you'll find it handy to have a script.  Create a file named *make-clean.sh*:

```bash
#!/bin/bash
echo "Run this only if you want to delete all the wiki content and start over. Press control-C to stop or Enter to continue."
read

rm -rf mywiki node_modules package-lock.json
```



Be sure to: ```chmod +x make-clean.sh``` 



**Suppressing an Annoyance**:

See [this](https://groups.google.com/d/msg/tiddlywiki/gWRqpmZNg9k/GQ4xd0p309cJ) for information on suppressing a superfluous unsaved-changes warning from your browser.  The author says this is OK [here](https://groups.google.com/d/msg/tiddlywiki/UM3U1_637Zk/yWQYPitoBAAJ).



**Testing**:

In addition to a smoke test of saving tiddlers and reloading the page to confirm they really got saved, confirm that the wiki *is* accessible via localhost:8080 and is not accessible at external-ip-address:8080.

**Daemon**:

Once you are satisfied that it works, you'll want to set up LaunchCtl to launch it automagically.

Create a LaunchCtl file  /Users/kevin/Library/LaunchAgents/com.kleinfelter.tiddlywiki.plist to specify how to run your container as a service:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.kleinfelter.tiddlywiki</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Users/kevin/Sync/Sites/tw-plain/runme.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/var/log/tiddlywiki/tiddlywiki.log</string>
    <key>StandardErrorPath</key>
    <string>/var/log/tiddlywiki/tiddlywiki.err</string>
</dict>
</plist>
```



Then:

```
sudo mkdir /var/log/tiddlywiki
sudo chown kevin /var/log/tiddlywiki
```



Then load your LaunchCtl with:

```bash
launchctl load /Users/kevin/Library/LaunchAgents/com.kleinfelter.tiddlywiki.plist
```



And check to be sure your service is working.



## Customizing your wiki:

* Control Panel:
  * Settings > Camel Case Wiki Links: Disable



#### I prefer a different look:

* Go to http://j.d.material.tiddlyspot.com/
* If you don't get clear instructions, click the 'hamburger menu' to view the "Hello, world" page.
* Follow the instructions on the page to install the theme and the 'more material' and the Roboto font, but NOT the swipe stuff.
  * Tip: Drag each icon from the source site into your TW, and *then* accept the import of all at once.
  * Tip: Download the roboto.tid and import it into your TW.
* Go to the TW Control Panel, Appearance, Theme, and choose 'Material'.
* Note: IF you use FAB buttons, the secondary FABs only appear when you hover over the primary FAB.




#### Make My Own Palette:

- Copy the Material palette into Material-KPK
- It should have type=application/x-tiddler-dictionary
- Tags=$:/tags/Palette
- Fields:
  - name: Kevin's Palette
  - description: Kevin's Palette
- Refresh, and it should show up with the other Palettes in Control Panel > Appearance.

#### Install Markdown:

* There are two Markdown parsers available:
  * https://tiddlywiki.com/plugins/tiddlywiki/markdown - the official markdown plugin; supports PHP Extra dialect.
  * http://bjtools.tiddlyspot.com > MarKed - an unofficial markdown plugin; supports GFM dialect.
* My standard Markdown dialect is GFM, and my Macbook tools are configured to support that.  On the one hand, the official plugin is likely to be around as long as Tiddlywiki is, and there is some risk that BJttools could abandon his.  OTOH, I'd like my tiddlers to use my standard Markdown dialect.  That's kinda key to my strategy of being able to access .tid files as if they were Markdown.
* BJTools doesn't include a new-Markdown button and the official plugin does.  They use different content types, so I could actually install both.  I'm going to install both and I'm going to tinker the official plugin's button to create BJTools Markdown.
* **Install but do NOT use this markdown**.  It supports PHP Markdown Extra dialect.  I have standardized on GFM (see my Macbook Configuration Management document.)
  * Drag and drop from https://tiddlywiki.com/plugins/tiddlywiki/markdown
  * Set dialect to Maruku by editing [$:/config/markdown/dialect](http://localhost:8080/#%24%3A%2Fconfig%2Fmarkdown%2Fdialect) (shadow tiddler)
  * Adjust your Page toolbar to have the create-markdown button and NOT the create-wiki-markup button (via Control Panel > Appearance > Toolbars > Page Toolbar).
* **Install and do use this markdown**.  It supports GFM:
  * Drag and drop from http://bjtools.tiddlyspot.com > MarKed > $:/plugins/bj/plugins/marked
  * also import his Flexitype plugin.
* Then edit $:/plugins/tiddlywiki/markdown/new-markdown-button (system tiddler) and change "text/x-markdown" (PHP) to "text/x-marked" (GFM)



#### Enable Selection and Close of View-mode Tiddlers:

Navigate to Sidebar > More > Shadows, and edit \$:/core/ui/ViewTemplate.  Replace it with the following:

```
\define frame-classes()
tc-tiddler-frame tc-tiddler-view-frame $(missingTiddlerClass)$ $(shadowTiddlerClass)$ $(systemTiddlerClass)$ $(tiddlerTagClasses)$
\end
\define folded-state()
$:/state/folded/$(currentTiddler)$
\end
<$set name="storyTiddler" value=<<currentTiddler>>><$set name="tiddlerInfoState" value=<<qualify "$:/state/popup/tiddler-info">>><$tiddler tiddler=<<currentTiddler>>><$keyboard key="alt-W" message="tm-close-tiddler"><div tabindex="1" class=<<frame-classes>>><$list filter="[all[shadows+tiddlers]tag[$:/tags/ViewTemplate]!has[draft.of]]" variable="listItem"><$transclude tiddler=<<listItem>>/></$list>
</div>
</$keyboard>
</$tiddler></$set></$set>
```



For the record (and for some future release, when you have to derive this anew) the changes to the original ViewTemplate are:

* Add to the div tag: `tabindex=1`
* Wrap a keyboard widget around the div, with key="alt-W" and message="tm-close-tiddler"



Next:

* Edit $:/config/Search/AutoFocus (shadow tiddler) and set it to: false



This implements a not-quite-perfect "Alt-W closes the current view-mode tiddler."  It does, in fact, close the currently selected tiddler.  The gap is that you often must click on the tiddler to select it.  I'd like to modify TW to auto-select a tiddler when it is opened/scrolled-to.  I think this might be do-able (particularly in zoomin mode), but I haven't figured it out yet.  One possibility would be to edit $:/core/templates/tiddlywiki5.html and add an onFocus method to \<body\>.  The trick there is that body might get the focus before the first tiddler is displayed.  Maybe I need to add an onKeypress to tranfer focus or just redirect keystrokes from the body to the first tiddler.  Or I could set a timer...



#### Set Up Tabbed Tiddlers:

* Install StoryTabs from http://bjtools.tiddlyspot.com/  (drag the \$ link for StoryTabs from his site to your TW.)
* Go to Control Panel and set Appearance > Story View = zoomin
* A note about StoryTabs: It solely adds the tabs above the story river.  The reason it looks like tabbed tiddlers is because zoomin mode hides all tiddlers except for the 'top' tiddler in the river.



#### Hide the Story-date Line:

* Browse to the very slow-to-load http://designwritestudio.updog.co
* Drag this tiddler to your TW: $:/_Menu/Home/Configuration/Options
* Rename it to "Configure Tiddler Subtitle"
* Visit that tiddler and turn off display of subtitles and tags.



#### Enable Double-click to Edit:

* Go to https://danielorodriguez.com/TW5-2click2edit/
* Drag and drop the 2click2edit plugin into my wiki



