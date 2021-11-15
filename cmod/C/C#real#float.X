// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module flt=C◼real◼float
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>


#pragma CMOD defexp HAS_SUBNORM=◼FLT_HAS_SUBNORM
#pragma CMOD defexp MANT_DIG=◼FLT_MANT_DIG
#pragma CMOD defexp DECIMAL_DIG=◼FLT_DECIMAL_DIG
#pragma CMOD defexp DIG=◼FLT_DIG
#pragma CMOD define HUGE=HUGE_VALF
#pragma CMOD defexp MIN_EXP=◼FLT_MIN_EXP
#pragma CMOD defexp MIN_10_EXP=◼FLT_MIN_10_EXP
#pragma CMOD defexp MAX_EXP=◼FLT_MAX_EXP
#pragma CMOD defexp MAX_10_EXP=◼FLT_MAX_10_EXP
#pragma CMOD defexp MAX=◼FLT_MAX
#pragma CMOD defexp MIN=◼FLT_MIN
#pragma CMOD defexp TRUE_MIN=◼FLT_TRUE_MIN
#pragma CMOD defexp EPSILON=◼FLT_EPSILON
#pragma CMOD define FAST_FMA=FP_FAST_FMAF

#pragma CMOD defexp PI=4.0f*atanf(1.0f)

#pragma CMOD alias acos=acosf
#pragma CMOD alias acosh=acoshf
#pragma CMOD alias asin=asinf
#pragma CMOD alias asinh=asinhf
#pragma CMOD alias atan=atanf
#pragma CMOD alias atan2=atan2f
#pragma CMOD alias atanh=atanhf
#pragma CMOD alias cbrt=cbrtf
#pragma CMOD alias ceil=ceilf
#pragma CMOD alias copysign=copysignf
#pragma CMOD alias cos=cosf
#pragma CMOD alias cosh=coshf
#pragma CMOD alias erf=erff
#pragma CMOD alias erfc=erfcf
#pragma CMOD alias exp=expf
#pragma CMOD alias exp2=exp2f
#pragma CMOD alias expm1=expm1f
#pragma CMOD alias fabs=fabsf
#pragma CMOD alias fdim=fdimf
#pragma CMOD alias floor=floorf
#pragma CMOD alias fma=fmaf
#pragma CMOD alias fmax=fmaxf
#pragma CMOD alias fmin=fminf
#pragma CMOD alias fmod=fmodf
#pragma CMOD alias frexp=frexpf
#pragma CMOD alias hypot=hypotf
#pragma CMOD alias ilogb=ilogbf
#pragma CMOD alias ldexp=ldexpf
#pragma CMOD alias lgamma=lgammaf
#pragma CMOD alias llrint=llrintf
#pragma CMOD alias llround=llroundf
#pragma CMOD alias log=logf
#pragma CMOD alias log10=log10f
#pragma CMOD alias log1p=log1pf
#pragma CMOD alias log2=log2f
#pragma CMOD alias logb=logbf
#pragma CMOD alias lrint=lrintf
#pragma CMOD alias lround=lroundf
#pragma CMOD alias modf=modff
#pragma CMOD alias nan=nanf
#pragma CMOD alias nearbyint=nearbyintf
#pragma CMOD alias nextafter=nextafterf
#pragma CMOD alias nexttoward=nexttowardf
#pragma CMOD alias pow=powf
#pragma CMOD alias remainder=remainderf
#pragma CMOD alias remquo=remquof
#pragma CMOD alias rint=rintf
#pragma CMOD alias round=roundf
#pragma CMOD alias scalbln=scalblnf
#pragma CMOD alias scalbn=scalbnf
#pragma CMOD alias sin=sinf
#pragma CMOD alias sinh=sinhf
#pragma CMOD alias sqrt=sqrtf
#pragma CMOD alias tan=tanf
#pragma CMOD alias tanh=tanhf
#pragma CMOD alias tgamma=tgammaf
#pragma CMOD alias trunc=truncf

#pragma CMOD typedef eval=float_t
#pragma CMOD declaration
typedef float flt;

float (acos)(float);
float (acosh)(float);
float (asin)(float);
float (asinh)(float);
float (atan)(float);
float (atan2)(float, float);
float (atanh)(float);
float (cbrt)(float);
float (copysign)(float, float);
float (cos)(float);
float (cosh)(float);
float (erf)(float);
float (erfc)(float);
float (exp)(float);
float (exp2)(float);
float (expm1)(float);
float (fabs)(float);
float (fdim)(float, float);
float (ceil)(float);
float (floor)(float);
float (fma)(float, float, float);
float (fmax)(float, float);
float (fmin)(float, float);
float (fmod)(float, float);
float (frexp)(float, int*);
float (hypot)(float, float);
float (ldexp)(float, int);
float (lgamma)(float);
float (log)(float);
float (log10)(float);
float (log1p)(float);
float (log2)(float);
float (logb)(float);
float (modf)(float, float*);
float (nan)(const char*);
float (nearbyint)(float);
float (nextafter)(float, float);
float (nexttoward)(float, long double);
float (pow)(float, float);
float (remainder)(float, float);
float (remquo)(float, float, int*);
float (rint)(float);
float (round)(float);
float (scalbln)(float, long int);
float (scalbn)(float, int);
float (sin)(float);
float (sinh)(float);
float (sqrt)(float);
float (tan)(float);
float (tanh)(float);
float (tgamma)(float);
float (trunc)(float);
int (ilogb)(float);
long int (lrint)(float);
long int (lround)(float);
long long int (llrint)(float);
long long int (llround)(float);
