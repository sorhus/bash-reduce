{
  for(i = 2; i <= NF; i++) {
    set[$i] = ""
  }
  result = ""
  for(e in set) {
    result = result e " "
    delete set[e]
  }
  sub(" $", "", result)
  print $1, result
}
