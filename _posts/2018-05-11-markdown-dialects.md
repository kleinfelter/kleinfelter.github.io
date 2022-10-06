---
title: Markdown Dialects
layout: post
---

Markdown is a vague concept, not a specific markup language.  That's a problem for long-life content.  If your Markdown parser of choice reaches end-of-life, your content may render poorly in its successor.

Here are the parsers/apps that matter to me, and the markup which appears portable among them.  I'm going to try to limit my Markdown authoring to that which works in these dialects.  Note that "works" doesn't mean "identical output."  It just means that the output looks adequate, given the input.

In general, I have standardized on a subset of Github Flavored Markdown (GFM).

Note that some conversion among Markdown dialects may be accomplished via pandoc: https://github.com/jgm/pandoc/wiki/Pandoc-Tricks

Matters to me:

* GFM (claimed)
    * Marked 2, Discount - Mac Markdown viewing app, using built-in "Discount (GFM)" parser
    * Github - a real page at github.com
    * Typora, Mac
    * Typora, Win
    * Typora, Linux
    * Jekyll, local - as rendered locally
    * Jekyll, github - as rendered when pushed to Github Pages
    * pandoc - as processed by pandoc -s --katex --metadata pagetitle="BLAH" -f gfm input-file.md  -o output-file.html
    * Tiddlywiki, anstosa - (using anstosa markdown plugin)
    * Chrome GFM Plugin - https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?hl=en
* Commonmark
    *  Markdown-it - [As tested here with strict flag](https://markdown-it.github.io/)
* MultiMarkdown
    * Marked 2, MMD - Mac Markdown viewing app, using built-in MultiMarkdown parser

I'm clearly not going to take the time to thoroughly compare all of those.  Here's my short list:

* Marked 2, Discount - this is my 'reference' implementation
* Marked 2 MultiMarkdown
* Typora, Mac
* Jekyll, github
* Tiddlywiki, anstosa
* Commonmark

For my [Markdown Acid Test Page](/markdown-acid-test-page), here's what works for my short-list parsers:

Summary: Use any of my listed markup except:

* Don't count on auto-linking.
* Don't count on blockquote preserving newlines.
* YAML front-matter doesn't work in Tiddlywiki or Commonmark.
* Tables don't work in Commonmark.


|                                              | Marked2, Disc | Marked2, MMD | Typora, Mac | Jekyll, Github | Tiddlywiki, anstosa | Common-mark |
| -------------------------------------------- | :-----------: | :----------: | :---------: | :------------: | :-----------------: | :---------: |
| Escape char                                  |       Y       |      Y       |      Y      |       Y        |      sometimes      |      Y      |
| Auto-linking                                 |     **N**     |    **N**     |      Y      |     **N**      |          Y          |    **N**    |
| Basic text styling                           |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Unordered list                               |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Ordered List                                 |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| ATX Headers                                  |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Block Quote, newlines preserved              |      Y,Y      |     Y,Y      |     Y,Y     |    Y,**N**     |       Y,**N**       |   Y,**N**   |
| Preformatted Text                            |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Fenced Code Block, both forms                |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Fenced Code Block w/Lang, both forms         |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Horizontal Rule                              |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Hyperlinks                                   |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Image Links                                  |       Y       |      Y       |      Y      |       Y        |          Y          |      Y      |
| Math                                         |       Y       |      Y       |      Y      |       Y        |          Y          |      N      |
| YAML Front-matter recognized OR not rendered |       Y       |      Y       |      Y      |       Y        |        **N**        |    **N**    |
| Tables                                       |       Y       |      Y       |      Y      |       Y        |          Y          |    **N**    |
