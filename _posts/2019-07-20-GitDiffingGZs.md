---
layout: post
title: git diffing gzipped files
# date element overrides date in title format.
tag:
  - git
---

Recently I found myself in a position where I wanted to diff a gzipped file across branches.
The default git behavior was not helpful. A few config tweaks and I was on my way.
<!--more-->

Here I have an example project with branches _master_ and _dev_.  
{% highlight bash %}
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ git branch
  dev
* master
{% endhighlight %}

You can see below that there is a compressed `foo.gz` file that differs across branches.
{% highlight bash %}
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ ls
foo.gz
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ gunzip --stdout foo.gz
Hello, World!
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ git checkout dev
Switched to branch 'dev'
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ gunzip --stdout foo.gz
Hello, Nick
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$
{% endhighlight %}

Now, I would like to get a line-by-line diff of the two files. However, `git diff` is
not giving me what I had hoped for. It only tells me that the files are different.
{% highlight bash %}
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ git diff master -- foo.gz
diff --git a/foo.gz b/foo.gz
index 155b5c0..0eedbc5 100644
Binary files a/foo.gz and b/foo.gz differ
{% endhighlight %}

To get the diffing behavior I want, it is up to me to define a new external diff driver. 
Use your favorite text editor to add an entry to your `~/.gitconfig` that looks like, 
{% highlight bash %}
[diff "gz"]
    binary = true
    textconv = gunzip --stdout
{% endhighlight %}  

The above block of text defines a diff driver, _gz_. The [_binary_][1] and [_textconv_][2] 
lines map directly to arguments you pass to `git diff`. 
The driver works on binary files and and applies `gunzip --stdout` as a conversion filter when doing the diff. 
Put succinctly, the driver decompresses our files before diffing.  

Great, we now have a driver we can use to diff our gzipped files. We should probably tell
git to use this driver when dealing with .gz files. An entry in [~/.gitattributes][3] will accomplish this.
{% highlight bash %}
*.gz diff=gz
{% endhighlight %}  
Lastly, if it is not already set, be sure git knows the location of your attributes file. Add the
following to your `~/.gitconfig` if needed.
{% highlight bash %}
[core]
    attributesfile = ~/.gitattributes
{% endhighlight %}

Now, let us try our diff again.
{% highlight bash %}
[~/Scratchpad/git_gz_diff]
nickphair@Nicks-MacBook-Pro:$ git diff master -- foo.gz
diff --git a/foo.gz b/foo.gz
index 155b5c0..0eedbc5 100644
--- a/foo.gz
+++ b/foo.gz
@@ -1 +1 @@
-Hello, World!
+Hello, Nick
{% endhighlight %}

Success!


[1]: https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---binary
[2]: https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---textconv
[3]: https://git-scm.com/docs/gitattributes
