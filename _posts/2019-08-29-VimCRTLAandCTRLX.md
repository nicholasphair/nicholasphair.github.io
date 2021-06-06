---
layout: post
title: CTRL-{A,X} in Vim
# date element overrides date in title format.
tag:
  - vim
---
Turns out that CTRL-A and CTRL-X are actually useful.
<!--more-->  

A little while ago I learned about the CTRL-A and CTRL-X commands in vim.
If you are not familiar, CTRL-A is used to increment the first number after
the cursor while CTRL-X is used to decrement.

![](/assets/gif/2019-08-29_blog_inc_dec.gif)

I thought this was neat and filed it away as a fun party trick
(yes, I am a blast at parties).

After using it only sparingly since learning, it finally dawned
on me where this command could shine... MACROS!

![](/assets/gif/2019-08-29_blog_inc_dec_macro.gif)

Above you can watch me yank a line, put the line, and then increment the integer.
Those three actions are recorded as a macro into register `w`. We replay them a
number of times to build up a list from 1 to 10.

Of course, if I had just RTFM I would have come across this...
{% highlight bash %}
The CTRL-A command is very useful in a macro.
Example: Use the following steps to make a numbered list.
{% endhighlight %}

Sigh... Oh well. While we are here, what else can we learn from the docs?
Poking around a bit more, I came across this little bit.

{% highlight text %}
:help CTRL_A
...
							*v_g_CTRL-A*  
{Visual}g CTRL-A	Add [count] to the 
                number or alphabetic character 
                in the highlighted text. 
                If several lines are 
                highlighted, each one will 
                be incremented by an 
                additional [count] 
                (so effectively 
                creating a [count] incrementing 
                sequence).  
            		For Example, if you 
                have this list of numbers:  
                 1. ~
                 1. ~
                 1. ~
                 1. ~  
                Move to the second "1." 
                and Visually select three
                lines, pressing g CTRL-A 
                results in:
                 1. ~
                 2. ~
                 3. ~
                 4. ~
{% endhighlight %}


And in action...
![](/assets/gif/2019-08-29_blog_inc_visual.gif)

Awesome. Now go show off your vim-foo!

<style>
img {
  width: 100%;
  height: auto;
}
</style>
