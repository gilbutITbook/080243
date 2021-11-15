#include <stdio.h>
#include <stdlib.h>
#include "generic.h"

/* "Instantiate" the inline functions of the "generic.h" header. */
double (min)(double a, double b);
long double (minl)(long double a, long double b);
float (minf)(float a, float b);
signed (maxs)(signed a, signed b);
unsigned (maxu)(unsigned a, unsigned b);
unsigned (maxus)(unsigned a, signed b);
unsigned (maxsu)(signed a, unsigned b);
signed long (maxsl)(signed long a, signed long b);
unsigned long (maxul)(unsigned long a, unsigned long b);
unsigned long (maxusl)(unsigned long a, signed long b);
unsigned long (maxsul)(signed long a, unsigned long b);
signed long long (maxsll)(signed long long a, signed long long b);
unsigned long long (maxull)(unsigned long long a, unsigned long long b);
unsigned long long (maxusll)(unsigned long long a, signed long long b);
unsigned long long (maxsull)(signed long long a, unsigned long long b);

int main(int argc, char* argv[argc+1]){
  if (argc > 1) {
    printf("testing strto functions: base 10 = %lu, general base = %llu\n",
           strtoul10(argv[2]), strtoull(argv[2]));
    long double a = strtold(argv[1]);
    printf("minimum of %Lg and 1.0f is %Lg\n",
           a, min(a, 1.0F));
    printf("minimum of %g and argc is %g\n",
           3.0, min(3.0, argc));
  }
  printf("maxof(1) = %d\n", maxof(1));
  printf("maxof(1.0) = %g\n", maxof(1.0));
  printf("maxof(long double) = %Lg\n", maxof(long double));
  printf("minof(1ul) = %lu\n", minof(1ul));
  printf("minof(1.0) = %g\n", minof(1.0));
  printf("minof(long double) = %Lg\n", minof(long double));
  printf("mix(1u, -1l) = %luul\n", mix(1u, -1l));
  printf("mix(-1, 1ul) = %luul\n", mix(-1, 1ul));
  printf("mix(-1, 1l) = %ldl\n", mix(-1, 1l));
  printf("mix(1u, 2ul) = %luul\n", mix(1u, 2ul));
  return EXIT_SUCCESS;
}
