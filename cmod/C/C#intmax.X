// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼intmax
#pragma CMOD mimic <stdint.h>

#pragma CMOD declaration

#pragma CMOD defexp MAX=INTMAX_MAX
#pragma CMOD defexp MIN1=(INTMAX_MIN+1)
#pragma CMOD defexp ALIGN=_Alignof(intmax_t)
#pragma CMOD defexp RANK=RANK((intmax_t)+0)
#pragma CMOD defexp WIDTH=(msb(INTMAX_MAX)+(INTMAX_MAX < UINTMAX_MAX))
#pragma CMOD defexp SIZE=sizeof(intmax_t)

#define MIN (MIN1-1)

