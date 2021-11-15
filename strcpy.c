#include <string.h>
#include <stdio.h>
int main(int argc, char* argv[argc+1]) {
  size_t const len = strlen(argv[0]); // Computes the length
  char name[len+1];                   // Creates a VLA
                                      // Ensures a place for 0
  memcpy(name, argv[0], len);         // Copies the name
  name[len] = 0;                      // Ensures a 0 character
  if (!strcmp(name, argv[0])) {
    printf("program name \"%s\" successfully copied\n",
           name);
  } else {
    printf("copying %s leads to different string %s\n",
           argv[0], name);
  }
}
