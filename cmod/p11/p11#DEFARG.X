// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module DEFARG  = p11◼DEFARG
#pragma CMOD import EMPTY = p11◼EMPTY
#pragma CMOD import FOR   = p11◼FOR
#pragma CMOD import IF    = p11◼IF
#pragma CMOD import INT   = p11◼INT
#pragma CMOD import MAP   = p11◼MAP
#pragma CMOD import REP   = p11◼REP
#pragma CMOD import NARG1 = p11◼NARG1
#pragma CMOD import NARG = p11◼NARG
#pragma CMOD import SKIP  = p11◼SKIP
#pragma CMOD declaration

/**
 ** @file
 **
 ** @brief Provide a mechanism for default arguments.
 **
 ** This module should be used through its snippet. E.g
 **
 ** <code>
 ** #pragma CMOD import DEFARG   = p11◼DEFARG
 ** #pragma CMOD fill DEFARG◼func= C◼str◼strtoull
 ** #pragma CMOD fill DEFARG◼FUNC= p11◼strtoull
 ** #pragma CMOD fill DEFARG◼DEFS= p11◼strtoull◼STRTOULL_DEF
 ** #pragma CMOD declaration
 ** #define STRTOULL_DEF , 0, 0
 ** </code>
 **
 ** defines a macro @c p11◼strtoull as an interface to the function @c
 ** C◼str◼strtoull that has the default arguments as listed with the
 ** macro @c p11◼strtoull◼STRTOULL_DEF.
 **
 ** That macro consists of a list of as many elements @c N as the
 ** function expects arguments, or sais otherwise the expansion of it
 ** should have @c N-1 commas.
 **
 ** Defaults may be left empty, in which case there none,
 ** evidently. Here for the example the calls 
 **
 ** <code>
 ** return strtoull("0890", 0, 2);
 ** return strtoull("0890",  , 3);
 ** return strtoull("0890", 0,  );
 ** return strtoull("0890", 0   );
 ** return strtoull("0890"      );
 ** </code>
 **
 ** should all be valid, but omitting the first argument would be not.
 **/

#pragma CMOD declaration

#define DEFAULT(X, D)     DEFAULT0(X, D)
#define DEFAULT0(X, D)    DEFAULT1(EMPTY(X), X, D)
#define DEFAULT1(N, X, D) IF◼IF0(N, X, D)

#define ROBUST(...) __VA_ARGS__

#define DEFPOS(THREE, X, I) DEFPOS0(I, ROBUST THREE)
#define DEFPOS0(...)        DEFPOS1(__VA_ARGS__)
#define DEFPOS1(I, N, D, A) DEFPOS2(I, N, ROBUST D, ROBUST A)
#define DEFPOS2(...)        DEFPOS3(__VA_ARGS__)
#define DEFPOS3(I, N, ...)  DEFPOS4(I, N, __VA_ARGS__, REP(N,))
#define DEFPOS4(...)        DEFPOS5(__VA_ARGS__)
#define DEFPOS5(I, N, ...)  DEFPOS6(INT◼ADD(I, N), I, __VA_ARGS__)
#define DEFPOS6(...)        DEFPOS7(__VA_ARGS__)
#define DEFPOS7(I, J, ...)  DEFPOS8(SKIP◼CHS(I, __VA_ARGS__), SKIP◼CHS(J, __VA_ARGS__))
#define DEFPOS8(...)        DEFPOS9(__VA_ARGS__)
#define DEFPOS9(X, D) DEFAULT(X, D)

#define DEFARG(...)           DEFARGC(__VA_ARGS__)
#define DEFARGC(F, A, D)      DEFARGB(F, D, A)
#define DEFARGB(...)          DEFARGA(__VA_ARGS__)
#define DEFARGA(F, D, A)      DEFARG0(F, D, A)
#define DEFARG0(F, D, A)      DEFARG1(F, NARG1(ROBUST D), D, A)
#define DEFARG1(...)          DEFARG2(__VA_ARGS__)
#define DEFARG2(F, N, D, A)   DEFARG3(F, N, (N, D, A), REP(N,),)
#define DEFARG3(...)          DEFARG4(__VA_ARGS__)
#define DEFARG4(F, N, T, ...) DEFARG5(F, FOR(T, N, FOR◼P00_SEQ, DEFPOS, __VA_ARGS__))
#define DEFARG5(...)          DEFARG6(__VA_ARGS__)
#define DEFARG6(F, ...)       DEFARG7(F, __VA_ARGS__)
#define DEFARG7(F, ...)       F(__VA_ARGS__)

#define TEST(...) DEFARG(f, (__VA_ARGS__), (0xb, 0xa, 0xc))


#pragma CMOD definition

int f();

int test0(void) {
  return DEFAULT(1, 7);
  return DEFAULT(2, );
  return DEFAULT(, 3);
  return SKIP◼CHS(2, 6, 7, 4, 5);
  return SKIP◼CHS(3, 6, 7, 4, 5);
  return SKIP◼CHS(0, 6, 7, 4, 5);
  return SKIP◼CHS(1, 6, 7, 4, 5);

  return DEFPOS((3, (0xb, 0xa, 0xc), (9, 8, 10)), ,1);
  return DEFPOS((3, (0xb, 0xa, 0xc), (9, 8, 10)), ,0);
  return DEFPOS((3, (0xb, 0xa, 0xc), (9,  , 10)), ,1);
  return DEFPOS((3, (0xb, 0xa, 0xc), ( , 8)), ,0);
  return DEFPOS((3, (0xb, 0xa, 0xc), ( , 8)), ,2);

  return TEST(9, 8, 10);
  return TEST(9,  , 10);
  return TEST( , 8);
  return TEST(9);
  return TEST();
}

/***********************************************/
#pragma CMOD snippet        none
#pragma CMOD slot    FUNC = none
#pragma CMOD slot    func = none
#pragma CMOD slot    DEFS = none

#pragma CMOD declaration

#define FUNC(...) p11◼DEFARG(func, (__VA_ARGS__), (DEFS))
