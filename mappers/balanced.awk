{ 
  count = 0
  len = split($0, chars, "")
  for (i = 1; i <= len; i++) {
    if(chars[i] == "(") {
      count++
    } else {
      count--
    }
  }
  printf("0 %s_%s\n", NR, count)
}
