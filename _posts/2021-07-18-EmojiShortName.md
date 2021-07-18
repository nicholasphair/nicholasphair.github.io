---
layout: post
title: An emoji shortname extension for Sphinx
# date element overrides date in title format.
tag:
  - sphinx
  - python
---

I was building documentation at work the other day and found
Sphinx was not rendering emojis like I had hoped. I tried out the
[emojicode][1] extension but was limited by its [lack of support for Markdown][2]
and its [bar syntax][3].  

So, I wrote a new extension to work with both `Markdown` and `reStructuredText`.
The extension uses the familiar shortname sandwiched between colons syntax.  

You can fetch the `emoji-shortname` package from [PyPI][4] or view the source on [GitHub][5].  

---

Truthfully, this project was more of an exercise in Python tooling than anything
else. I learned a lot about packaging projects and the various PEPs that relate
to the task. I trust this experience will help me launch more packages in the future.



[1]: https://github.com/sphinx-contrib/emojicodes
[2]: https://github.com/sphinx-contrib/emojicodes/blob/v0.1.8/sphinxemoji/sphinxemoji.py#L20
[3]: https://github.com/sphinx-contrib/emojicodes/blob/v0.1.8/README.rst#usage
[4]: https://pypi.org/project/emoji-shortname/#description
[5]: https://github.com/nicholasphair/emoji-shortname


<style>
img {
  width: 100%;
  height: auto;
}
</style>
