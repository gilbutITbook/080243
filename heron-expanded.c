#include <stdlib.h>
#include <stdio.h>

int main(int argc, char* argv[argc+1]) {
  double const epsP1 = 1.0 + 1E-9;
  double const epsM1 = 1.0 - 1E-9;
  for (int i = 1; i < argc; ++i) {
    /* Read one command line argument as a double. */
    double const a = strtod(argv[i], 0);
    /* Compute some local constants. */
    double fact;
    double alow;
    double ahig;
    if (a < 1.0) {
      fact =  2.0;
      alow =  a;
      ahig =  1.0;
    } else {
      fact =  0.5;
      alow =  -a;
      ahig =  -1.0;
    }
    /* A first low quality estimate for the inverse. */
    double x = 1.0;
    /* Adapt x until it has the right magnitude. */
    while (alow*x < ahig) x *= fact;
    /* We are close, correct with the Heron factor. */
    for (double prod = a*x;
         ((prod < epsM1) || (epsP1 < prod));
         prod = a*x) {
      x *= (2.0 - prod);
    }
    printf("heron: a=%.5e,\tx=%.5e,\ta*x=%.12f\n",
           a, x, a*x);
  }
  return EXIT_SUCCESS;
}
