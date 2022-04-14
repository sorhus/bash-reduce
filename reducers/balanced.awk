{
  count = 0
  for(i = 1; i <= NF; i++) {
    split($i, t, "_")
    count += t[2]
    if(count < 0) {
      print(0)
      exit
    }
  }
  print(count == 0)
} 
