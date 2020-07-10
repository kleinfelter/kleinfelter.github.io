---
title: Whooshing From Chrome to Safari and Back
layout: post
---

Chrome works better for me than Safari, particularly when I have many, many tabs open.  However, when I run my Macbook on batteries, Chrome drains batteries too fast, so I'd like to use Safari when I'm on battery power.  I created a couple of Applescripts to move my open tabs from Chrome to Safari and vice versa.

I found scripts online to do these, but they appear to rely on obsolete editions of OS X.  My scripts below work on OS X High Sierra with the current Google Chrome as of 2018.01.01.

Conceptually, it is a simple task: Take these tabs in one browser and open them in the other.  ("Whoosh them" from one browser to the other.)  There are some challenges along the way:

*  The object model ("dictionary" in Apple parlance) for the browsers differ.
*  The object model is incompletely documented.  There are many properties and methods which you just have to discover via Googling.
*  Pinned tabs behave differently between Chrome and Safai.  Frankly, the Safari practice of putting your pinned tabs in every Safari window is just stupid.
*  You can't pin a tab via the object model -- you must resort to GUI scripting.
*  Bringing a window or tab to the foreground changes the order of the browser's windows/tabs, so you can't iterate through windows/tabs while bringing them to the foreground.  You have to collect the IDs and then iterate through the IDs.
*  AppleScript is just an all-around peculiar language and environment.

Here is Chrome-to-Safari:

```
-- Move all tabs from Chrome to Safari.


-- Optionally close existing Safari tabs first
set question to display dialog "Close exisisting Safari tabs first?" buttons {"Yes", "No"} default button 1
set answer to button returned of question
if answer is equal to "Yes" then
	closeAllSafariTabs()
end if

tell application "Google Chrome"
	
	-- for every Chrome window, open a Safari Window
	repeat with theChromeWindow in windows
		set theSafariWindow to my openNewSafariWindow()
		
		-- for every tab in the Chrome window, open a tab in the Safari window
		repeat with theChromeTab in theChromeWindow's tabs
			my makeSafariTab(theSafariWindow, URL of theChromeTab)
		end repeat
	end repeat
end tell

pinSpecialTabsInSafari()

tell me to activate
set question to display dialog "Close old Chrome tabs?" buttons {"Yes", "No"} default button 2
set answer to button returned of question
if answer is equal to "Yes" then
	closeAllChromeTabs()
end if

tell application "Safari" to activate


-- Open a *new* Safari window.
on openNewSafariWindow()
	tell application "Safari"
		make new document at end of documents
		set theSafariWindow to window 1
	end tell
	return theSafariWindow
end openNewSafariWindow



-- I have a set of sites for which I used pinned tabs in Chrome.
-- Note that because pinning behaves differently in Chrome and Safari, I don't always pin my pin-desired tabs when I move them to Safari.
on pinSpecialTabsInSafari()
	
	-- Note: You can't simply iterate windows and tabs because activating a window/tab re-orders the collection.
	--       You have to get a collection of IDs and iterate the IDs because they don't change.
	
	tell application "Safari" to set windowIds to (id of every window)
	tell application "Safari" to activate -- have to activate Safari because I'm automating clicks on its menus.
	
	repeat with wid in windowIds
		tell application "Safari"
			set theSafariWindow to (first window whose id = wid)
			set index of theSafariWindow to 1 -- bring THIS Safari window to top of Safari.
			
			tell theSafariWindow
				-- if you don't do this, sometimes Safari is the front app, with the desired window in the foreground, but it isn't actually activated.
				set visible to false
				set visible to true
			end tell
			
			repeat with t in every tab of theSafariWindow
				tell theSafariWindow to set current tab to t
				my waitForFrontTabToLoad()
				set theURL to URL of t
				if my shouldPinMe(theURL) then
					my pinActiveTab()
				end if
			end repeat
		end tell
	end repeat
	
	
end pinSpecialTabsInSafari


-- Create a new Safari tab in the specified window.
on makeSafariTab(theSafariWindow, theURL)
	
	if (theURL as string) = "chrome://newtab/" then
		-- skip empty tabs.  (You'd need to change chrome://newtab/ to about:blank in order to open it in Safari.)
	else
		tell application "Safari"
			try
				tell window 1 to set current tab to make new tab at end of tabs of theSafariWindow with properties {URL:theURL}
			on error
				open location theURL
			end try
			
			-- Close empty 'Favorites' tab created when making new window.
			set thisTab to tab 1 of theSafariWindow
			if thisTab's name as string = "Favorites" then close tab 1 of window 1
			
		end tell
	end if
end makeSafariTab


-- Wait for the front-most tab of Safari to finish loading (at least until it has a title).
on waitForFrontTabToLoad()
	repeat until leftString((name of front document of application "Safari"), 8) is not "Untitled"
		delay 0.1
	end repeat
end waitForFrontTabToLoad


-- I always pin certain tabs.
-- Note that because pinning behaves differently in Chrome and Safari, I don't always pin my pin-desired tabs when I move them to Safari.
on shouldPinMe(uri)
	
	tell application "Safari" to set wCount to count of windows
	if wCount > 1 then return false -- pinned tabs are stupid in Safari.  Pinning a tab in one window will add it to ALL safari windows
	
	if (uri as string) = "missing value" then error "no URI in shouldPinMe"
	if uri contains "//pinboard.in" then return true
	if uri contains "//focus.nirvanahq.com" then return true
	if uri contains "//www.nirvanahq.com" then return true
	if uri contains "//workflowy.com" then return true
	if uri contains "//voice.google.com" then return true
	if uri contains "//calendar.google.com" then return true
	if uri contains "//mail.google.com" then return true
	
	return false
end shouldPinMe


-- Pin the tab which is currently front-most in Safari.
on pinActiveTab()
	-- delay 1
	tell application "System Events"
		tell process "Safari"
			set frontmost to true
			click menu item "Pin Tab" of menu "Window" of menu bar 1
		end tell
	end tell
end pinActiveTab


-- Close every Safari tab.
on closeAllSafariTabs()
	tell application "Safari"
		set wCount to count of windows
		repeat with i from 1 to wCount
			set theSafariWindow to window 1
			repeat with theSafariTab in theSafariWindow's tabs
				tell theSafariWindow to close tab 1
			end repeat
		end repeat
	end tell
end closeAllSafariTabs


-- Close every Chrome tab.
on closeAllChromeTabs()
	tell application "Google Chrome"
		set windowList to every tab of every window
		repeat with tabList in windowList
			set tabList to tabList as any
			repeat with tabItr in tabList
				set tabItr to tabItr as any
				delete tabItr
			end repeat
		end repeat
	end tell
end closeAllChromeTabs


-- Return the first n characters of string s.
on leftString(s, n)
	if length of s is less than n then
		return s
	else
		return text 1 thru n of s
	end if
end leftString
```

Here is Safari-to-Chrome:

```
-- Move all tabs from Safari to Chrome

-- Optionally close existing Chrome tabs first
tell me to activate
set question to display dialog "Close exisisting Chrome tabs first?" buttons {"Yes", "No"} default button 1
set answer to button returned of question
if answer is equal to "Yes" then
	closeAllChromeTabs()
end if


tell application "Safari"
	repeat with theSafariWindow in windows
		tell application "Google Chrome" to set theChromeWindow to make new window
		repeat with theSafariTab in theSafariWindow's tabs
			set theURL to URL of theSafariTab
			tell application "Google Chrome"
				set theChromeTab to make new tab at end of tabs of theChromeWindow
				set URL of theChromeTab to theURL
				
			end tell
		end repeat
		-- Close empty tab created when making new window.
		tell application "Google Chrome" to close tab 1 of theChromeWindow
		
		
		tell application "Google Chrome" to set tabCount to number of tabs in theChromeWindow
		repeat with i from 1 to tabCount
			tell application "Google Chrome" to set active tab index of first window to i
			tell application "Google Chrome" to set theURL to URL of active tab of front window
			if my ShouldPinMe(theURL) then
				my pinActiveTab()
			end if
		end repeat
		
	end repeat
end tell


tell me to activate
set question to display dialog "Close exisisting Safari tabs?" buttons {"Yes", "No"} default button 2
set answer to button returned of question
if answer is equal to "Yes" then
	closeAllSafariTabs()
end if


-- I always pin certain tabs.
on ShouldPinMe(uri)
	if uri contains "//pinboard.in" then return true
	if uri contains "//focus.nirvanahq.com" then return true
	if uri contains "//workflowy.com" then return true
	if uri contains "//voice.google.com" then return true
	if uri contains "//calendar.google.com" then return true
	if uri contains "//mail.google.com" then return true
	return false
end ShouldPinMe

on pinActiveTab()
	tell application "Google Chrome" to activate
	tell window 1 of application "Google Chrome" to set visible to true
	tell application "System Events"
		tell process "Google Chrome"
			set m1 to (first menu bar item where name is "Window") of menu bar 1
			set mx to menu item "Pin Tab" of menu 1 of m1
			click mx
		end tell
	end tell
end pinActiveTab


on closeAllChromeTabs()
	tell application "Google Chrome"
		set windowList to every tab of every window
		repeat with tabList in windowList
			set tabList to tabList as any
			repeat with tabItr in tabList
				set tabItr to tabItr as any
				delete tabItr
			end repeat
		end repeat
	end tell
end closeAllChromeTabs


on closeAllSafariTabs()
	tell application "Safari"
		set wCount to count of windows
		repeat with i from 1 to wCount
			set theSafariWindow to window 1
			repeat with theSafariTab in theSafariWindow's tabs
				tell theSafariWindow to close tab 1
			end repeat
		end repeat
	end tell
end closeAllSafariTabs
```
