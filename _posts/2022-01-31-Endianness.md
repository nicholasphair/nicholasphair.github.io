---
layout: post
title: Some notes on endianness
# date element overrides date in title format.
tag:
  - endianness
  - systems
  - os
---

# Endianness
I recently found that my ideas of endianness were conflated with bit significance
so I tried to straighten them out here. 

---


Simply put, [endianness is the order of bytes in a word][5]. The typical
context is in computer memory.  

Now, accessing memory is not the only place where you have to
reason about the order of bytes. Consider data you are reading off 
of the network or a wire. Just as in the case of memory, in order
to make any sense of the sequence of bytes, you must establish
the endianness of the data being consumed.  

| ![real_term](/assets/img/real_term.png) |
|:--:|
| <b>[RealTerm][6] Serial Program Endianness Setting</b>|  

<br/><br/>
You might care to know that different transmission protocols will 
define these things for you. For instance, the IP suite protocols
all use a big-endian format (though they call it [network-byte order][4]).  

At this point you might be wondering if we can take this endianness idea 
one level deeper and apply it to the order of bits in a byte. The
answer is yes, or at least, I see no reason it cannot be. If consuming
bit-by-bit off of a wire we absolutely have to know the most significant
bit to interpret the byte value. However, seldom are we working with
single bits. Far more likely is that the byte is our atomic unit. For that
reason you probably won't hear much about bit-endianness. 


## Bit Significance
I want to make mention of something that tripped me up when interpreting bit-endianness.

As mentioned above, one might point out that endianness is a bitwise problem
too. For example, given the binary number, `0b110`, must we not establish which
bit is significant to understand the value? The answer is of course we need to
know the most significant bit but this is a different problem. Endianness is
about interpreting a sequence or a stream of bytes. Here, is not a stream of
bytes or collection of bits in the same context. What we have here is a single
value. And the convention for interpreting values or establishing digit
significance is the same in every numerical base; the most significant digit is
first. For example:  

In binary:
```
0b110 = 1*2^2 + 1*2^1 + 0*2^0 = 4 + 2 + 0 = 6 (decimal)
```

In octal:
```
0o175 = 1*8^2 + 7*8^1 + 5*8^0 = 64 + 56 + 5 = 125 (decimal)
```

In decimal:
```
345 = 3*10^2 + 4*10^1 + 5*10^0 = 300 + 40 + 5 = 345
```

In hexadecimal:
```
0xFE3 = F*16^2 + E*16^1 + 3*16^0 = 15*16^2 + 14*16^1 + 3*16^0 = 3840 + 224 + 3 = 4067 (decimal)
```

It was tempting for me to reduce representations of a binary number to 
a sequence of bits, and indeed you could even almost square this with the
definition, but context is everything. The sort-of mathematical or 
conventional representation of a number has nothing to do with memory
or data transmission. As such, endiannesss does not apply.




[1]: https://stackoverflow.com/questions/16803397/can-endianness-refer-to-bits-order-in-a-byte
[2]: https://en.wikipedia.org/wiki/Endianness
[3]: https://www.ibm.com/docs/en/db2-for-zos/11?topic=data-endianness
[4]: https://www.rfc-editor.org/rfc/rfc1700
[5]: http://sites.fas.harvard.edu/~cscie287/spring2019/slides/Endianness.pdf
[6]: https://sourceforge.net/projects/realterm
