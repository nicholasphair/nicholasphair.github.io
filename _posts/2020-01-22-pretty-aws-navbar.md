---
layout: post
title: pretty-aws-navbar
# date element overrides date in title format.
tag:
  - aws
---
Prettify the AWS Console's Navigation Bar.
<!--more-->  

The other day I came across [AWS console regions color][1]. A Chrome/FireFox extension
that colors the top navigation bar based on the region you are in. The extension also adds 
the region code and appropriate country flag to the navigation bar. Cool, good work
author!  

Now, I like the idea of having a more informative navigation bar but,
my AWS interactions all tend to be in the same region. I would not get any lift from
this plugin. What's more, the source for the extension is not publicly available - 
at least not at the time of writing. This prevents me from tweaking the plugin for my usecase.
Further, it denies me an opportunity to skim through the codebase and make sure 
nothing fishy is happening. Now, this is in no way an accusation, just a motivation to go
and write my own flavor of the plugin. And that is what I did.  

[pretty-aws-navbar][2] is less than 100 lines of `js` that will color the AWS console's navigation
bar and conveniently display the appropriate region code next to the region name. I deploy the
script with [greasemonkey][3] but imagine any userscript manager will do the trick. Feel free
to inspect, use, and tweak the code however you see fit!


[1]: https://www.charon.org/extension.html
[2]: https://github.com/nicholasphair/pretty-aws-navbar
[3]: https://www.greasespot.net/
