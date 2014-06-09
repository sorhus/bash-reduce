{
  sum = 0
  for(i = 2; i <= NF; i++) {
    sum += $i
  }
  print $1, sum
}
