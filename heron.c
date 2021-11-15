#include <stdlib.h>
#include <stdio.h>

/* lower and upper iteration limits centered around 1.0 */
static double const eps1m01 = 1.0 - 0x1P-01;
static double const eps1p01 = 1.0 + 0x1P-01;
static double const eps1m24 = 1.0 - 0x1P-24;
static double const eps1p24 = 1.0 + 0x1P-24;

int main(int argc, char* argv[argc+1]) {
  for (int i = 1; i < argc; ++i) {        // process args
    double const a = strtod(argv[i], 0);  // arg -> double
    double x = 1.0;
    for (;;) {                    // by powers of 2
      double prod = a*x;
      if (prod < eps1m01) {
        x *= 2.0;
      } else if   (eps1p01 < prod) {
        x *= 0.5;
      } else {
        break;
      }
    }
    for (;;) {                    // Heron approximation
      double prod = a*x;
      if ((prod < eps1m24) || (eps1p24 < prod)) {
        x *= (2.0 - prod);
      } else {
        break;
      }
    }
    printf("heron: a=%.5e,\tx=%.5e,\ta*x=%.12f\n",
           a, x, a*x);
  }
  return EXIT_SUCCESS;
}
