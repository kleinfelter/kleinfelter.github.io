---
title: node.js TiddlyWiki to Joplin
---

## Migrating from TiddlyWiki to Joplin

I wanted to migrate my data from TiddlyWiki to Joplin.  This documents how I got there.  You will not like the results if you follow my steps exactly.  You may find this document helpful if you use it as a guide in creating your own migration process.

#### My Setup:

* I use the "anstosa" plugin for Markdown tiddler markup.  (David Alfonso's conversion uses the *official* Markdown plugin, not anstosa.  They implement Markdown subsets.)
* Most of my tiddlers are in Markdown.
* My wikis are all run via node.js on a Linux box. This is named "boxtop3".
* My Joplin target will run on a Macbook.
* I have about 2000 tiddlers.
* I have lots of wiki links (intra-TiddlyWiki links).  David's conversion does not deal with these, leaving broken links when imported into Joplin.  I fixed these with code (see below).
* I have two TiddlyWikis.  One is named PKB and the other DTL.

See this: https://davidalfonso.es/posts/migrating-from-tiddlywiki-to-markdown-files
and this: https://gitlab.com/davidalfonso/tiddlywiki-migrator/tree/master


#### WARNINGS:

* This process does not convert all legal Markdown.  To do that, you'd have to fully parse the source files.  The conversion does only string matching, so there are some edge cases where you have to just fix the source tiddlers to avoid.
* This process does not deal with multiple stories having the same name.  e.g. If you import TWO TiddlyWikis and each has a story called My Story, and there are wiki links to My Story, there's no telling which of the two My Story your links will point to in Joplin.  (This is not a problem for TiddlyWiki because wiki links point within the same wiki.  It is a problem for Joplin because wiki-links are within Joplin, not within notebook.)
    * After you load Joplin, you can use "DB Browser for SQLite" to run this query to report on your duplicates:

```
select title,  count(*) from notes group by title having count(*) > 1  
and title != "DefaultTiddlers"
and title != "MarkupPreHead"
and title != "PageTemplate"
```

#### Preparing to Convert

* (Optional:) Using TiddlyWiki in your browser, manually converted any remaining non-Markdown tiddlers to Markdown format.
    * This is a useful filter search to find Markdown tiddlers: `[!field:type[text/x-markdown]!prefix[$:]!tag[OkNotMd]]`
    * Except (You can tag these as OkNotMd):
        * AdvancedOptions
        * Configure Tiddler Subtitle
        * DefaultTiddlers
        * ... and similar tiddlers which contain code or TW options.
    * The manual conversion to Markdown works for one of my TW where most tiddlers are Markdown, but I have an older wiki using TiddlyWiki markup: 4 are type text/vnd.tiddlywiki; 755 are type text/x-tiddlywiki;  90 are text/x-markdown.
    * For the old wiki, I manually convert text/vnd.tiddlywiki to Markdown.
* I edited my tiddlers to remove all apostrophe and quote marks from tiddler titles.  Take my word for it. You want to do this.

#### Converting

* Download https://gitlab.com/davidalfonso/tiddlywiki-migrator/tree/master and unzip on your node.js server as ~/tiddlywiki-migrator
* using the TW save button, save PKB to temp and move it to ~/tiddlywiki-migrator/wiki.html
* Look in ~/tiddlywiki-migrator/node_modules/tiddlywiki/plugins/tiddlywiki/markdown/files/markdown.js
    * See (around line 395): `jsonml.unshift.apply( jsonml, this.processBlock( m[ 1 ], [] ) );`
    * That line is fragile about "------" (HR) in your tiddlers without a blank line before.  you might want to make the code near there look like this in order to find bad tiddlers so you can manually fix them.  See https://github.com/evilstreak/markdown-js/issues/17

```
      // if there's a leading abutting block, process it
      if ( m[ 1 ] ) {
        console.log('m1');
        console.log(m[1]);
        console.log('block');
        console.log(block);
        jsonml.unshift.apply( jsonml, this.processBlock( m[ 1 ], [] ) );
      }
```

* The work-around is to edit any offending tiddlers to ensure `-----` has a blank line before and after.
* I prefer my file names to match the Tiddler titles.  Edit scripts/safe-rename.js and make it look like this:

```
const fs = require('fs');
  
if (process.argv.length != 3) {
    console.log("Wrong parameters. Directory name expected.");
    process.exit(1);
}

const PATHNAME = process.argv[2].endsWith('/') ?
                 process.argv[2] : process.argv[2] + '/';

// List all filenames in dir received as argument
fs.readdir(PATHNAME, (err, files) => {
    if (err) throw err;
    files.forEach((filename) => {
        let newFilename = decodeURIComponent(filename);

        // Clean filename (CUSTOMIZE THIS)
        newFilename = newFilename
        // Remove accents/diacritics
        .normalize('NFD').replace(/[\u0300-\u036f]/g, "")
        // Convert separators to low line
        .replace(/\s+/g, '_')
        // Remove any non-safe character
        .replace(/[^0-9a-zA-Z-._]/g, "");

        fs.rename(PATHNAME + filename, PATHNAME + newFilename, (err) => {
            if (err) throw err;
        });
    });
});
```

* The original puts YAML front matter on the .md files, and Joplin cant handle it, so edit the Makefile and remove these lines:

    ```
    @echo "---" > "$@"
    @cat "$(^:html=meta)" >> "$@"
    @echo "---" >> "$@"
    ```

* Run: `make`
        * If it crashes on content, make sure evey Tiddler has valid syntax. (Using regular TW, open each tiddler without a JS crash.)
* `make convert`
    * Somebody escaped the brackets in `[[Title]]`
        * The pandoc output has it.
        * The exported html does not.
        * Ergo pandoc added it.
        * I cant find a way to make pandoc stop.
        * i checked and my tw do not contain `\[\` so it is safe to sed the Markdown.
    * Also, Yuck. Tiddlywiki output the html for triple backtick as `<code></code>backtick` both at the begining and at the end of the code block.  Sometimes. I think the standard Markdown plugin cannot deal with single backtick inline code.  Screw it. The MD converter plugin handles only Gruber MD, where triple backtick means something screwy.  I'm just going to copy the Markdown tiddlers (where they exist) from TW into the output folder.
    
* Put the following in ~/tiddlywiki-migrator/kpk-fixup.sh and run it.

```
# Rename files without the underscore so the names match the TW names
cd markdown_tiddlers
rename -v -e 's/_/ /g' *
cd ..

# For all the files created by the other guy's migration...
for f in markdown_tiddlers/*.md ; do

  # f2 = the node.js Tiddlywiki MARKDOWN file name
  f2="/data/tiddlywiki-sites/tw-node/pkb/tiddlers/`basename \"$f\"`"

  # Some older Tiddlers maybe got converted to Markdown, so they still have a .tid file type
  f3="${f2%%.md}.tid"
  
  # If TW has a .md file then use it.
  if [ -r "$f2" ] ; then
    echo cp "$f2" "$f"
    cp "$f2" "$f"
  else
    # if TW has no .md but it has a .tid, copy that IFF it is markdown format
    if [ -r "$f3" ] ; then
      echo "found $f3"
      if grep "type: text/x-markdown" "$f3" 1>/dev/null ; then
        echo "replace $f with $f3"
        
        # .tid files begin with metadata. The Markdown begins after a blank line.

        # Count how many lines to the first empty line
        var=`sed '/^$/q' "$f3" | wc -l`
        
        # Skip the empty line too
        var=$((var+1))
        tail -n +${var} "$f3" > "$f"
      fi
    fi
  fi
done
```

* Get the underscores converted to spaces in the file names, and zip up the files for transfer to Mac:

```
cd markdown_tiddlers
rename -v -e 's/_/ /g' *
cd ..
tar -czvf markdown_tiddlers.tgz markdown_tiddlers/
```

* On mac: `scp kevin@boxtop:~/tiddlywiki-migrator/markdown_tiddlers.tgz markdown_tiddlers.tgz`
* This is pretty good except internal links import as `[[Title]]` but Joplin insists on using `[Title](:/b9d7acbfa256439c8e92e018d0ebb1b7)` as internal links.

----

* Update the database to fix the internal links. You can't do this until after the import, because the GUID are not assigned until the files are imported.
* Database is in ~/.config/database.sqlite
* code is in /Users/kevin/Sync/code/python/joplin
* I'm using Python 3
* Run: `tw-to-joplin-links.py` (code is shown below)

```python

#!/usr/bin/env python
import re
import sqlite3

# Converts TiddlyWiki [[Link]] to Joplin's  [Link](:/GUID]

JOPLINDB = '~/.config/joplin-desktop/database.sqlite'

def no_commas(s):
    return s.replace(',', '')

# Some Titles look like Word%20With%20Spaces.
def decode_title(s):
    s2 = s.replace('%20', ' ')     # string.replace is a global replace-all-occurrences
    return s2

conn = sqlite3.connect(JOPLINDB)
c = conn.cursor()

c.execute("DELETE FROM notes where title = 'favicon.ico' or title = 'DefaultTiddlers' ")
c.execute("DELETE FROM notes where title = 'MarkupPreHead' or title = 'PageTemplate' ")

c.execute('SELECT title, id FROM notes')
rows = c.fetchall()
title_id = dict(rows)

# These may convert poorly. Mabe the [[foo]] is like this and should not be converted:  ```[[foo]]```
c.execute("SELECT id, body, title from notes where body like '%```%[[%```' order by title")
rows = c.fetchall()
for r in rows:
    print("WARNING:", r[2], "has [[ INSIDE ``` and may convert poorly")

# replacing [[AltTitle|Title]] with [AltTitle](:/ID)
c.execute("SELECT id, body, title FROM notes WHERE BODY LIKE '%[[%]]%' ORDER BY title")
rows = c.fetchall()

# Non-backtick, followed by [[blahblah]]
# This will fail to convert if the first 2 characters in the document are [[
reg1 = r"[^`]\[\[(.*?)\]\]"

for r in rows:
    matched1 = False
    body = r[1]
    my_title = r[2]
    print("Current story:", my_title)
    match = re.search(reg1, body)
    while match:
        print("Processing Markdown wiki link:", my_title)
        matched1 = True
        m = match.group(1)
        m2=re.search(r"(.+)\|(.+)",m)  # This one should be greedy because m contains only the content between [ ond ]
        if m2:
            # [alt_title|real_title]
            alt_title = m2.group(1)
            title = decode_title(m2.group(2))
            print("DEBUG processing alternate name wiki link. visible name=", alt_title, "internal name=", title)
        else:
            # [real_title]
            title = m
            alt_title = decode_title(title)

        #print("DEBUG lookup ID for title", title)
        if no_commas(title) in title_id:
            guid = title_id[no_commas(title)]
        else:
            guid = "LINK_TARGET_MISSING"
            print("WARNING:", my_title, "has a wiki link to missing document", title )

        # replace match.group(0) in r with [alt_title](:/GUID-of-title)
        s = match.group(0)[0]  # The 1-character not-backtick before the [
        newstring = s + "[" + alt_title + "](:/" + guid + ")"
        body = body.replace(match.group(0), newstring , 1)
        print("DEBUG replaced", match.group(0), "with", newstring)
        match = re.search(reg1, body)

    if matched1:
        escaped_body = body.replace("'", r"''")
        cmd = "UPDATE notes SET body = '" + escaped_body + "' WHERE id = '" + r[0] + "'"
        c.execute(cmd)

# replacing [Title](#Blah%20Blah) [Title](:/ID)
# You get these when the other guy's code exports tiddlywiki classic wiki links.
c.execute("SELECT id, body, title FROM notes WHERE BODY LIKE '%[%](#%)%' ORDER BY title")
rows = c.fetchall()

# Not backtick, followed by...
# This will fail if the first characters in the document are [
reg1 = r"[^`]\[.+?\]\(#(.+?)\)"

for r in rows:
    matched1 = False
    body = r[1]
    my_title = r[2]
    print("Current story:", my_title)
    match = re.search(reg1, body)
    while match:
        print("Processing TW wiki link:", my_title)
        matched1 = True
        m = match.group(1)

        title = decode_title(m)

        #print("DEBUG lookup ID for title", title)
        if no_commas(title) in title_id:
            guid = title_id[no_commas(title)]
        else:
            guid = ""


        # replace match.group(0) in r with [alt_title](:/GUID-of-title)
        # The other guy's export forces CamelCase wiki links, even if not enabled in TW.
        # That leads to a lot of link-not-found.  Just remove the hyperlink if link-not-found.
        s = match.group(0)[0]  # The 1-character not-backtick before the [
        newstring = s + "[" + title + "](:/" + guid + ")"
        if guid == "":
            body = body.replace(match.group(0), s + title)
            print("DEBUG replaced", match.group(0), "with", s + title)
        else:
            body = body.replace(match.group(0), newstring , 1)
            print("DEBUG replaced", match.group(0), "with", newstring)


        match = re.search(reg1, body)

    if matched1:
        escaped_body = body.replace("'", r"''")
        cmd = "UPDATE notes SET body = '" + escaped_body + "' WHERE id = '" + r[0] + "'"
        c.execute(cmd)


conn.commit()
conn.close()

print("FINISHED")
```

Done.

## Short, Step-by-step - After You Did All the Setup


#### On Mac:

1. Save DTL as ~/temp/dtl.html
1. Save PKB as ~/temp/pkb.html

```
if [ `uname` = Darwin ] ; then
  cd ~/temp
  scp dtl.html kevin@boxtop3.home:dtl.html
  scp pkb.html kevin@boxtop3.home:pkb.html
fi
```

#### On boxtop3, from ~/tiddlywiki-migrator:

First - BOXTOP BOXTOP BOXTOP!

```
if [ `uname` = Linux ] ; then
  cd ~/tiddlywiki-migrator
  cp ../dtl.html wiki.html
  rm -rf tmp_wiki markdown_tiddlers
  make
  make convert
  ./kpk-fixup.sh
fi
```

Second

```
if [ `uname` = Linux ] ; then
  cd markdown_tiddlers
  rename -v -e 's/_/ /g' *
  cd ..
  tar -czf dtl_tiddlers.tgz markdown_tiddlers/
fi
```

Third

```
if [ `uname` = Linux ] ; then
  cp ../pkb.html wiki.html
  rm -rf tmp_wiki markdown_tiddlers
  make
  make convert
  ./kpk-fixup.sh
  tar -czf pkb_tiddlers.tgz markdown_tiddlers/
fi
```

#### On Mac, from ~/temp:

```
if [ `uname` = Darwin ] ; then
  rm -rf dtl_tiddlers  pkb_tiddlers dtl_tiddlers.tgz  pkb_tiddlers.tgz
  scp kevin@boxtop3.home:~/tiddlywiki-migrator/dtl_tiddlers.tgz dtl_tiddlers.tgz
  scp kevin@boxtop3.home:~/tiddlywiki-migrator/pkb_tiddlers.tgz pkb_tiddlers.tgz
fi
```

```
if [ `uname` = Darwin ] ; then
  tar zxvf dtl_tiddlers.tgz
  mv markdown_tiddlers dtl_tiddlers
  tar zxvf pkb_tiddlers.tgz
  mv markdown_tiddlers pkb_tiddlers
fi
```

1. Using Joplin, import dtl_tiddlers
1. Using Joplin, import pkb_tiddlers
1. Run on Mac, from /Users/kevin/Sync/code/python/joplin: 
    1. `. python-chooser`
    1. `tw-to-joplin-links.py`
    
* And check your results in Joplin:
    * Check some general page layouts in DTL
    * Check some wiki links in DTL
    * Check some general page layouts in PKB
    * Check some wiki links in PKB