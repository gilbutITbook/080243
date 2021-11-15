#include <stdlib.h>
#include "circular.h"

int main(int argc, char* argv[]) {
  size_t len = argc > 1 ? strtoull(argv[1], 0, 0) : 10;
  fprintf(stderr, "starting with %zu elements in total\n", len);
  circular* c = circular_new(len);
  circular_fput(c, stderr);
  for (size_t i = 0; i < len-1; ++i) {
    if (!circular_append(c, i)) break;
  }
  circular_fput(c, stderr);
  for (size_t i = 0; i < len/2; ++i) {
    if (!circular_append(c, circular_pop(c))) break;
  }
  circular_fput(c, stderr);
  circular_resize(c, 2*len);
  circular_fput(c, stderr);
  circular_resize(c, len);
  circular_fput(c, stderr);
  circular_delete(c);
}
