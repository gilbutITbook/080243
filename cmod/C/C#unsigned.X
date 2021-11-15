// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼unsigned
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=UINT_MAX
#pragma CMOD defexp ALIGN=alignof(unsigned)
#pragma CMOD defexp RANK=RANK(1U)

#pragma CMOD declaration
#define MIN 0U
#define WIDTH C◼UINT_WIDTH
typedef unsigned C◼unsigned;

inline
unsigned abs(unsigned x) {
  return x;
}
