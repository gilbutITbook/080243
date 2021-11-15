#include <stdio.h>

#ifdef USE_STRUCT
  typedef struct two two;
  struct two { double e1; double e2; };
# define FRST(X) ((X).e1)
# define SEC(X) ((X).e2)
#else
  typedef double two[2];
# define FRST(X) ((X)[0])
# define SEC(X) ((X)[1])
#endif

void func0(void) {
  for (two sp = { 1, 1, };
       FRST(sp) + SEC(sp) < 10;
       FRST(sp) += SEC(sp)) {
    printf("two values %g %g\n", FRST(sp), SEC(sp));
    SEC(sp) += (FRST(sp) + SEC(sp))/2;
  }
}

void func1(void) {
  for (register two sp = { 1, 1, };
       FRST(sp) + SEC(sp) < 10;
       FRST(sp) += SEC(sp)) {
    printf("two values %g %g\n", FRST(sp), SEC(sp));
    SEC(sp) += (FRST(sp) + SEC(sp))/2;
  }
}
