---
title: Using AppleScript for GUI Scripting - Discovering the Interface
layout: post
---

Sometimes you want to script a Mac OS X app, and you can't really do it via the dictionary.  At that point, you revert to something called "GUI scripting."  You automate the app's user interface via the Accessibility interface.  This is similar to what Autohotkey users do for Windows PCs.

Often, you want to do something like "Click on the Windows menu; then click on the first item."  The trick is that different apps implement menus which LOOK the same with different structure.  You need to discover the actual structure of the menu in order to click it programmatically.

Here is a sample script to show all of the menu items on an application (Google Chrome) menu bar.

```
`osascript -sso > /private/tmp/StatusBarItems <&- <<EOF
tell application "System Events"
    get properties of every  menu bar item of menu bar 1  of process "Google Chrome"
end tell
EOF`
```

This will write the menu bar structure to /tmp/StatusBarItems.  Buried in that file, you'll see the following snippet. (The whole output is much larger because it dumps EVERY item in the menu.)

```
{minimum value:missing value, orientation:missing value, position:{470, 0}, class:menu bar item, accessibility description:missing value, role description:"menu bar item", focused:missing value, title:"Window", size:{70, 22}, help:missing value, entire contents:{}, enabled:true, maximum value:missing value, role:"AXMenuBarItem", value:missing value, subrole:missing value, selected:false, name:"Window", description:"menu bar item"}
```

Reformatting that, and dropping all of the "missing value" entries, it looks like:

```
{
    position:{470, 0}, 
		class:menu bar item,
		role description:"menu bar item",
		title:"Window", 
		size:{70, 22},
		entire contents:{}, 
		enabled:true,
		role:"AXMenuBarItem",
		selected:false,
		name:"Window", 
		description:"menu bar item"
}
```

The upshot of that is that you can use code to look for a "menu bar item" (in menu bar 1) where name = "Window".  You could probably search for the other attributes, but 'menu item with name = x' makes for more readable code than 'menu item at 470,0.

The items under the Window menu have their own structure.  Dump that structure with this code:

```
osascript -sso > /private/tmp/StatusBarItems <&- <<EOF
tell application "System Events"
    get properties of (first menu bar item where name is "Window") of menu bar 1  of process "Google Chrome"
end tell
EOF
```

That dumps the following to /tmp/StatusBarItems:

```
{minimum value:missing value, orientation:missing value, position:{470, 0}, class:menu bar item, accessibility description:missing value, role description:"menu bar item", focused:missing value, title:"Window", size:{70, 22}, help:missing value, entire contents:{}, enabled:true, maximum value:missing value, role:"AXMenuBarItem", value:missing value, subrole:missing value, selected:false, name:"Window", description:"menu bar item"}
```

and when you reformat and strip out missing values, it looks like:

```
{
    position:{470, 0}, 
		class:menu bar item,
		role description:"menu bar item",
		title:"Window", 
		size:{70, 22},
		entire contents:{}, 
		enabled:true,
		role:"AXMenuBarItem",
		selected:false,
		name:"Window", 
		description:"menu bar item"
}
```

which looks a whole lot like the output from the first dump.  (In the first dump, which dumped everything in the menu, we visually located this menu item and manually extracted it.  In this second dump, we used code to extract that one menu item.)

This information tells you that Google Chrome has:

* A menu bar 1 containing a menu bar item named "Window"

You could dump the content of the Window menu bar item, and see the things that are in it.  I wanted to click on the "Pin Tab" item in the Window menu.  I happen to know that entries in a menu which don't launch sub-menus are called "menu item", so I didn't take the time to write osascript to dump that menu.

Putting all of this information together, I knew I could write code like the following:

```
	tell application "Google Chrome" to activate
	tell window 1 of application "Google Chrome" to set visible to true
	tell application "System Events"
		tell process "Google Chrome"
			set m1 to (first menu bar item where name is "Window") of menu bar 1
			set mx to menu item "Pin Tab" of menu 1 of m1
			click mx
		end tell
	end tell
```
