// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼real◼is

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>

#pragma CMOD alias __isfinitef
#pragma CMOD alias __isinff
#pragma CMOD alias __isnanf
#pragma CMOD alias __isnormalf
#pragma CMOD alias __signbitf

#pragma CMOD alias __isfinite
#pragma CMOD alias __isinf
#pragma CMOD alias __isnan
#pragma CMOD alias __isnormal
#pragma CMOD alias __signbit

#pragma CMOD alias __isfinitel
#pragma CMOD alias __isinfl
#pragma CMOD alias __isnanl
#pragma CMOD alias __isnormall
#pragma CMOD alias __signbitl


#pragma CMOD define finite=isfinite
#pragma CMOD define inf=isinf
#pragma CMOD define nan=isnan
#pragma CMOD define normal=isnormal
#pragma CMOD define negative=signbit


#pragma CMOD define greater=isgreater
#pragma CMOD define greaterequal=isgreaterequal
#pragma CMOD define less=isless
#pragma CMOD define lessequal=islessequal
#pragma CMOD define lessgreater=islessgreater
#pragma CMOD define unordered=isunordered


#pragma CMOD declaration

int (__isfinitef)(float x);
int (__isinff)(float x);
int (__isnanf)(float x);
int (__isnormalf)(float x);
int (__signbitf)(float x);

int (__isfinite)(double x);
int (__isinf)(double x);
int (__isnan)(double x);
int (__isnormal)(double x);
int (__signbit)(double x);

int (__isfinitel)(long double x);
int (__isinfl)(long double x);
int (__isnanl)(long double x);
int (__isnormall)(long double x);
int (__signbitl)(long double x);
