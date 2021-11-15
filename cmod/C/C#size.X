// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼size
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <stdalign.h>

#pragma CMOD declaration

#pragma CMOD defexp MAX=(-sizeof(char))
#pragma CMOD defexp MIN=(sizeof(char) - sizeof(char))
#pragma CMOD defexp ALIGN=alignof(size_t)
#pragma CMOD defexp RANK=RANK(sizeof(char))

#pragma CMOD snippet none

#pragma CMOD declaration

typedef C◼size size;
