#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

/**
 ** @brief A small, useless function to show how variadic
 ** functions work
 **/
double sumIt(size_t n, ...) {
  double ret = 0.0;
  va_list va;
  va_start(va, n);
  for (size_t i = 0; i < n; ++i)
    ret += va_arg(va, double);
  va_end(va);
  return ret;
}

FILE* iodebug = 0;

/**
 ** @brief Prints to the debug stream @c iodebug
 **/
#ifdef __GNUC__
__attribute__((format(printf, 1, 2)))
#endif
int printf_debug(const char *format, ...) {
  int ret = 0;
  if (iodebug) {
    va_list va;
    va_start(va, format);
    ret = vfprintf(iodebug, format, va);
    va_end(va);
  }
  return ret;
}



int main(int argc, char* argv[argc+1]) {
  if (argc < 4) return EXIT_FAILURE;
  iodebug = stderr;
  printf_debug("%g\n", sumIt(3, strtod(argv[1], 0), strtod(argv[2], 0), strtod(argv[3], 0)));
  return EXIT_SUCCESS;
}
