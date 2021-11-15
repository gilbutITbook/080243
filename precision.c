#include <stdio.h>

int main(void) {
  printf("%.20e %.20e\n",
         ((1.0E-13 + 1.0E-13)),
         (1.0E-13 + (1.0E-13 + 1.0)) - 1.0
         );
}
