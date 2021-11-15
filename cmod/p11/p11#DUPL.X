// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module DUPL = p11◼DUPL
#pragma CMOD import ID10 = p11◼ID10

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD defreg \1=\(P00_DUPL_[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_DUPL_00(...)
#define P00_DUPL_01(...) P00_DUPL_1(__VA_ARGS__)
#define P00_DUPL_02(...) P00_DUPL_2(__VA_ARGS__)
#define P00_DUPL_03(...) P00_DUPL_3(__VA_ARGS__)
#define P00_DUPL_04(...) P00_DUPL_4(__VA_ARGS__)
#define P00_DUPL_05(...) P00_DUPL_5(__VA_ARGS__)
#define P00_DUPL_06(...) P00_DUPL_6(__VA_ARGS__)
#define P00_DUPL_07(...) P00_DUPL_7(__VA_ARGS__)
#define P00_DUPL_08(...) P00_DUPL_8(__VA_ARGS__)
#define P00_DUPL_09(...) P00_DUPL_9(__VA_ARGS__)

#define EXPB(N, M, ...) ID10(N, M)(__VA_ARGS__)
#define EXPA(N, ...) EXPB(N, MODULE_PREFIX(11P00_DUPL_), __VA_ARGS__)
#define DUPL(...) EXPA(__VA_ARGS__)


#pragma CMOD definition
