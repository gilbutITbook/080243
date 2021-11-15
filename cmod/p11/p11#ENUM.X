// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module ENUM  = p11◼ENUM
#pragma CMOD import NARG1 = p11◼NARG1
#pragma CMOD import MAP   = p11◼MAP
#pragma CMOD import str   = C◼str
#pragma CMOD declaration

/* Two generic macros that are in fact used by the specializations to
   unroll the cases inside the functions. */

#define ENUM◼CASE(X) case X: return p11◼STRINGIFY(X)

#define ENUM◼PARSE(C)                           \
  do {                                          \
    if (!str◼cmp(p11◼STRINGIFY(C), s))          \
      return ret;                               \
    ++ret;                                      \
  } while(0)

/***********************************************/
#pragma CMOD snippet none
#pragma CMOD slot T    = complete
#pragma CMOD slot LIST = none

#pragma CMOD declaration

inline
char const* getname(T x) {
  switch (x) {
    MAP◼SEP(ENUM◼CASE, ENUM◼LIST);
  }
  return 0;
}

inline
T parse(char const s[]) {
  if (!s) return NARG1(ENUM◼LIST);
  T ret = 0;
  MAP◼SEP(ENUM◼PARSE, ENUM◼LIST);
  return ret;
}
