// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼uintmax
#pragma CMOD mimic <stdint.h>

#pragma CMOD declaration

#pragma CMOD defexp MAX=UINTMAX_MAX
#pragma CMOD defexp ALIGN=_Alignof(uintmax_t)
#pragma CMOD defexp RANK=RANK((uintmax_t)+0)
#pragma CMOD defexp WIDTH=msb(UINTMAX_MAX)
#pragma CMOD defexp SIZE=sizeof(uintmax_t)

#define MIN ((uintmax)+0)


#pragma CMOD definition

/* The preprocessor should compute in uintmax */
#if -1U != MAX
# error "preprocessor arithmetic is not compatible with uintmax"
#endif

#pragma CMOD snippet none

#pragma CMOD declaration

typedef C◼uintmax uintmax;
