// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module MAP = p11◼MAP
#pragma CMOD import NARG1 = p11◼NARG1
#pragma CMOD import ID10 = p11◼ID10

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"
#pragma CMOD mimic "p99_for.h"

#pragma CMOD defreg \1=\(P00_MAP_[0-9][0-9]*\)

#pragma CMOD define SEQ=P99_SEQ
#pragma CMOD define SER=P99_SER
#pragma CMOD define SEP=P99_SEP
#pragma CMOD define SEA=P99_SEA
#pragma CMOD define SEM=P99_SEM

#pragma CMOD declaration

#define P99_NARG NARG1
#define P00_MAP_ MAP
#define P00_ROBUST(...) __VA_ARGS__

#define P00_MAP_00(...)
#define P00_MAP_01(...) P00_MAP_1(__VA_ARGS__)
#define P00_MAP_02(...) P00_MAP_2(__VA_ARGS__)
#define P00_MAP_03(...) P00_MAP_3(__VA_ARGS__)
#define P00_MAP_04(...) P00_MAP_4(__VA_ARGS__)
#define P00_MAP_05(...) P00_MAP_5(__VA_ARGS__)
#define P00_MAP_06(...) P00_MAP_6(__VA_ARGS__)
#define P00_MAP_07(...) P00_MAP_7(__VA_ARGS__)
#define P00_MAP_08(...) P00_MAP_8(__VA_ARGS__)
#define P00_MAP_09(...) P00_MAP_9(__VA_ARGS__)

#define EXPB(M, N, ...) ID10(N, M)(__VA_ARGS__)
#define EXPA(M, N, ...) EXPB(M, N, __VA_ARGS__)
#define MAP(N, MAC, SEP, ...) EXPA(MODULE_PREFIX(10P00_MAP_), N, MAC, SEP, __VA_ARGS__)
