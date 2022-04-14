BEGIN {
  "od -tu4 -N4 -A n /dev/random" | getline
  srand($0+0)
}
{
  delete line
  key = $1
  for(i = 2; i <= NF; i++) {
    line[sprintf("%.20f", rand())] = $i
  }
  j = 2
  for(i in line) {
    $j = line[i]
    j++
  }
  $1 = key
  print
}
