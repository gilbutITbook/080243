// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼ushort
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=USHRT_MAX
/* make sure that this is promoted to the correct type */
#pragma CMOD defexp MIN=+((unsigned short)+0)
#pragma CMOD defexp ALIGN=alignof(unsigned short)
#pragma CMOD defexp RANK=RANK((unsigned short)+0)
#pragma CMOD defexp SIZE=sizeof(unsigned short)

#pragma CMOD declaration
#define WIDTH C◼USHRT_WIDTH

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼ushort ushort;

