---
categories: []
layout: post
title: Debugging JavaScript Problems in Internet Explorer
created: 1405022413
redirect_from: /content/debugging-javascript-problems-internet-explorer
---
I work in an environment where IE 8 is the norm.  Sometimes our web sites use JavaScript.  Sometimes they have problems.  Here are some notes on JS debugging in such an environment.

Attempt to duplicate the behavior in Firefox.  You still have to make it work in IE, but knowing whether the issue is due to a browser quirk or a flat-out bug in your code will help to guide your debugging strategy.

Sometimes the best approach is the oldest technique in the book.  Add code to show where the execution flow has gone.  Sprinkle lots of console.log calls in your code.  Start by putting one at the beginning and ending of every function, before and after every loop.  For example, if you have a function called i_am_broken, you might put as its first line:

        console.log("i_am_broken entry");

and as the last line put

        console.log("i_am_broken exit");

IE is broken, with regards to console functions.  If F12 Developer Tools is not open, the console object does not exist, and your code will throw errors when you access the console object.  To work around this, add the following code (from ):

    // Avoid `console` errors in browsers that lack a console.
    (function() {
        var method;
        var noop = function () {};
        var methods = [
            'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
            'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
            'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
            'timeStamp', 'trace', 'warn'
        ];
        var length = methods.length;
        var console = (window.console = window.console || {});
    
        while (length--) {
            method = methods[length];
    
            // Only stub undefined methods.
            if (!console[method]) {
                console[method] = noop;
            }
        }
    }());
