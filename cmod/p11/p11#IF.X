// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module IF = p11◼IF

#pragma CMOD declaration

/**
 ** @brief A rudimentary conditional macro
 **
 ** This can be used to chose between alternatives @a TRUE or @a
 ** FALSE. The condition to be tested is if the concatenation of @a
 ** CASE, then @a X and then the character @c E will expand to a comma
 ** character or not.
 **
 ** @param X should already be expanded when this level is
 ** reached. Since this is used in mangling, all @a X that arrive here
 ** should have the same length (in characters). This length should be
 ** consistent with @a CASE for the mangling scheme.
 **
 ** @param CASE should be the start of a mangled name that can be
 ** completed with @a X. Since it only is the start of such a name, it
 ** should usually be safe not to be expanded itself.
 **
 ** @param TRUE is the result if the case for @a X expands to a comma.
 **
 ** @param FALSE is the result if the case for @a X doesn't expand to
 ** a comma.
 **
 ** @remark The only cases that have to be provided are those for @c
 ** TRUE. The cases for @a FALSE usually don't have to be specified.
 **/
#define IF(X, CASE, TRUE, FALSE) A(CASE ## X ## E, TRUE , FALSE,)
#define A(CASE, TRUE, FALSE, ...) B(CASE, TRUE , FALSE, __VA_ARGS__)
#define B(_0, _1, _2, ...) _2

#define IF1(X, TRUE, FALSE) A1(MODULE_PREFIX(7CASE1_), X, TRUE , FALSE,)
#define A1(...) B1(__VA_ARGS__)
#define B1(CASE, X, TRUE, FALSE, ...) C1(CASE ## X ## E, TRUE , FALSE, __VA_ARGS__)
#define C1(CASE, TRUE, FALSE, ...) D1(CASE, TRUE , FALSE, __VA_ARGS__)
#define D1(_0, _1, _2, ...) _2
#define CASE1_1 ,

#define IF0(X, TRUE, FALSE) A0(MODULE_PREFIX(7CASE0_), X, TRUE , FALSE,)
#define A0(...) B0(__VA_ARGS__)
#define B0(CASE, X, TRUE, FALSE, ...) C0(CASE ## X ## E, TRUE , FALSE, __VA_ARGS__)
#define C0(CASE, TRUE, FALSE, ...) D0(CASE, TRUE , FALSE, __VA_ARGS__)
#define D0(_0, _1, _2, ...) _2
#define CASE0_0 ,

#pragma CMOD definition

int test0(void) {
  return IF1(0, 5, 1);
  return IF1(1, 2, 8);
  return IF0(0, 3, 6);
  return IF0(1, 7, 4);
}
