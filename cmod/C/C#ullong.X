// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼ullong
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=ULLONG_MAX
#pragma CMOD defexp ALIGN=alignof(unsigned long long)
#pragma CMOD defexp RANK=RANK(0ULL)
#pragma CMOD defexp SIZE=sizeof(unsigned long long)

#pragma CMOD declaration
#define MIN 0ULL
#define WIDTH C◼ULLONG_WIDTH

inline
unsigned long long abs(unsigned long long x) {
  return x;
}

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼ullong ullong;
