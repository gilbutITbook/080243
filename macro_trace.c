#include "macro_trace.h"
#include <tgmath.h>
#include <stdlib.h>

char const* trace_skip(char const expr[static 1]);

void trace_values(FILE* s,
                  char const func[static 1],
                  char const line[static 1],
                  char const expr[static 1],
                  char const head[static 1],
                  size_t len, long double const arr[len]);


int main(int argc, char* argv[]) {
  double sum = argc > 1 ? strtod(argv[1], 0) : 0x1P-1;
  TRACE_PRINT0("my favorite variable: %g\n", sum);
  TRACE_PRINT1("my favorite variable: %g", sum);
  TRACE_PRINT2("my favorite variable: %g", sum);
  TRACE_VALUE0("my favorite value:", sum);
  TRACE_PTR0("my favorite pointer:", argv);
  TRACE_PTR1("my favorite pointer:", argv);
  TRACE_PRINT3("my favorite variable: %g", sum);
  TRACE_PRINT4("my favorite variable: %g", sum);
  TRACE_PRINT5("my favorite variable: %g", sum);
  TRACE_PRINT5("a good expression: %g", sum*argc);
  TRACE_PRINT6("a collection: %g, %i", sum, argc);
  TRACE_PRINT7("a string");
  TRACE_PRINT8("a collection: %g, %i", sum, argc);
  TRACE_PRINT8("another string");
  TRACE_PRINT9("a collection: %g, %i", sum*acos(0), argc);
  TRACE_VALUES("an untyped collection:", sum, argc, acos(0)*2);
  TRACE_VALUES("an untyped \"collection\":", sum, argc, acos(0)*2);
  TRACE_VALUES("just one element:", acos(0)*2);
  TRACE_VALUES("empty");
  TRACE_VALUES("\"empty\"");
  TRACE_VALUE1("my favorite value:", sum);
  TRACE_VALUE1("another value:", 0x1111111111111);
  TRACE_VALUE1("my favorite pointer:", argv);
}
