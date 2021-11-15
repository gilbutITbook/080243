// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module FOR  = p11◼FOR
#pragma CMOD import IF   = p11◼IF
#pragma CMOD import INT  = p11◼INT
#pragma CMOD import ID10 = p11◼ID10
#pragma CMOD import NARG1= p11◼NARG1
//#pragma CMOD import NARG = p11◼NARG
#pragma CMOD import PREF = p11◼PREF
#pragma CMOD import SKIP = p11◼SKIP
#pragma CMOD import DUPL = p11◼DUPL

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_for.h"

#pragma CMOD defreg \1=\(P00_FOR[0-9][0-9]*\)

#pragma CMOD declaration

#define P00_FOR00(...)
#define P00_FOR01(...) P00_FOR1(__VA_ARGS__)
#define P00_FOR02(...) P00_FOR2(__VA_ARGS__)
#define P00_FOR03(...) P00_FOR3(__VA_ARGS__)
#define P00_FOR04(...) P00_FOR4(__VA_ARGS__)
#define P00_FOR05(...) P00_FOR5(__VA_ARGS__)
#define P00_FOR06(...) P00_FOR6(__VA_ARGS__)
#define P00_FOR07(...) P00_FOR7(__VA_ARGS__)
#define P00_FOR08(...) P00_FOR8(__VA_ARGS__)
#define P00_FOR09(...) P00_FOR9(__VA_ARGS__)

#define P99_ALLBUTLAST(...) PREF◼DROP(1, __VA_ARGS__)
#define P99_LAST(...) SKIP(NARG1◼NCOMMA(__VA_ARGS__), __VA_ARGS__)

#define EXPA(P, NAME, N, ...) ID10(N, P)(NAME, __VA_ARGS__)
/**
 ** @brief 
 **
 **/
#define FOR(...) EXPA(MODULE_PREFIX(9P00_FOR), __VA_ARGS__)

#pragma CMOD define P00_IGN
#pragma CMOD define P00_IDT
#pragma CMOD define P00_POS
#pragma CMOD define P00_NAM
#pragma CMOD define P00_NAME_I
#pragma CMOD define P00_STR
#pragma CMOD define P00_ISIT

#pragma CMOD define P00_SUM
#pragma CMOD define P00_PROD
#pragma CMOD define P00_QUOT
#pragma CMOD define P00_XOR
#pragma CMOD define P00_BOR
#pragma CMOD define P00_BAND
#pragma CMOD define P00_OR
#pragma CMOD define P00_AND
#pragma CMOD define P00_TOKJOIN

#pragma CMOD define P00_SEQ
#pragma CMOD define P00_SEP
#pragma CMOD define P00_SER
#pragma CMOD define P00_REV
#pragma CMOD define P00_PES
#pragma CMOD define P00_RES

#pragma CMOD define P00_FUNC
#pragma CMOD define P00_REPEAT
#pragma CMOD define P00_MAP

/* The user front ends */

#pragma CMOD define P99_NAME
#pragma CMOD define NAME=P99_NAME
#pragma CMOD define P99_BIGOP
#pragma CMOD define BIGOP=P99_BIGOP
#pragma CMOD define P99_BIGFUNC
#pragma CMOD define BIGFUNC=P99_BIGFUNC

#define P99_DUPL DUPL
#define P99_FOR FOR
#pragma CMOD define REPEAT=P99_REPEAT
#pragma CMOD define UNROLL=P99_UNROLL

#pragma CMOD define SUMS=P99_SUMS
#pragma CMOD define PRODS=P99_PRODS
#pragma CMOD define QUOTS=P99_QUOTS
#pragma CMOD define XORS=P99_XORS
#pragma CMOD define BORS=P99_BORS
#pragma CMOD define BANDS=P99_BANDS
#pragma CMOD define ORS=P99_ORS
#pragma CMOD define ANDS=P99_ANDS

#pragma CMOD definition

int test0(void) {
  return 0;
}
