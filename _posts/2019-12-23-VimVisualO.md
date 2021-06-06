---
layout: post
title: vim visual mode learnings
# date element overrides date in title format.
tag:
  - vim
---
There is always something new to learn in VIM. That is part of the fun. 
Today, I share two features I recently discovered.
<!--more-->  

First, `o` in visual mode.  

To motivate this move, imagine a situation that I sometimes find myself in. 
I have just written a block of code and decide that its current spot is no good. 
Perhaps, I want to extract it into its own method. So I hop into visual mode, 
hit `j` a few times, and just before I smack that `d` key I realize I started
one line too late. Ugh. I hit escape, move to the correct starting point this 
time, and repeat. As it turns out, I didn't have to totally scrap my visual 
selection to grab the line I wanted. When you have a block of text selected 
you can press the `o` key to toggle between the top and bottom of the selection. 
This works in visual block mode as well.

![](/assets/gif/12-23-19_blog_vim_visual_o.gif)


The other tidbit I have to share with you comes from the grab bag of commands in VIM's g
family. The command is `gv`. From the vimdocs:

<pre style="color:#000000;background:#ffffff;">gv                      Start Visual mode with the same area 
                        as the previous area and the same 
                        mode<span style="color:#808030; ">.</span>
                        In Visual mode the current and the 
                        previous Visual area are exchanged<span style="color:#808030; ">.</span>
                        After using <span style="color:#800000; ">"</span><span style="color:#0000e6; ">p</span><span style="color:#800000; ">"</span> or <span style="color:#800000; ">"</span><span style="color:#0000e6; ">P</span><span style="color:#800000; ">"</span> in Visual mode
                        the text that was put will be 
                        selected<span style="color:#808030; ">.</span>
</pre>



Put succinctly, press `gv` to reselect your last visual selection.

![](/assets/gif/12-23-19_blog_vim_gv.gif)

Happy VIMing!


<style>
img {
  width: 100%;
  height: auto;
}
</style>
