{
  s = ""
  for(i = 1; i <= NF; i++) {
    s = sprintf("%s%s,", s, $i)
  }
  sub(",$", "", s)
  p = permutations(s)
  print length(p), 1
}

function permutations(s,   list, head, rest, result, i, j, k) {
  result = ""
  split(s, list, ",")
  for(i = 1; i <= length(list); i++) {
    head = list[i]
    rest = ""
    for(j = 1; j <= length(list); j++) {
      if(i != j) {
        rest = sprintf("%s%s,", rest, list[j])
      }
    }
    sub(",$", "", rest)
    if(length(rest) > 0) {
      split(permutations(rest), perms, ";")
      for(j = 1; j <= length(perms); j++) {
        split(perms[j], perm, ",")
        part = head
        for(k = 1; k <= length(perm); k++) {
          part = sprintf("%s,%s", part, perm[k])
        }
        result = sprintf("%s%s;", result, part)
      }
    } else {
      result = sprintf("%s%s;", result, head)
    }
  }
  sub(";$", "", result)
  return result
}
