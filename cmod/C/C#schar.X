// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼schar
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp MAX=SCHAR_MAX
#pragma CMOD defexp MIN1=SCHAR_MIN+1
#pragma CMOD defexp ALIGN=alignof(signed char)
#pragma CMOD defexp RANK=RANK((signed char)+0)
#pragma CMOD defexp SIZE=sizeof(signed char)

#pragma CMOD declaration

#define MIN (MIN1-1)

#define WIDTH C◼SCHAR_WIDTH

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼schar schar;
