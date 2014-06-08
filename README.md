bash-reduce
===========

A MapReduce framework written in awk, bash and GNU Parallel.

Count words in complete works of Shakespeare:
```
$ ./bash_reduce.sh -s word_count.awk sum.awk data/shakespeare | head
the 27825
and 26791
i 20681
to 19261
of 18289
a 14668
you 13716
my 12481
that 11135
in 11027
```
