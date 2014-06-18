{
  for(i = 1; i <= NF; i++) {
    gsub("[^A-Za-z0-9]", "", $i)
    print tolower($i), 1
  }
}
