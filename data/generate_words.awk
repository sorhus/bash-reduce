BEGIN { 
  i = 0; 
  while(getline word < "/usr/share/dict/words") { 
    words[i] = tolower(word); i++ 
  } 
} { 
  for(j = 0; j < $1; j++) { 
    for(k = 0; k < $2; k++) { 
      printf("%s ", words[int(1 + rand() * 10000000) % i]) > $3 
    } 
    printf("\n") > $3; print(".") 
  } 
  exit 
}
