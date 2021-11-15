// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼ptrdiff
#pragma CMOD import minmax	= C◼snippet◼minmax
#pragma CMOD mimic <stdint.h>

#pragma CMOD defexp MAX=PTRDIFF_MAX
#pragma CMOD defexp MIN1=PTRDIFF_MIN+1
#pragma CMOD defexp RANK=RANK((char*)0-(char*)0)

#pragma CMOD declaration

#define MIN (MIN1-1)

#pragma CMOD snippet none
#pragma CMOD declaration

typedef C◼ptrdiff ptrdiff;
