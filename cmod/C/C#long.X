// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module lng=C◼long
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=LONG_MAX
#pragma CMOD defexp MIN1=LONG_MIN+1
#pragma CMOD defexp ALIGN=alignof(long)
#pragma CMOD defexp RANK=RANK(0L)

#pragma CMOD defexp SIZE=sizeof(long)

#pragma CMOD declaration

#define MIN (MIN1-1L)
#define WIDTH C◼LONG_WIDTH
typedef long C◼long;

inline
unsigned long abs(signed long x) {
  return (x >= 0) ? x : -(unsigned long)x;
}
