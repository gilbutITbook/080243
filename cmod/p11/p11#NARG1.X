// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module NARG1 = p11◼NARG1

#pragma CMOD mimic "p99_generated.h"
#pragma CMOD mimic "p99_list.h"

#pragma CMOD define P00_ARG
#pragma CMOD define MAX = P99_MAX_NUMBER
#pragma CMOD define HAS_COMMA = P99_HAS_COMMA
#pragma CMOD define ASCENDING = P00_ASCENDING
#pragma CMOD define DESCENDING = P00_DESCENDING
#pragma CMOD define ALL_ZEROES = P00_ALL_ZEROES
#pragma CMOD define ALL_ONES = P00_ALL_ONES

#pragma CMOD declaration

#define NCOMMA1(...) P00_ARG(__VA_ARGS__)
#define NCOMMA0(...) NCOMMA1(__VA_ARGS__)
#define NCOMMA(...) NCOMMA0(__VA_ARGS__ DESCENDING())
#define NARG10(...) P00_ARG(__VA_ARGS__)
#define NARG1(...) NARG10(__VA_ARGS__, DESCENDING())

#define TEST() TEST0(DESCENDING())

#pragma CMOD definition

int test0(void) {
  return NARG1(a, b, c);
  return NCOMMA(a, b, c);
}
