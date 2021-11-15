// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼intptr
#pragma CMOD mimic <stdint.h>

#pragma CMOD declaration

/* intptr is optional*/
#pragma CMOD defexp MAX=◼INTPTR_MAX,INTPTR_MAX
#pragma CMOD defexp MIN1=◼INTPTR_MAX,(INTPTR_MIN+1)
#pragma CMOD defexp ALIGN=◼INTPTR_MAX,_Alignof(intptr_t)
#pragma CMOD defexp RANK=◼INTPTR_MAX,RANK((intptr_t)+0)
#pragma CMOD defexp WIDTH=◼INTPTR_MAX,(msb(INTPTR_MAX)+(INTPTR_MAX < UINTPTR_MAX))
#pragma CMOD defexp SIZE=◼INTPTR_MAX,sizeof(intptr_t)

#ifdef MIN1
# define MIN (MIN1-1)
#endif
