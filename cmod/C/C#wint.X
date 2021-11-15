// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼wint
#pragma CMOD mimic <stdint.h>
#pragma CMOD mimic <wchar.h>

#pragma CMOD defexp MAX=WINT_MAX
#pragma CMOD defexp MIN1=WINT_MIN+1
#pragma CMOD defexp RANK=RANK((wint_t)+0)

#pragma CMOD declaration

#define MIN (MIN1-1)

