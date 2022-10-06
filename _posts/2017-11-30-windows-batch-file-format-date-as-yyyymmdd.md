---
title: Windows Batch File Format Date as YYYY.MM.DD
layout: post
---

I often need a variable containing a yyyy.mm.dd date in a Windows batch file.  Instead of figuring it out anew each time, use this code:

```
REM --- Get current date into yyyy.mm.dd format.
REM
REM NOTE: You really must use the "if not defined" in order to skip the trailing blank line.

REM clear tmpDate
set tmpDate=

REM This gets the date in a locale-independent format.
REM e.g. 20171130101642.469000-300
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined tmpDate set tmpDate=%%x


REM Extract from tmpDate:
REM    position 0 for 4 chars
REM    position 4 for 2 chars
REM    position 6 for 2 chars
REM Adding "." between them
set YYYYMMDD=%tmpDate:~0,4%.%tmpDate:~4,2%.%tmpDate:~6,2%

echo YYYYMMDD is %YYYYMMDD%
```
