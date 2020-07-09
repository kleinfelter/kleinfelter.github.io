---
categories: []
layout: post
title: Synchronize/Replicate/Push Browser Bookmarks to Pinboard Via Xmarks
created: 1321668517
redirect_from: /content/synchronizereplicatepush-browser-bookmarks-pinboard-xmarks
---
I wanted to send all new bookmarks from my browser to pinboard/delicious.  I wanted to be browser independent.  I discovered that it is pretty easy to do this via Xmarks and a shell script.  I run the following script from cron. <br />
<code><pre>
#!/bin/bash
########################################################
# 'Synchronize' xmarks to pinboard/delicious.
# What it really does is to replicate NEW xmarks bookmarks to pinboard.
# One-way -- just adds.
# The first time, it pushes nothing, and saves the current state, against which future deltas are measured.
#
# I really wanted to synchronize my *browser* bookmarks to pinboard, but I couldn't find
# an easy API for pulling bookmarks from Chrome, so I went via xmarks.
#######################################################
# Customize the following variables

XMARKS_RSS_FEED=http://share.xmarks.com/folder/rss/notmyrealcode
EMAIL_ADDR=yourname@example.com
PINBOARD_ID=YourPinboardUserName
PINBOARD_PASSWORD=YourPassword
SITE_NAME=pinboard.in
#SITE_NAME=del.icio.us.com

######## END Customize ###############################

THIS_SCRIPT=`basename $0`
TEMP_SCRIPT=/tmp/$THIS_SCRIPT.phase2.sh
DATA_DIR=~/.sync-xml2pin
XMARKS_FILE=sorted-xmarks.txt

if ! [ -r $DATA_DIR ] ; then mkdir $DATA_DIR ; fi

#######################################################
# Helper routine, for reading XML files.
#######################################################
read_xml () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}

#######################################################
#######################################################
fail () {
    printf "%s\n" "$1"
    exit 1
}

#######################################################
# Fetch xmarks bookmarks and convert them to a line-oriented format.
#######################################################
wget --user-agent="$EMAIL_ADDR" -O- -o /tmp/wget.log \
    $XMARKS_RSS_FEED |
    while read_xml ; do
        if [ "$ENTITY" != title ] ; then continue ; fi
        TITLE="$CONTENT"

        read_xml
        if [ "$ENTITY" != "/title" ] ; then fail "Fatal error in file structure. Expecting /title.  Found $ENTITY" ; fi

        read_xml
        if [ "$ENTITY" != link ] ; then fail "Fatal error in file structure. Expecting /title.  Found $ENTITY" ; fi
        LINK="$CONTENT"
        echo "TITLE='$TITLE'|LINK='$LINK'"

    done |
    sort -u > /tmp/$XMARKS_FILE

##########################################################################
if ! [ -r $DATA_DIR/$XMARKS_FILE ] ; then
    cp /tmp/$XMARKS_FILE $DATA_DIR
    echo "Current state of xmarks captured. Nothing pushed to $SITE_NAME this time."
    fail "If you wanted to push ALL your xmarks to pinboard instead, replace $DATA_DIR/$XMARKS_FILE with an empty file, and re-run."
fi

##########################################################################
# Use 'comm' to show lines that only exist in second file (xmarks).
# This ensures that we only deal in newly added xmarks.
#
# Use sed to alter those lines to be more useful for posting to pinboard.
# Write commands to insert new bookmarks to pinboard, into a shell script.
#
# "sort -u" is there to prevent adding the same bookmark more than once, 
# if it got added to the browser more than once. This is actually common, since
# I use FreshStart and frequently save sessions.
# If I attempt to re-add a bookmark, it replaces the old one, so duplicate adds
# just waste time; they don't create duplicates.
##########################################################################
comm -13 $DATA_DIR/$XMARKS_FILE /tmp/$XMARKS_FILE |
sort -u |
sed "
s/TITLE='/description=/
s/'|LINK='/\&url=/
s/'$//
s/ /%20/g
s/:/%3A/g
s|/|%2F|g
s/\?/%3F/g
s/&#34;/%22/g
s/&#160;/%20/g
s/'/%27/g
s/&#171;/%AB/g
s/&#187;/%BB/g
s/$/\&shared=no/
s/$/\&tags=xmarks_push/
" |
sed 's/"/%22/g' |
grep -v 'url=javascript' |
while read LINE ; do
  if [[ $LINE =~ http ]] ; then
    URL="https://${PINBOARD_ID}:${PINBOARD_PASSWORD}@api.pinboard.in/v1/posts/add?${LINE}"
    echo "wget --user-agent=\"${EMAIL_ADDR}\" -O- -a /tmp/wget.log --no-check-certificate '$URL' | grep 'result code=\"done\"' > /dev/null"
    echo "
      if [ \$? != 0 ] ; then
        echo 'FAILED:  $LINE' 
      else
        echo 'SUCCESS: $LINE' 
      fi
      sleep 2 "
  fi
done > $TEMP_SCRIPT
cp /tmp/$XMARKS_FILE $DATA_DIR/$XMARKS_FILE
</pre></code>
<p>
Piece of cake.  It isn't elegant.  There are definitely cases where I'll need to add additional sed edits.  But it gets the job done.
