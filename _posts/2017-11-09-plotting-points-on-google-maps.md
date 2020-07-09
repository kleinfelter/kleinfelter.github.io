---
title: Plotting Two Kinds of Points on Google Maps
layout: post
---

(This story is an enhanced edition of [this story from my ham radio site](http://k4kpk.com/mapping-your-chasers).)

Suppose you have a set of names and addresses, and you'd like to display them on a [Google Map](http://maps.google.com). Further suppose that you have two kinds of items to display -- perhaps you're displaying members of your family and you'd like red markers for the girls and blue markers for the boys.  (It is a contrived example -- what can I say?)

The first thing you need is to create a text file with names and addresses.

* Column 1 should be Name.
* Column 2 should be Address. Enter street address, a comma, city name, a comma, state name.
* Column 3 should be Marker_Type.  Girls get "large_red".  Boys get "large_blue".

Separate your columns with TAB character.  I'll refer to this as a CSV file, but tab works better as a delimiter because you'll have commas in your data.  You really want the Address column to contain street address, city, and state, separated by commas.

Here's an example:

```
NAME    Address Marker_Type
Fred Smith      123 Maple St,Anytown,OH large_blue
Mary Smith      246 Oak St,Anytown,OH   large_red
Jane Smith      100 Park Place,New York,NY   large_red
```

Save the file on your computer.  (You could also store it on the web, but my example assumes it is stored locally.)

To load this data into Google Maps, we're going to use something Google calls Fusion Tables.  Navigate to drive.google.com.  (You'll have to sign up for a Google account, if you don't have one.)

* Choose New, then More, then Google Fusion Tables.
* Tell it you want to  load a file 'From this computer'.
* Select the data file you created (per above instructions).
* Import the data.  Importing goes pretty fast.
* Select 'Map of Address'.  The first time you do this, Google must geocode your addresses.  This is slow - about 1 second per address.
    * As this progresses, keep an eye on "Quality: 0% ambiguous".  If that 0 changes, it means Google had to guess where an address was.  For me, it guessed that Rome, GA was really Rome, Italy.  Bad guess.  I fixed that by putting street, city, and state into a SINGLE field, as mentioned above.  Google looks at only a SINGLE field for address.
* On the left side of the page, you'll see a "Configure map" panel.  Press the "Change feature styles" button.
* In the "Map marker icons" area, select the Column tab, to tell Google which column contains red/blue information.
* Select "Use icon specified in a column", select your Marker_Type column, and Save your update.
* When you're done, press the Done button.
* In the upper-right corner is a Share button.  I like to set my sharing option to "On - anyone with the link", but your needs may differ.
* Copy the URL from the "Link to share" field, press Done and save your changes.

Distribute the copied URL to people who you'd like to share with.
