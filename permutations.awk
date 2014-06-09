{
  print $0, permutations($0)
}

function permutations(s,     i, p, head, result) {
  if(length(s) == 1) {
    return s
  }
  for(i = 1; i <= length(s); i++) {
    head = substr(s, i, 1)
    p = permutations(substr(s, 1, i-1) substr(s, i+1))
    sub("^", head, p)
    gsub(",", "," head, p)
    sub("$", p ",", result)
  }
  sub(",$", "", result)
  return result
}
