BEGIN {
  "od -tu4 -N4 -A n /dev/random" | getline
  srand($0+0)
} {
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z]", "", $i)
    $i = tolower($i)
  }
  for(i = 1; i <= NF; i++) {
    if($i == word) {
      $i = toupper($i)
      printf("%.10f %s\n", rand(), $0)
    }
  }
}
