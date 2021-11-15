// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module SKIP = p11◼SKIP
#pragma CMOD import IF   = p11◼IF
#pragma CMOD import ID10 = p11◼ID10
#pragma CMOD import NARG1= p11◼NARG1

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD defreg \1=\(P00_SKP[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_SKP00(...) __VA_ARGS__
#define P00_SKP01(...) P00_SKP1(__VA_ARGS__)
#define P00_SKP02(...) P00_SKP2(__VA_ARGS__)
#define P00_SKP03(...) P00_SKP3(__VA_ARGS__)
#define P00_SKP04(...) P00_SKP4(__VA_ARGS__)
#define P00_SKP05(...) P00_SKP5(__VA_ARGS__)
#define P00_SKP06(...) P00_SKP6(__VA_ARGS__)
#define P00_SKP07(...) P00_SKP7(__VA_ARGS__)
#define P00_SKP08(...) P00_SKP8(__VA_ARGS__)
#define P00_SKP09(...) P00_SKP9(__VA_ARGS__)

#define IGNORE(...)
#define EXPB(P1, P2, N, M, ...) IF(M, P1, IGNORE, ID10(N, P2))(__VA_ARGS__)
#define EXPA(N, ...) EXPB(MODULE_PREFIX(6CASE_), MODULE_PREFIX(9P00_SKP), N, NARG1◼NCOMMA(__VA_ARGS__), __VA_ARGS__)
#define SKIP(...) EXPA(__VA_ARGS__)
#define CASE_0 ,

#define CHS(N, ...)   CHSA(N, __VA_ARGS__)
#define CHSA(N, ...)  CHSB(SKIP(N, __VA_ARGS__),)
#define CHSB(...)     CHSC(__VA_ARGS__)
#define CHSC(_0, ...) _0



#pragma CMOD definition

int test0(void) {
  return 0;
}
