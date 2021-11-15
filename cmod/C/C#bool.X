// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼bool

#pragma CMOD declaration
#pragma CMOD mimic <stddef.h>
#define MIN 0
#define MAX 1
#define WIDTH 1
#pragma CMOD defexp RANK=RANK((_Bool)+0)
#pragma CMOD defexp SIZE=sizeof(_Bool)

#pragma CMOD snippet none
#pragma CMOD declaration

#define bool _Bool
#define false 0
#define true 1
#define true_false_are_defined 1
