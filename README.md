bash-reduce
===========

A MapReduce framework written in awk, bash and GNU Parallel.

Count words in complete works of Shakespeare:
```
$ ./bash-reduce -s mappers/words.awk reducers/sum.awk data/shakespeare | head
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

Get unique words in complete works of Shakespeare
```
./bash-reduce -s mappers/words.awk reducers/unique.awk data/shakespeare | head
1
a
aaron
aarons
abaissiez
abandon
abandond
abandoned
abase
abashd
```
