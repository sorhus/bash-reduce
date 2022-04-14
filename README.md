## bash-reduce

A MapReduce framework written in awk, bash and GNU Parallel.
Implement map and reduce functions in pure awk and run them
using the framework. Tested with bash 4 and gawk 4.0.

You can find a short writeup [here](http://sorhus.github.io/2016/03/27/bash-reduce-part-1/).

### Run tests
```
~/src/bash-reduce/test$ ./run-all 
Running all tests

  * running test balanced-1: passed!
  * running test balanced-2: passed!
  * running test balanced-3: passed!
  * running test co-occurence: passed!
  * running test intersect: passed!
  * running test permutations: passed!
  * running test set: passed!
  * running test size: passed!
  * running test sum: passed!
  * running test word-count: passed!
  * running test word-length: passed!

All tests PASSED!
```

### Example use
##### Count words
```
$ ./bash-reduce mappers/word-count.awk reducers/sum.awk data/shakespeare | head
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

##### Get unique words
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

##### Grep for "hamlet" (only mapper needed)
```
$ awk -f mappers/grep.awk -v word=hamlet < data/shakespeare | head
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
