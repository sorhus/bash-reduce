{
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z]", "", $i)
    $i = tolower($i)
  }
  for(i = 1; i <= NF; i++) {
    if($i == word) {
      $i = toupper($i)
      print
    }
  }
}
