// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module EMPTY = p11◼EMPTY
#pragma CMOD import IF    = p11◼IF
#pragma CMOD import PASTE = p11◼PASTE
#pragma CMOD import NARG1 = p11◼NARG1

#pragma CMOD declaration

#define ISEQ(...) ,

#define EMPTY(...)                                                      \
ISEMA(                                                                   \
            /* test if there is just one argument, that might be empty */ \
             NARG1◼HAS_COMMA(__VA_ARGS__),                              \
             /* test if P99_IS__EQ__ together with the argument         \
                adds a comma */                                         \
             NARG1◼HAS_COMMA(ISEQ __VA_ARGS__),                         \
             /* test if the argument together with a parenthesis        \
                adds a comma */                                         \
             NARG1◼HAS_COMMA(__VA_ARGS__ (/*empty*/)),                  \
             /* test if placing it between P99_IS__EQ__ and the         \
                parenthesis adds a comma */                             \
             NARG1◼HAS_COMMA(ISEQ __VA_ARGS__ (/*empty*/))              \
             )

#define ISEMA(_0, _1, _2, _3) ISEMB(PASTE(_0, _1, _2, _3))
#define ISEMB(V) ISEMC(V, MODULE_PREFIX(9CASE_))
#define ISEMC(V, M) IF(V, M, 1, 0)
#define CASE_0001 ,
#pragma CMOD definition

int test0(void) {
  return NARG1◼HAS_COMMA(a, b);
}
