{
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z]", "", $i)
    $i = tolower($i)
  }
  for(i = 1; i <= NF; i++) {
    for(j = 1; j <= NF; j++) {
      if(i == j) {
        continue
      }
      if($i < $j) {
        printf("%s:%s 1\n", $i, $j)
      }
    }
  }
}
