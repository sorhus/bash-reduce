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
  printf("KEY %s_%s\n", NR, count)
}
