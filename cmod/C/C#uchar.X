// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼uchar
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

/* make sure that these are promoted to the correct type */
#pragma CMOD defexp MAX=UCHAR_MAX
#pragma CMOD defexp MIN=+((unsigned char)+0)
#pragma CMOD defexp ALIGN=alignof(unsigned char)
#pragma CMOD defexp RANK=RANK((unsigned char)+0)
#pragma CMOD defexp SIZE=sizeof(unsigned char)

#pragma CMOD declaration
#define WIDTH C◼UCHAR_WIDTH

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼uchar uchar;
