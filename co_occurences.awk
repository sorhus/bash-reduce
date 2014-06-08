#
# Co-occurences map and reduce
#
# author anton.sorhus@gmail.com

map='{
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z]", "", $i);
    $i = tolower($i)
  }
  for(i = 1; i <= NF; i++) {
    for(j = 1; j <= NF; j++) {
      if(i == j)
        break 
      printf("%s_%s 1\n", $i, $j);
    }
  }
}'

reduce='{
  sum=0;
  for(i = 2; i <= NF; i++)
    sum = sum + $i;
  printf("%s %s\n", $1, sum)
}'

