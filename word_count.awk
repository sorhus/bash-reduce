map='{
  for(i = 1; i <= NF; i++) { 
    gsub("[^A-Za-z]", "", $i)
    print tolower($i), 1
  } 
}'

reduce='{ 
  sum = 0
  for(i = 2; i <= NF; i++) {
    sum += $i
  }
  print $1, sum
}'
