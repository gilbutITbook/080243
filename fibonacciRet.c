#include <stdlib.h>
#include <stdio.h>

typedef struct fibonaccipair fibonaccipair;

struct fibonaccipair {
  size_t prev;
  size_t act;
};

fibonaccipair fiboNext(fibonaccipair ret) {
  size_t res = ret.act + ret.prev;
  ret.prev = ret.act;
  ret.act = res;
  return ret;
}

fibonaccipair fibonacci2(size_t n, fibonaccipair ret) {
  if (n) {
    return fibonacci2(n-1, fiboNext(ret));
  } else
    return ret;
}

fibonaccipair fibonacci3(size_t n, fibonaccipair ret) {
  while (n --> 0) {
    ret = fiboNext(ret);
  }
  return ret;
}

size_t fibonacci(size_t n) {
  register fibonaccipair res = { 1, 1, };
  if (n > 2) res = fibonacci2(n - 2, res);
  return res.act;
}


int main(int argc, char* argv[argc+1]) {
  for (int i = 1; i < argc; ++i) {             // process args
    size_t const n = strtoull(argv[i], 0, 0); // arg -> size_t
    printf("fibonacci(%zu) is %zu\n",
           n, fibonacci(n));
  }
  return EXIT_SUCCESS;
}
