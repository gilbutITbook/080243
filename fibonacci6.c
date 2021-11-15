#include <stdlib.h>
#include <stdio.h>

/**
 ** Rewrite Fibonacci iteratively such that is proceeds in pairs of
 ** values and hopefully doesn't spill any of the variables to memory.
 **/

size_t fib2(size_t n) {
  register size_t x1 = 1;           // F(x1)   for x1 = (n+1)%2 + 1
  register size_t x2 = n%2 ? 1 : 2; // F(x1+1)
  for (register size_t i = (n-1)/2; i; --i) {
    x1 += x2;
    x2 += x1;
  }
  return x1;              // F(y) with y = x1 + 2*((n-1)/2)
                          //             = x1 + ((n-1)-((n+1)%2))
                          //             = ((n+1)%2 + 1)+((n-1)-((n+1)%2))
                          //             = n
}

int main(int argc, char* argv[argc+1]) {
  for (int i = 1; i < argc; ++i) {             // process args
    size_t const n = strtoull(argv[i], 0, 0); // arg -> size_t
    printf("fib(%zu) is %zu\n",
           n, fib2(n));
  }
  return EXIT_SUCCESS;
}
