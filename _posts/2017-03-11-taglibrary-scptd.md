---
categories: []
layout: post
title: TagLibrary.scptd
created: 1489247975
redirect_from: /content/taglibraryscptd
---
I don't know where this came from, but it is helpful in dealing with tags on Mac OS X.

    use framework "Foundation"

    -- Must be stored in ~/Library/Script Libraries as a .scptd file
    -- Sample use from a script:
    -- 
    -- use theLib : script "TagLibrary"
    -- use scripting additions
    -- set fileName to "/Users/kevin/Temp/image-and-text.pdf"
    -- theLib's setTags:{"tag1", "tag2"} forPath:(fileName)
    -- theLib's addTags:{"tag3", "tag4"} forPath:(fileName)
    -- set s to theLib's returnTagsFor:(fileName)
    -- repeat with x in s
    -- 	display dialog x
    -- end repeat

    on returnTagsFor:posixPath -- get the tags
        set aURL to current application's |NSURL|'s fileURLWithPath:posixPath -- make URL
        set {theResult, theTags} to aURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
        if theTags = missing value then return {} -- because when there are none, it returns missing value
        return theTags as list
    end returnTagsFor:

    on setTags:tagList forPath:posixPath -- set the tags, replacing any existing
        set aURL to current application's |NSURL|'s fileURLWithPath:posixPath -- make URL
        aURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
    end setTags:forPath:

    on addTags:tagList forPath:posixPath -- add to existing tags
        set aURL to current application's |NSURL|'s fileURLWithPath:posixPath -- make URL
        -- get existing tags
        set {theResult, theTags} to aURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
        if theTags ≠ missing value then -- add new tags
            set tagList to (theTags as list) & tagList
            set tagList to (current application's NSOrderedSet's orderedSetWithArray:tagList)'s allObjects() -- delete any duplicates
        end if
        aURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
    end addTags:forPath:
