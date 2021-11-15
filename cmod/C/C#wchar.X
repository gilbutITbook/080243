// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼wchar
#pragma CMOD mimic <stdint.h>

#pragma CMOD defexp MAX=WCHAR_MAX
#pragma CMOD defexp MIN1=WCHAR_MIN+1
#pragma CMOD defexp RANK=RANK(L'a')

#pragma CMOD declaration

#define MIN (MIN1-1)
#define WIDTH C◼WCHAR_WIDTH

typedef __typeof__(L'a') wchar;
