// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module dbl=C◼real◼double
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>


#pragma CMOD defexp HAS_SUBNORM=◼DBL_HAS_SUBNORM
#pragma CMOD defexp MANT_DIG=◼DBL_MANT_DIG
#pragma CMOD defexp DECIMAL_DIG=◼DBL_DECIMAL_DIG
#pragma CMOD defexp DIG=◼DBL_DIG
#pragma CMOD define HUGE=HUGE_VAL
#pragma CMOD defexp MIN_EXP=◼DBL_MIN_EXP
#pragma CMOD defexp MIN_10_EXP=◼DBL_MIN_10_EXP
#pragma CMOD defexp MAX_EXP=◼DBL_MAX_EXP
#pragma CMOD defexp MAX_10_EXP=◼DBL_MAX_10_EXP
#pragma CMOD defexp MAX=◼DBL_MAX
#pragma CMOD defexp MIN=◼DBL_MIN
#pragma CMOD defexp TRUE_MIN=◼DBL_TRUE_MIN
#pragma CMOD defexp EPSILON=DBL_EPSILON
#pragma CMOD defexp FAST_FMA=◼FP_FAST_FMA

#pragma CMOD defexp PI=4.0*atan(1.0)

#pragma CMOD alias acos
#pragma CMOD alias acosh
#pragma CMOD alias asin
#pragma CMOD alias asinh
#pragma CMOD alias atan
#pragma CMOD alias atan2
#pragma CMOD alias atanh
#pragma CMOD alias ceil
#pragma CMOD alias cbrt
#pragma CMOD alias copysign
#pragma CMOD alias cos
#pragma CMOD alias cosh
#pragma CMOD alias erf
#pragma CMOD alias erfc
#pragma CMOD alias exp
#pragma CMOD alias exp2
#pragma CMOD alias expm1
#pragma CMOD alias fabs
#pragma CMOD alias fdim
#pragma CMOD alias floor
#pragma CMOD alias fma
#pragma CMOD alias fmax
#pragma CMOD alias fmin
#pragma CMOD alias fmod
#pragma CMOD alias frexp
#pragma CMOD alias hypot
#pragma CMOD alias ilogb
#pragma CMOD alias ldexp
#pragma CMOD alias lgamma
#pragma CMOD alias llrint
#pragma CMOD alias llround
#pragma CMOD alias log
#pragma CMOD alias log10
#pragma CMOD alias log1p
#pragma CMOD alias log2
#pragma CMOD alias logb
#pragma CMOD alias lrint
#pragma CMOD alias lround
#pragma CMOD alias modf
#pragma CMOD alias nan
#pragma CMOD alias nearbyint
#pragma CMOD alias nextafter
#pragma CMOD alias nexttoward
#pragma CMOD alias pow
#pragma CMOD alias remainder
#pragma CMOD alias remquo
#pragma CMOD alias rint
#pragma CMOD alias round
#pragma CMOD alias scalbln
#pragma CMOD alias scalbn
#pragma CMOD alias sin
#pragma CMOD alias sinh
#pragma CMOD alias sqrt
#pragma CMOD alias tan
#pragma CMOD alias tanh
#pragma CMOD alias tgamma
#pragma CMOD alias trunc

#pragma CMOD typedef eval=double_t
#pragma CMOD declaration
typedef double dbl;

double (acos)(double);
double (acosh)(double);
double (asin)(double);
double (asinh)(double);
double (atan)(double);
double (atan2)(double, double);
double (atanh)(double);
double (cbrt)(double);
double (copysign)(double, double);
double (cos)(double);
double (cosh)(double);
double (erf)(double);
double (erfc)(double);
double (exp)(double);
double (exp2)(double);
double (expm1)(double);
double (fabs)(double);
double (fdim)(double, double);
double (ceil)(double);
double (floor)(double);
double (fma)(double, double, double);
double (fmax)(double, double);
double (fmin)(double, double);
double (fmod)(double, double);
double (frexp)(double, int*);
double (hypot)(double, double);
double (ldexp)(double, int);
double (lgamma)(double);
double (log)(double);
double (log10)(double);
double (log1p)(double);
double (log2)(double);
double (logb)(double);
double (modf)(double, double*);
double (nan)(const char*);
double (nearbyint)(double);
double (nextafter)(double, double);
double (nexttoward)(double, long double);
double (pow)(double, double);
double (remainder)(double, double);
double (remquo)(double, double, int*);
double (rint)(double);
double (round)(double);
double (scalbln)(double, long int);
double (scalbn)(double, int);
double (sin)(double);
double (sinh)(double);
double (sqrt)(double);
double (tan)(double);
double (tanh)(double);
double (tgamma)(double);
double (trunc)(double);
int (ilogb)(double);
long int (lrint)(double);
long int (lround)(double);
long long int (llrint)(double);
long long int (llround)(double);

