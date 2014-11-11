 {
  for(i = 2; i <= NF; i++) {
    set[$i] = ""
  }
  n = asorti(set, sorted)
  for(i = 1; i <= n; i++) {
    $(i+1) = sorted[i]
  }
  delete set
  NF = n+1
  print
}
