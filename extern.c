#include <stdio.h>

unsigned i = 1;          /*@\label{line:decl-i-1}*/

int main(void) {
  unsigned i = 2;        /* A new object *//*@\label{line:decl-i-2}*/
  if (i) {
    extern unsigned i;   /* An existing object *//*@\label{line:decl-i-3}*/
    printf("%u\n", i);
  } else {
    printf("%u\n", i);
  }
}
