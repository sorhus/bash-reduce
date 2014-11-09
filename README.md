bash-reduce
===========

A MapReduce framework written in awk, bash and GNU Parallel.

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
./bash-reduce mappers/words.awk reducers/unique.awk data/shakespeare | head
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

Grep for "hamlet"
```
$ ./bash-reduce mappers/grep.awk reducers/grep.awk data/shakespeare "-v word=hamlet" | head
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
