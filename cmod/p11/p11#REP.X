// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module REP = p11◼REP
#pragma CMOD import ID10 = p11◼ID10

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD defreg \1=\(P00_REP_[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_REP_00(...)
#define P00_REP_01(...) P00_REP_1(__VA_ARGS__)
#define P00_REP_02(...) P00_REP_2(__VA_ARGS__)
#define P00_REP_03(...) P00_REP_3(__VA_ARGS__)
#define P00_REP_04(...) P00_REP_4(__VA_ARGS__)
#define P00_REP_05(...) P00_REP_5(__VA_ARGS__)
#define P00_REP_06(...) P00_REP_6(__VA_ARGS__)
#define P00_REP_07(...) P00_REP_7(__VA_ARGS__)
#define P00_REP_08(...) P00_REP_8(__VA_ARGS__)
#define P00_REP_09(...) P00_REP_9(__VA_ARGS__)

#define EXPB(M, N, ...) ID10(N, M)(__VA_ARGS__)
#define EXPA(M, N, ...) EXPB(M, N, __VA_ARGS__)
#define REP(...) EXPA(MODULE_PREFIX(10P00_REP_), __VA_ARGS__)

