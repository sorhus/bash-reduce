bash-reduce
===========

A MapReduce framework written in awk, bash and GNU Parallel.
Implement map and reduce functions in pure awk and run them
using the framework. There is also support for unit tests.

Count words
```
$ ./bash-reduce mappers/words.awk reducers/sum.awk data/shakespeare | head
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

Get unique words
```
./bash-reduce mappers/word-count.awk reducers/key.awk data/shakespeare | tail
zenith
zephyrs
zipped
zir
zo
zodiac
zodiacs
zone
zounds
zwaggerd
```

Grep for "hamlet"
```
$ ./bash-reduce -v word=hamlet mappers/grep.awk reducers/grep.awk data/shakespeare | head
 and bring these gentlemen where HAMLET is
 and what so poor a man as HAMLET is
 as to give words or talk with the lord HAMLET
 bear HAMLET like a soldier to the stage
 but now my cousin HAMLET and my son
 change rapiers and HAMLET wounds laertes
 dard to the combat in which our valiant HAMLET
 did HAMLET so envenom with his envy
 enter ghost and HAMLET
 enter HAMLET
```
