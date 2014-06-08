#
# Grep map and reduce
#
# author anton.sorhus@gmail.com

map='
BEGIN {
  "od -tu4 -N4 -A n /dev/random" | getline;
  srand($0+0) 
} {
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z]", "", $i);
    $i = tolower($i)
  }
  for(i = 1; i <= NF; i++) {
    if($i == word) {
      a = (i - 5 < 1) ? 1 : i - 5
      b = (i + 5 > NF) ? NF : i + 5
      printf("%.10f ", rand())
      for(j = a; j < b; j++) {
        printf("%s_", $j)
      }
      printf("%s\n", $b)
    }
  }
}'

reduce='{
  n = split($2, words, "_")
  for(i = 1; i <= n; i++)
    printf("%s ", words[i])
  printf("\n")
}'

