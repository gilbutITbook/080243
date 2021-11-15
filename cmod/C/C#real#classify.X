// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module classify = C◼real◼classify

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>

#pragma CMOD defexp NAN=◼FP_NAN
#pragma CMOD defexp NORMAL=◼FP_NORMAL
#pragma CMOD defexp SUBNORMAL=◼FP_SUBNORMAL
#pragma CMOD defexp ZERO=◼FP_ZERO
#pragma CMOD defexp INFINITE=◼FP_INFINITE

#pragma CMOD alias __fpclassifyf
#pragma CMOD alias __fpclassify

#pragma CMOD define classify=fpclassify

#pragma CMOD declaration

int (__fpclassifyf)(float x);
int (__fpclassify)(double x);
int (__fpclassifyl)(long double x);
