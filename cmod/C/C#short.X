// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼short
#pragma CMOD import snip	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=SHRT_MAX
#pragma CMOD defexp MIN1=SHRT_MIN+1
#pragma CMOD defexp ALIGN=alignof(short)
#pragma CMOD defexp RANK=RANK((short)+0)

#pragma CMOD defexp SIZE=sizeof(short)

#pragma CMOD declaration
typedef short C◼short;
#define MIN (MIN1-1)
#define WIDTH C◼SHRT_WIDTH
