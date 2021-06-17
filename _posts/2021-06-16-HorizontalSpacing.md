---
layout: post
title: Some thoughts on horizontal spacing
tag:
  - horizontal padding
  - clean code
---

One of the open-source projects I work on has a strong preference for
horizontal spacing. Config files are written to have nicely aligned columns. 

```
fields = [
  { name = "event_id"       , type = "String" , index = false             }
  { name = "dtg"            , type = "Date"   , index = false             }
  { name = "geom"           , type = "Point"  , index = true, srid = 4326 }
  { name = "attacktype"     , type = "String" , index = false             }
  { name = "target"         , type = "String" , index = false             }
  { name = "perpgroup"      , type = "String" , index = false             }
  { name = "weapontype"     , type = "String" , index = false             }
  { name = "killed"         , type = "Integer", index = false             }
  { name = "injured"        , type = "Integer", index = false             }
  { name = "propertydamage" , type = "Double" , index = false             }
]
``` 


Much has been written about the flaws of this style (See Uncle Bob's [Clean
Code][1]) and in my experience developers acknowledge that files formatted in
this way are a pain to maintain.  So, why do we still see it? The overwhelming
reason I have been given is that, "they are just so readable". And that is the
point I want to counter. My contention is that this formatting helps
_lookability_, but does nothing for readability. 

In English you read left-to-right. The consequence of horizontal padding is
columns that catch your eye and leave you reading up and down, scanning a
document in an unnatural way. Perhaps you can get past this. In that case, is
there something to be gained by reading column-wise? Unfortunately, not. To see
what I mean, transpose the array above and read it left-to-right. The result of
this exercise is the same as reading column-wise.

```
name = "event_id", name = "dtg", name = "geom", name = "attacktype", ...
type = "String", type = "Date", type = "Point", type = "String", ...
index = false, index = false, index = true, index = false, ...
```

These lines are meaningless. Keeping, for instance, a list of types in your
head does nothing for your understanding of the file.  

Instead, prefer groupings that are natural and enhance your understanding of
the file. With that comes readability.


```
fields = [
  {
    name = "event_id",
    type = "String",
    index = false
  }
  {
    name = "dtg", 
    type = "Date",
    index = false
  }
  { name = "geom",
    type = "Point",
    index = true,
    srid = 4326 
  }
  {
    name = "attacktype", 
    type = "String",
    index = false
  }
  {
    name = "target", 
    type = "String",
    index = false
  }
  {
    name = "perpgroup", 
    type = "String",
    index = false
  }
  {
    name = "weapontype", 
    type = "String",
    index = false
  }
  {
    name = "killed", 
    type = "Integer",
    ndex = false
  }
  {
    name = "injured", 
    type = "Integer",
    ndex = false
  }
  {
    name = "propertydamage", 
    type = "Double",
    index = false
  }
]
```



[1]: https://www.oreilly.com/library/view/clean-code-a/9780136083238/
