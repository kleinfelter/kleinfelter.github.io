---
title: Markdown Toolset
---

**Summary**: GitHub Flavored Markdown, kramdown, Marked 2, Typora

I've been using a hodgepodge of Markdown tools.  I'd like to try and make sense of what I'm using and why.

I'm using Jekyll and GitHub pages (GHP) for my blogs.  Jekyll and GHP use the kramdown parser.  Per GitHub: "GitHub Pages only supports kramdown as a Markdown processor" and "we've enabled kramdown's GitHub-flavored Markdown support by default."

See:

* https://help.github.com/articles/configuring-jekyll/
* https://kramdown.gettalong.org/parser/gfm.html

So the question of which Markdown flavor to use is either:

* GFM
* kramdown

For now, unless I encounter a compelling reason to use native kramdown, I'm using GFM because it is the default on GHP and on GitHub issues.

Other than my blogs,*I*  am the chief consumer of my Markdown documents.  I do more *reading* that *authoring*.  Consequently, I'm less interested in side-by-side (source + rendered) tools than many Markdown fans.  I mostly want WYSIWYG editing -- a simple WordPad-like (or TextEdit-like) experience for rich text documents.  For documents with lots of embedded images or documents where I need precise page layout, I don't use Markdown.

### Mandatory Markdown Features ###

* Core Markdown
* Tables (with some kind of table editor - not just source editing of pipes and spaces)
* MathJax
* YAML front matter.  Either ignore it, or give me some way to view/edit it.  

### Summary of Current Tools ###

* **Github Flavored Markdown**: Rationalle explained above. 
* **GitHub Pages - Blog publishing**:  I moved to GHP after my dynamic web site was compromised, and I decided I wanted simple, secure blog hosting.
* **Jekyll - Local blog preview**: Since I publish with GHP (which uses Jekyll), I preview locally with Jekyll.
* **Markdown Parser: kramdown**.  It is what Jekyll uses.
* **Marked 2 - Document viewer** (Mac only): A first-rate Markdown renderer. It supports the use of custom Markdown parsers.  Natively, it supports Discount for GFM.  Someday, I'll get around to configuring it to use kramdown plus options to make it totally GHP-compatible.
* **Typora - WYSIWYG Editor**: I really want a single-pane GUI editor.  I prefer one that works on Windows and Mac.  The primary candidates are Texts.io and Typora.  Texts is "based on Pandoc".  Typora clearly states that it supports GFM.  I prefer the non-ambiguous flavor.  Texts rewrites perfectly good hand-edited Markdown.  Typora less so.  I prefer the "full GUI" approach of Texts, but the you-type-Markdown-you-get-WYSIWYG approach of Typora isn't so bad, and it still leaves me *viewing* a single-pane rendered document.  Texts and Typora are both available for Windows and Mac.  Typora also supports Linux.  I use all three.  (Mac is my primary OS.)
* **none - side-by-side editor**: I think there may be cases where I really want side-by-side editing (although I haven't encountered them yet).  
    * Haroopad and MacDown look feasible on the Mac, except see Haroopad YAML problem.  Haroopad also supports Windows.  
    * I've seen some non-Haroopad sites say that Haroopad supports GFM and MathJax.  MacDown can be configured to support GFM per https://macdown.uranusjr.com/faq/#gfm , and MacDown supports MathJax.  
    * Another candidate is Atom. (markdown-preview-kramdown plugin just doesn't work right!)  I already use Atom for Clojure development.  
    * This is an online option: https://kramdown.herokuapp.com/
    * IF I decide I need this, MacDown looks best.


### YAML ###

* In YAML front matter, if you need a comment, use space-#.  If you begin a line with a #, most tools treats that as a title, even in front matter.
* Marked 2 allows you to strip front matter before rendering.  [good]
* Typora put front matter in a gray box and uses typewriter font. [best]
* MacDown has a "Detect Jekyll front-matter" option, and puts it in a table. [OK]
* Haroopad treats front matter as Markdown. [unacceptable]
* kramdown.herokuapp.com - treats front matter as Markdown. [unacceptable]

### Hacks ###

* kramdown.herokuapp.com seems to require a blank line between a title and a bullet list.  This is reportedly common. My other tools render this as desired.  I need to *remember* to add the blank line after the title.
* Consider using lint - https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md#md013---line-length
* Write portable Markdown - http://brettterpstra.com/2015/08/24/write-better-markdown/
    * Use an empty line:
        * after headlines
        * between paragraphs
        * before/after code/verbatim blocks
    * Use spaces after list markers \*, \-, \+, \1
    * Use a space after the header marker \# or \#\# or \#\#\#
    * Don't put blank lines in your lists.  It is ambiguous as to whether that starts a new list.
    * You can use blank lines above paragraphs within lists. Just follow the last paragraph immediately with another list item (or the end of the list). e.g.

```
* list item 1

    paragraph in list item 1
* list item 2
```

    * Empty lines in block quotes are handled differently between flavors as well. The most common way to make a multi-paragraph block quote is to use a greater than symbol on each blank line:

```
> paragraph one
>
> paragraph two
>> nested paragraph
>>
>> nested paragraph two
```

    * Use ATX Headers (i.e. hashmarks).
    * four-space indentation is recognized across the board; when creating nested lists, always use four spaces instead of two.
    * For code blocks, use \`\`\` and not \~\~\~ because they are more universal
    *