#include <stdlib.h>
#include <stdio.h>

/* Compute Fibonacci number n with the help of a cache that may
   hold previously computed values. */
size_t fibCacheRec(size_t n, size_t cache[n]) {
  if (!cache[n-1]) {
    cache[n-1]
      = fibCacheRec(n-1, cache) + fibCacheRec(n-2, cache);
  }
  return cache[n-1];
}

size_t fibCache(size_t n) {
  if (n+1 <= 3) return 1;
  /* Set up a VLA to cache the values. */
  size_t cache[n];
  /* A VLA must be initialized by assignment. */
  cache[0] = 1; cache[1] = 1;
  for (size_t i = 2; i < n; ++i)
    cache[i] = 0;
  /* Call the recursive function. */
  return fibCacheRec(n, cache);
}

double goldenRatio(size_t n) {
  if (n+1 <= 3) return 1;
  size_t cache[n];
  cache[0] = 1;
  cache[1] = 1;
  for (size_t i = 2; i < n; ++i)
    cache[i] = 0;
  double ret = fibCacheRec(n, cache);
  return ret/fibCacheRec(n-1, cache);
}

int main(int argc, char* argv[argc+1]) {
  for (int i = 1; i < argc; ++i) {             // Processes args
    size_t const n = strtoull(argv[i], 0, 0);  // arg -> size_t
    double golden = goldenRatio(n);
    double control = golden*2.0-1.0;
    printf("fib(%zu) is %zu, golden ratio %.20g, control %.20g\n",
           n, fibCache(n), golden, control*control);
  }
  return EXIT_SUCCESS;
}
