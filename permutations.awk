map='
{
  s = ""
  for(i = 1; i <= NF; i++)
  {
    s = sprintf("%s%s,", s, $i)
  }
  sub(",$", "", s)
  p = permutations(s)
  printf("%d 1\n", length(p))
}

function permutations(s,   list, head, rest, result, i, j, k)
{
  result = ""
  split(s, list, ",")
  for(i = 1; i <= length(list); i++)
  {
    head = list[i]
    rest = ""
    for(j = 1; j <= length(list); j++)
    {
      if(i != j)
      {
        rest = sprintf("%s%s,", rest, list[j])
      }
    }
    sub(",$", "", rest)
    if(length(rest) > 0)
    {
      split(permutations(rest), perms, ";")
      for(j = 1; j <= length(perms); j++)
      {
        split(perms[j], perm, ",")
        part = head
        for(k = 1; k <= length(perm); k++)
        {
          part = sprintf("%s,%s", part, perm[k])
        }
        result = sprintf("%s%s;", result, part)
      }
    }
    else
    {
      result = sprintf("%s%s;", result, head)
    }
  }
  sub(";$", "", result)
  return result
}
'

reduce='
{
  sum = 0
  for(i = 2; i <= NF; i++)
  {
    sum += $i
  }
  printf("%d %d\n", $1, sum)
}'
