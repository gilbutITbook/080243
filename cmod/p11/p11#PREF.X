// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module PREF = p11◼PREF
#pragma CMOD import IF   = p11◼IF
#pragma CMOD import INT  = p11◼INT
#pragma CMOD import ID10 = p11◼ID10
#pragma CMOD import NARG1= p11◼NARG1
#pragma CMOD import PRED = p11◼PRED

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD defreg \1=\(P00_PRE[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_PRE00(...)
#define P00_PRE01(...) P00_PRE1(__VA_ARGS__)
#define P00_PRE02(...) P00_PRE2(__VA_ARGS__)
#define P00_PRE03(...) P00_PRE3(__VA_ARGS__)
#define P00_PRE04(...) P00_PRE4(__VA_ARGS__)
#define P00_PRE05(...) P00_PRE5(__VA_ARGS__)
#define P00_PRE06(...) P00_PRE6(__VA_ARGS__)
#define P00_PRE07(...) P00_PRE7(__VA_ARGS__)
#define P00_PRE08(...) P00_PRE8(__VA_ARGS__)
#define P00_PRE09(...) P00_PRE9(__VA_ARGS__)

#define EXPB(P, N, ...) ID10(N, P)(__VA_ARGS__)
#define EXPA(N, ...) EXPB(MODULE_PREFIX(9P00_PRE), N, __VA_ARGS__)
/**
 ** @brief Get a prefix of length @a N of the argument list
 **
 **/
#define PREF(N, ...) EXPA(N, __VA_ARGS__)

#define DROP1(N, ...) PREF(N)(__VA_ARGS__)
#define DROP0(N, M, ...) DROP1(INT◼SUB(M, N), __VA_ARGS__)
/**
 ** @brief Omit a postfix of length @a N of the argument list
 **
 **/
#define DROP(N, ...) DROP0(N, NARG1(__VA_ARGS__), __VA_ARGS__)


#pragma CMOD definition

int test0(void) {
  return 0;
}
