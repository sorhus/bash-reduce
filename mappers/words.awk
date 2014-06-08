{
  for(i = 1; i <= NF; i++) { 
    gsub("[^A-Za-z]", "", $i)
    print tolower($i), 1
  } 
}
