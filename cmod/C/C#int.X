// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼int
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=INT_MAX
#pragma CMOD defexp MIN1=INT_MIN+1
#pragma CMOD defexp ALIGN=alignof(int)
#pragma CMOD defexp RANK=RANK(1)
#pragma CMOD defexp SIZE=sizeof(int)

#pragma CMOD declaration

#define MIN (MIN1-1)
#define WIDTH C◼INT_WIDTH
typedef int C◼int;

inline
unsigned abs(signed x) {
  return (x >= 0) ? x : -(unsigned)x;
}
