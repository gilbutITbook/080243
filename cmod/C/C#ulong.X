// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼ulong
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=ULONG_MAX
#pragma CMOD defexp ALIGN=alignof(unsigned long)
#pragma CMOD defexp RANK=RANK(0UL)
#pragma CMOD defexp SIZE=sizeof(unsigned long)

#pragma CMOD declaration
#define MIN 0UL
#define WIDTH C◼ULONG_WIDTH

inline
unsigned long abs(unsigned long x) {
  return x;
}

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼ulong ulong;
