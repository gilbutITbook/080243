// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼uintptr
#pragma CMOD mimic <stdint.h>

#pragma CMOD declaration
/* uintptr is optional*/
#pragma CMOD defexp MAX=◼UINTPTR_MAX,UINTPTR_MAX
#pragma CMOD defexp ALIGN=◼UINTPTR_MAX,_Alignof(uintptr_t)
#pragma CMOD defexp RANK=◼UINTPTR_MAX,RANK((uintptr_t)+0)
#pragma CMOD defexp WIDTH=◼UINTPTR_MAX,msb(UINTPTR_MAX)
#pragma CMOD defexp SIZE=◼UINTPTR_MAX,sizeof(uintptr_t)

#if MAX
#define MIN ((uintptr)+0)
#endif
