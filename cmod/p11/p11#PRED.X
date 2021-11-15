// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module PRED = p11◼PRED
#pragma CMOD import ID10 = p11◼ID10

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD defreg \1=\(P00_PRED_[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_PRED_00 -1
#define P00_PRED_01 P00_PRED_1
#define P00_PRED_02 P00_PRED_2
#define P00_PRED_03 P00_PRED_3
#define P00_PRED_04 P00_PRED_4
#define P00_PRED_05 P00_PRED_5
#define P00_PRED_06 P00_PRED_6
#define P00_PRED_07 P00_PRED_7
#define P00_PRED_08 P00_PRED_8
#define P00_PRED_09 P00_PRED_9

#define EXPB(N) ID10(N, MODULE_PREFIX(11P00_PRED_))
#define EXPA(N) EXPB(N)
#define PRED(...) EXPA(__VA_ARGS__)

