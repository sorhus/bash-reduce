{
  if($1 == key) {
    $1 = ""
    printf $0
  } else { 
    if(NR > 1) {
      print ""
    }
    printf $0
    key = $1
  }
} END {
  print ""
}
