{
  key = $1
  $1 = ""
  split($0, line, " ")
  asort(line)
  for(i = 2; i <= NF; i++) {
    $i = line[i - 1]
  }
  $1 = key
  print
}
