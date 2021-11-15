// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼llong
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=LLONG_MAX
#pragma CMOD defexp MIN1=LLONG_MIN+1LL
#pragma CMOD defexp ALIGN=alignof(long long)
#pragma CMOD defexp RANK=RANK(0LL)
#pragma CMOD defexp SIZE=sizeof(long long)

#pragma CMOD declaration
#define MIN (MIN1-1LL)

#define WIDTH C◼LLONG_WIDTH

typedef long long C◼llong;

inline
unsigned long long abs(signed long long x) {
  return (x >= 0) ? x : -(unsigned long long)x;
}

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼llong llong;
