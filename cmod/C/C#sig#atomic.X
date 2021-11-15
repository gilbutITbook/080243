// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼sig◼atomic
#pragma CMOD mimic <stdint.h>

#pragma CMOD defexp MAX=SIG_ATOMIC_MAX
#pragma CMOD defexp MIN1=SIG_ATOMIC_MIN+1

#pragma CMOD declaration

#define MIN (MIN1-1)

