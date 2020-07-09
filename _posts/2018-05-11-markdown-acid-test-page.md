---
title: Markdown Acid Test Page
---

These are the Markdown forms I use:

## Escape Character

``` markdown
Backslash \*prevents\* these asterisks from causing formatting.  Backslash is the \`escape\` character.
```

Backslash \*prevents\* these asterisks from causing formatting.  Backslash is the \`escape\` character.

-----

## Bare URL Auto-linking

``` markdown
Bare URLs are auto-linked by only some parsers.  http://example.com
```

Bare URLs are auto-linked by only some parsers.  http://example.com

-----

## Basic text styling

``` markdown
regular text, **bold** text, *italic* text, `code` text
```

regular text, **bold** text, *italic* text, `code` text

-----

## Unordered List

``` markdown
* Unordered List
    * With nesting
    * Always use 4 spaces per indent
        - Can also use hyphen instead of asterisk
        - Like this
* Some parsers work with other spacing, but all work with 4
```

* Unordered List
    * With nesting
    * Always use 4 spaces per indent
        - Can also use hyphen instead of asterisk
        - Like this
* Some parsers work with other spacing, but all work with 4

-----

## Ordered List

``` markdown
1. Ordered List
    1. With nesting
    1. Always use 4 spaces per indent
1. Some parsers work with other spacing, but all work with 4
2. Try to keep your numbers sequential, but it isn't really necessary
````

1. Ordered List
    1. With nesting
    1. Always use 4 spaces per indent
1. Some parsers work with other spacing, but all work with 4
2. Try to keep your numbers sequential, but it isn't really necessary

-----

## ATX Headers

``` markdown
# Header Level 1 - document title

Although you can follow the header immediately with text, it is safest to wrap it with blank lines.  Must put blank line BEFORE any header.  Must separate the # from the text with a space.  They do not necessarily proceed from largest to smallest. (e.g. Jekyll renders level 1 as smaller, red text, when compared with level 2.)

## Header Level 2 - Chapter/Section title

Text goes here.

### Header Level 3 - Not yet defined

Text goes here.

#### Header Level 4 - Not yet defined

Text goes here.

##### Header Level 5 - Not yet defined

Text goes here.

###### Header Level 6 - Not yet defined.  This is the lowest level supported.

Text goes here.
```

# Header Level 1 - document title

Although you can follow the header immediately with text, it is safest to wrap it with blank lines.  Must put blank line BEFORE any header.  Must separate the # from the text with a space.

## Header Level 2 - Chapter/Section title

Text goes here. Don't skip levels. Must put blank line before a title line, but not needed after.  This form is called "atx."  Don't use setext (which underlines titles with dashes or equal signs, because it only goes to two levels of header.

### Header Level 3 - Not yet defined

Text goes here.

#### Header Level 4 - Not yet defined

Text goes here.

##### Header Level 5 - Not yet defined

Text goes here.

###### Header Level 6 - Not yet defined.  This is the lowest level supported.

Text goes here.

-----

## Block Quote

Note that there can be 0-3 spaces before the ">".  It doesn't change behavior.

```markdown
ordinary text

  > These lines will get joined into one block quoted line by SOME dialects but not all.
  > block quote line 1.
  > block quote line 2.

ordinary text
```

ordinary text

> These lines will get joined into one block quoted line by SOME dialects but not all.
> block quote line 1
> block quote line 2

ordinary text

-----

## Preformatted Text

``` markdown

    preformatted text
    is rendered in fixed-width font
    and retaining your line breaks
    if you begin the line with four spaces.
    two spaces works with only some parsers.
    you may need to wrap with blank lines for some parsers.

```

    preformatted text
    is rendered in fixed-width font
    and retaining your line breaks
    if you begin the line with four spaces.
    two spaces works with only some parsers.
    you may need to wrap with blank lines for some parsers.

-----

## Fenced Code Block

~~~ markdown
```
Desired form.
fenced code block line 1
fenced code block line 2
Use backticks, where possible.  They are more portable than tilde fences.
```
~~~

```
Desired form.
fenced code block line 1
fenced code block line 2
Use backticks, where possible.  They are more portable than tilde fences.
```

-----

## Fenced Code Block (Alternate Form)

``` markdown
~~~
Alternate form, to be avoided where possible.
fenced code block line 1
fenced code block line 2
Use backticks, where possible.  They are more portable than tilde fences.
~~~
```

~~~
Alternate form, to be avoided where possible.
fenced code block line 1
fenced code block line 2
Use backticks, where possible.  They are more portable than tilde fences.
~~~

-----

## Fenced Code Block With Language Specifier

~~~ markdown
``` javascript
Desired form.
fenced code block with language name line 1
fenced code block with language name line 2
Use backticks, where possible.  They are more portable than tilde fences.
Be sure to put a space between the markers and the language name.
```
~~~

``` javascript
Desired form.
fenced code block with language name line 1
fenced code block with language name line 2
Use backticks, where possible.  They are more portable than tilde fences.
Be sure to put a space between the markers and the language name.
```

-----

## Fenced Code Block With Language Specifier (Alternate Form)

``` markdown
~~~ javascript
Alternate form, to be avoided where possible.
fenced code block with language name line 1
fenced code block with language name line 2
Use backticks, where possible.  They are more portable than tilde fences.
Be sure to put a space between the markers and the language name.
~~~
```

~~~ javascript
Alternate form, to be avoided where possible.
fenced code block with language name line 1
fenced code block with language name line 2
Use backticks, where possible.  They are more portable than tilde fences.
Be sure to put a space between the markers and the language name.
~~~

-----

## Horizonal Rule

``` markdown
horizontal rule below.
3 dashes is sufficient.  I use 5 dashes because I think it reads better.  Wrap with blank line above and below.

-----

and

---

horizontal rule above.
```

horizontal rule below.
Use 3-5 dashes.  Wrap with blank line above and below.

-----

and

---

horizontal rule above.

-----


## Hyperlinks

``` markdown
[human link description](http://example.com "optional flyover title")
```

[human link description](http://example.com "optional flyover title")

-----

## Image Links

``` markdown
![image alt descsription](https://www.w3schools.com/images/colorpicker.png "optional flyover title")
```

![image alt descsription](https://www.w3schools.com/images/colorpicker.png "optional flyover title")

-----

## Mathematical Fomulae - LaTeX / MathJax / KaTeX

``` markdown
LaTeX / MathJax / KaTeX support varies.  If you need it, use it.  Wrap it with $$.

$$\displaystyle f(x) = \int_{-\infty}^\infty\hat f(\xi)\,e^{2 \pi i \xi x}\,d\xi$$

```

MathJax / KaTeX support varies.  If you need it, use it.  Wrap it with `$$`. There should be a formula after this line.

$$\displaystyle f(x) = \int_{-\infty}^\infty\hat f(\xi)\,e^{2 \pi i \xi x}\,d\xi$$

There should be a formula before this line.

-----

## YAML Front-matter

YAML front matter.  For maximum portability, wrap YAML front matter with  `---` lines, and follow the ending `---` with a blank line.  If you create front-matter manually, append two spaces to the end of each line.  This reportedly causes plain-old Markdown parsers to render it all as unformatted text, rather than trying to process it as Markdown.

``` markdown
---  
title:      Too Much "Security"  
framistat:  Boojum  
---  

Normal text here.
```

----- 

## Tables

Tables:

``` markdown
| Left-aligned | Center-aligned | Right-aligned |
| :---         |     :---:      |          ---: |
| git status   | git status     | git status    |
| git diff     | git diff       | git diff      |
```

| Left-aligned | Center-aligned | Right-aligned |
| :---         |     :---:      |          ---: |
| git status   | git status     | git status    |
| git diff     | git diff       | git diff      |

Notes:
* Typora has a nice table editor.

## Do not use:

*  ~~strikethrough~~ is not universally accepted.